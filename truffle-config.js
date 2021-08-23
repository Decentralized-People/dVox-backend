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
    }
    
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
