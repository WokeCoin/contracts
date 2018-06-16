pragma solidity ^0.4.19;

import 'openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol';

contract WokeToken is MintableToken {
    string public name = "Woke Coin";
    string public symbol = "WKX";
    uint8 public decimals = 18;
}
