require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks:{
    sepolia: {
      chainId: 11155111,
      url: process.env.ALCHEMY_RINKEBY_URL,
      accounts: [process.env.myprivatekey],
    },
  }
};
