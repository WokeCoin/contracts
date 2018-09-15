const HDWalletProvider = require("truffle-hdwallet-provider-privkey");

var privkey = "";

module.exports = {
  networks: {
    dev: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*", // match any network
      gas: 4600000,
      gasPrice: 5 * 1000000000,
    },
    ropsten: {
      provider: function() {
        return new HDWalletProvider(privkey, "https://ropsten.infura.io/");
      },
      gas: 4600000,
      gasPrice: 50 * 1000000000,
      network_id: "3",
    },
  },
};
