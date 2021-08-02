// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC20.sol";

contract TZTokens is ERC20 {
    constructor() ERC20("TZTokens", "TZT") {
        _mint(msg.sender, 1000000000);
    }
}