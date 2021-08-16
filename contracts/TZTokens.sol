// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC20.sol";

contract TZTokens is ERC20 {
    constructor() ERC20("TZTokens", "TZT") {
        _mint(msg.sender, 1000000000);
    }

    function mint(address account, uint256 amount) public virtual {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) public virtual {
        _burn(account, amount);
    }

    function approveInternal(
        address owner,
        address spender,
        uint256 amount
    ) public virtual {
        _approve(owner, spender, amount);
    }

    function transferInternal(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual {
        _transfer(sender, recipient, amount);
    }
}