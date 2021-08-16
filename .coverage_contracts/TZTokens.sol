// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
function c_0x6fb2f512(bytes32 c__0x6fb2f512) pure {}


import "./ERC20.sol";

contract TZTokens is ERC20 {
function c_0x259573ee(bytes32 c__0x259573ee) public pure {}

    constructor() ERC20("TZTokens", "TZT") {c_0x259573ee(0x5c6633291f14f9c67431e0daab7a55c1ea8b99272063d84795623e4cc8a3f666); /* function */ 

c_0x259573ee(0xc8981b8d912106f415f8e2965a3a35284ef8e2845552017fa58e7fe440b64e95); /* line */ 
        c_0x259573ee(0x7b3eeab1de5b8e6144bfd10f747b3fc008cd54158fc5910178b3e8075214cb7a); /* statement */ 
_mint(msg.sender, 1000000000);
    }

    function mint(address account, uint256 amount) public virtual {c_0x259573ee(0x2f6c3d2709fba7e10fb54f8b7e36841d0a4b6bc2981daeb90b908afb4fb0fa98); /* function */ 

c_0x259573ee(0x2a1bcf1d9c7d2c1e5a8d12f8ffeb99396d841ec7509066841bdabd1c29aebd15); /* line */ 
        c_0x259573ee(0x0199cf909577effa5804bbb4d6bf36b3fddf44fd9e7118fb3cbd9200b605bbd7); /* statement */ 
_mint(account, amount);
    }

    function burn(address account, uint256 amount) public virtual {c_0x259573ee(0x9b7d5bfa47eae91a3493d20d03d068bddf44fdfa29f4c37eac2cae3c9a81d864); /* function */ 

c_0x259573ee(0xeb9a657611b9dd29355b0f40a9b3d2071fb80321702f7f2995d07997374ca5c2); /* line */ 
        c_0x259573ee(0xda1a457e5c00ae060ee001e04b4871cfa7e16c5f00634fd71a0f5aec2c668ba8); /* statement */ 
_burn(account, amount);
    }

    function approveInternal(
        address owner,
        address spender,
        uint256 amount
    ) public virtual {c_0x259573ee(0xed39d46e4eeb9a5b68b57e7cca3a67ddd5c4ed571bf113a2f2580c5c017e294f); /* function */ 

c_0x259573ee(0xd96293ba65349f0c71e9ae6c4caa76edda10f59fd9a5223e4fd529b4cd618c2d); /* line */ 
        c_0x259573ee(0x20b24308bd4c91059a506ebdd5bfb6d809f4da399b4476e6c5ecc7ef03fd056e); /* statement */ 
_approve(owner, spender, amount);
    }
}