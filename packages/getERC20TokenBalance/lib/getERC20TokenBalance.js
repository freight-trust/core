"use strict";

module.exports = getErc20TokenBalance;

function getERC20TokenBalance(tokenAddress, walletAddress, callback) {
  let minABI = [
    {
      constant: true,
      inputs: [{ name: "_owner", type: "address" }],
      name: "balanceOf",
      outputs: [{ name: "balance", type: "uint256" }],
      type: "function",
    },

    {
      constant: true,
      inputs: [],
      name: "decimals",
      outputs: [{ name: "", type: "uint8" }],
      type: "function",
    },
  ];

  let contract = web3.eth.contract(minABI).at(tokenAddress);
  contract.balanceOf(walletAddress, (error, balance) => {
    contract.decimals((error, decimals) => {
      balance = balance.div(10 ** decimals);
      console.log(balance.toString());
      callback(balance);
    });
  });
}

function onAddressChange(e) {
  let tokenAddress = document.getElementById("token-address").value;
  let walletAddress = document.getElementById("wallet-address").value;
  if (tokenAddress != "" && walletAddress != "") {
    getERC20TokenBalance(tokenAddress, walletAddress, (balance) => {
      document.getElementById("result").innerText = balance.toString();
    });
  }
}

window.onload = function () {
  if (typeof web3 !== "undefined") {
    web3 = new Web3(web3.currentProvider);
  } else {
    web3 = new Web3(
      new Web3.providers.HttpProvider("https://mainnet.infura.io")
    );
  }
  console.log(web3.version);
};
