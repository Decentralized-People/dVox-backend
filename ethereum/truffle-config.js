const HDWalletProvider = require("@truffle/hdwallet-provider");

require('dotenv').config() 

module.exports = {
  networks: {
    // main: {
    //   host: "127.0.0.1",
    //   port: 7545,
    //   network_id: "*" // Match any network id
    // },
      //  ethereum network()
    rinkeby: {
      provider: () =>
        new HDWalletProvider({
          mnemonic: {
            phrase: process.env.MNENOMIC
          },
          providerOrUrl: "https://rinkeby.infura.io/v3/" + process.env.INFURA_API_KEY,
          numberOfAddresses: 1,
          shareNonce: true,
        }),
      network_id: '4',
    },
    goerli: {
      provider: () =>
      new HDWalletProvider({
        mnemonic: {
          phrase: process.env.MNENOMIC
        },
        providerOrUrl: "https://goerli.infura.io/v3/" + process.env.INFURA_API_KEY,
        numberOfAddresses: 1,
        shareNonce: true,
      }),
      network_id: 5, // Goerli's id
      confirmations: 2, // # of confirmations to wait between deployments. (default: 0)
      timeoutBlocks: 200, // # of blocks before a deployment times out  (minimum/default: 50)
      skipDryRun: true, // Skip dry run before migrations? (default: false for public nets )
  },
  sepolia: {
    provider: () =>
    new HDWalletProvider({
      mnemonic: {
        phrase: process.env.MNENOMIC
      },
      providerOrUrl: "https://sepolia.infura.io/v3/" + process.env.INFURA_API_KEY,
      numberOfAddresses: 1,
      shareNonce: true,
    }),
    network_id: 11155111, // Goerli's id
},
    
  },
  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  },
  compilers: {
    solc: {
       version: "0.8.7",   
    }
  },

}
