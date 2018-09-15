pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/crowdsale/distribution/FinalizableCrowdsale.sol';
import 'openzeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol';
import 'openzeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol';
import 'openzeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol';
import 'openzeppelin-solidity/contracts/math/SafeMath.sol';


contract WokeCrowdsale is TimedCrowdsale, MintedCrowdsale, CappedCrowdsale, FinalizableCrowdsale {
    using SafeMath for uint256;

    address tenPercentWallet;

    constructor(
            uint256 _openingTime,
            uint256 _closingTime,
            uint256 _rate,
            uint256 _cap,
            address _wallet,
            address _tenPercentWallet,
            MintableToken _token
    ) public
        Crowdsale(_rate, _wallet, _token)
        CappedCrowdsale(_cap)
        TimedCrowdsale(_openingTime, _closingTime) {
            tenPercentWallet = _tenPercentWallet;
        }

    function finalization() internal {
        super.finalization();

        uint256 totalSold = token.totalSupply();
        uint256 tenPercent = totalSold.div(9);

        MintableToken(token).mint(tenPercentWallet, tenPercent);
    }
}
