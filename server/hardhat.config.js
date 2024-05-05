require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */

// module.exports = {
//   solidity: "0.8.4",
//   networks: {
//     sepolia: {
//       chainId: 11155111,
//       url: process.env.ALCHEMY_RINKEBY_URL,
//       accounts: [process.env.myprivatekey],
//     },
//   },
// };


module.exports = {
  defaultNetwork: "sepolia",
  networks: {
    hardhat: {
    },
    sepolia: {
      url: "https://eth-sepolia.g.alchemy.com/v2/l4JsaJpU4kWI5bvvPM_WDRMkAzLNBL_x",
      accounts: [process.env.myprivatekey]
    }
  },
  solidity: {
    version: "0.8.4",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  mocha: {
    timeout: 40000
  }
}
