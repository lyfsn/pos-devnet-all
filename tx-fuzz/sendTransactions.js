const { ethers } = require("ethers");
const AsyncLock = require("async-lock");

const nonceLock = new AsyncLock();
const url = "http://88.99.94.109:8545/";
const provider = new ethers.providers.JsonRpcProvider(url);

async function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

let nonceStatus = {};

// Function to get and update the nonce for a given address
async function getAndUpdateNonce(address) {
  return nonceLock.acquire(address, async () => {
    let minFailedNonce = Number.MAX_SAFE_INTEGER;
    let lastSuccessNonce = -1;

    for (const [n, status] of Object.entries(nonceStatus)) {
      const numN = Number(n);
      if (status === 0 && numN < minFailedNonce) {
        minFailedNonce = numN;
      }
      if (status === 1 && numN > lastSuccessNonce) {
        lastSuccessNonce = numN;
      }
    }

    if (minFailedNonce !== Number.MAX_SAFE_INTEGER) {
      nonceStatus[minFailedNonce] = 1;
      return minFailedNonce;
    }

    if (lastSuccessNonce >= 0) {
      const nextNonce = lastSuccessNonce + 1;
      nonceStatus[nextNonce] = 1;
      return nextNonce;
    }

    try {
      const networkNonce = await provider.getTransactionCount(address, "latest");
      nonceStatus[networkNonce] = 1;
      return networkNonce;
    } catch (error) {
      throw error;
    }
  });
}

// Function to send a transaction
async function sendTransaction(sender, receiver, amountInWei) {
  const senderWallet = new ethers.Wallet(sender.privateKey, provider);
  const txNonce = await getAndUpdateNonce(sender.address);

  const tx = {
    nonce: txNonce,
    to: receiver.address,
    value: amountInWei,
    gasPrice: ethers.utils.parseUnits("1", "gwei"),
  };

  try {
    await senderWallet.sendTransaction(tx);
    nonceStatus[txNonce] = 1;
  } catch (error) {
    nonceStatus[txNonce] = 0;
    // Handle specific errors as needed
  }
  console.log(`Sent ${amountInWei} wei from ${sender.address} to ${receiver.address}`);
}

// Main function
async function main() {
  let amountInWei = ethers.utils.parseEther("0.001");
  let i = 0;
  while (true) {
    try {
      amountInWei = amountInWei.add(1);

      const pLimit = (await import("p-limit")).default;
      const limit = pLimit(64);

      let sender = {
        address: "0xE25583099BA105D9ec0A67f5Ae86D90e50036425",
        privateKey: "39725efee3fb28614de3bacaffe4cc4bd8c436257e2c8bb887c4b5c4be45e76d",
      };

      let wallet = ethers.Wallet.createRandom();
      let receiver = {
        address: wallet.address,
        privateKey: wallet.privateKey,
      };

      let numberOfTransactions = 1;
      for (let j = 0; j < numberOfTransactions; j++) {
        await sleep(5000);
        amountInWei = amountInWei.add(1);
        limit(() => sendTransaction(sender, receiver, amountInWei));
      }

      i = (i + 1) % 1000001;
      await sleep(5000);
    } catch (error) {
      // Error handling for the main function
    }
  }
}

main().catch((error) => {
  // Error handling for main function failure
});
