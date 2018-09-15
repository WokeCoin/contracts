const WokeToken = artifacts.require('./WokeToken.sol');
const WokeCrowdsale = artifacts.require('./WokeCrowdsale.sol');

module.exports = function(deployer, network, accounts) {
    const openingTime = 'TBD';
    const closingTime = 'TBD';
    const rate = new web3.BigNumber(10000);
    const cap = web3.toWei("1011.22299", "ether"); // total ether contribution
    const wallet = "0x63aad63d30528edfb98bd630e8f1d31f4287a8ed";
    const tenPercentWallet = "TBD";

    return deployer
        .then(() => {
            return deployer.deploy(WokeToken);
        })
        .then(() => {
            return deployer.deploy(
                WokeCrowdsale,
                openingTime,
                closingTime,
                rate,
                cap,
                wallet,
                tenPercentWallet,
                WokeToken.address
            );
        })
        .then(() => {
            Promise.all([
              WokeToken.deployed(),
              WokeCrowdsale.deployed(),
            ]).then(([token, crowdsale]) => {
              return token.transferOwnership(crowdsale.address);
            });
        });
};
