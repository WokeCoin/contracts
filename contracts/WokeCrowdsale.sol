pragma solidity ^0.4.19;

import 'openzeppelin-solidity/contracts/crowdsale/distribution/FinalizableCrowdsale.sol';
import 'openzeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol';
import 'openzeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol';
import 'openzeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol';


contract WokeCrowdsale is TimedCrowdsale, MintedCrowdsale, CappedCrowdsale, FinalizableCrowdsale {
    function WokeCrowdsale
        (
            uint256 _openingTime,
            uint256 _closingTime,
            uint256 _rate,
            uint256 _cap,
            address _wallet,
            MintableToken _token
        )
        public
        Crowdsale(_rate, _wallet, _token)
        CappedCrowdsale(_cap)
        TimedCrowdsale(_openingTime, _closingTime) {

        }

    function finalization() internal {
        super.finalization();

        uint256 totalSold = token.totalSupply();
        uint256 thirtyPercent = (3 * totalSold) / 7;

        MintableToken(token).mint(wallet, thirtyPercent);
    }
}
