const { ethers } = require("ethers");
const fs = require("fs");
const AsyncLock = require("async-lock");

const nonceLock = new AsyncLock();

const url = "http://88.99.94.109:8545/";
const provider = new ethers.providers.JsonRpcProvider(url);

async function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

let nonceStatus = {};
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
      const networkNonce = await provider.getTransactionCount(
        address,
        "latest"
      );
      nonceStatus[networkNonce] = 1;
      return networkNonce;
    } catch (error) {
      console.error("Error fetching nonce:", error);
      throw error;
    }
  });
}

async function sendTransaction(sender, receiver, amountInWei) {
  const senderWallet = new ethers.Wallet(sender.privateKey, provider);
  const txNonce = await getAndUpdateNonce(sender.address);
  const blockNumberSent = await provider.getBlockNumber();
  const blockSent = await provider.getBlock(blockNumberSent);
  const transactionsCountSent = blockSent.transactions.length;

  const tx = {
    nonce: txNonce,
    to: receiver.address,
    value: amountInWei,
    gasPrice: ethers.utils.parseUnits("1", "gwei"),
  };

  try {
    const txResponse = await senderWallet.sendTransaction(tx);
    console.log(
      "send nonce:",
      txNonce,
      "tx hash:",
      txResponse.hash,
      "amount:",
      ethers.utils.formatEther(amountInWei),
      "receiver:",
      receiver.address
    );
    const txData = {
      hash: txResponse.hash,
      nonce: txNonce,
      amount: amountInWei,
      blockSent: blockNumberSent,
      transCountSent: transactionsCountSent,
    };

    fs.appendFileSync(
      "pendingTransactions.json",
      JSON.stringify(txData) + "\n"
    );

    nonceStatus[txNonce] = 1;
  } catch (error) {
    nonceStatus[txNonce] = 0;
    if (error.message.includes("already known")) {
    } else if (error.message.includes("replacement transaction underpriced")) {
      console.log("replacement transaction underpriced");
    } else if (error.message.includes("nonce too low")) {
      nonceStatus[txNonce] = 1;
      console.log("nonce too low", txNonce);
    } else if (error.message.includes("replacement fee too low")) {
      console.log("replacement fee too low");
      nonceStatus[txNonce] = 1;
    } else if (error.message.includes("max fee per gas less than block")) {
      console.log("max fee per gas less than block");
      await fetchAndUpdateFeeData();
    } else {
      console.log("unknown error");
    }
  }
}

async function main() {
  let amountInWei = ethers.utils.parseEther("0.001");

  let i = 0;
  while (true) {
    try {
      amountInWei = amountInWei.add(1);

      const pLimit = (await import("p-limit")).default;
      const limit = pLimit(64);

      let sender = {
        address: "0x8943545177806ED17B9F23F0a21ee5948eCaa776",
        privateKey:
          "bcdf20249abf0ed6d944c0288fad489e33f66b3960d9e6229c1cd214ed3bbe31",
      };

      let wallet = ethers.Wallet.createRandom();
      let receiver = {
        address: wallet.address,
        privateKey: wallet.privateKey,
      };

      let numberOfTransactions = Math.floor(Math.random() * 100) + 1;
      numberOfTransactions = 1;
      for (let j = 0; j < numberOfTransactions; j++) {
        amountInWei = amountInWei.add(1);
        limit(() => sendTransaction(sender, receiver, amountInWei));
      }
     

      i = (i + 1) % 1000001;
      await sleep(100);
    } catch (error) {
      console.log(error);
    }
  }
}

main().catch((error) => {
  console.error("Error in main:", error);
});
