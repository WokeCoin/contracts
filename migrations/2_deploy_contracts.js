const WokeToken = artifacts.require('./WokeToken.sol');
const WokeCrowdsale = artifacts.require('./WokeCrowdsale.sol');

module.exports = function(deployer, network, accounts) {
    const openingTime = TBD;
    const closingTime = TBD;
    const rate = new web3.BigNumber(10000);
    const cap = web3.toWei(TBD, "ether"); // total ether contribution
    const wallet = "TBD";

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
