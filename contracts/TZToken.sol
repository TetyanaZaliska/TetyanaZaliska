// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC20.sol";

contract TZToken is ERC20 {
    constructor() ERC20("TZToken", "TZT") {
        _mint(msg.sender, 1000000000);
    }
}