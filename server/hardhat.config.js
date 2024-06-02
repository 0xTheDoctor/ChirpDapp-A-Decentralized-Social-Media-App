require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */

module.exports = {
  solidity: "0.8.4",
  networks: {
    holesky: {
      chainId: 17000,
      url: process.env.ALCHEMY_URL,
      accounts: [process.env.myprivatekey],
    },
  },
};


