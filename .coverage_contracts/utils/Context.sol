// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
function c_0x1c05fbb8(bytes32 c__0x1c05fbb8) pure {}


/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
function c_0xdb6a53a0(bytes32 c__0xdb6a53a0) public pure {}

    function _msgSender() internal view virtual returns (address) {c_0xdb6a53a0(0x84ebd30c151ba60f75d0a0e1e85497fe2fac19c16c4ce1d7ca7bff68cf9868c6); /* function */ 

c_0xdb6a53a0(0xe5d013de05efc9a40493e777a8cfceac534f4d6c092b82412cfa53f6f03ff19f); /* line */ 
        c_0xdb6a53a0(0x7cbaab816980b7d0550e0efe1c6796593168c6515fa42551ab4566be00e5b0f4); /* statement */ 
return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {c_0xdb6a53a0(0xa882741634e47571d34d4b66d3175b9e80906b069ca07677d6d714354e341d7a); /* function */ 

c_0xdb6a53a0(0x8c52ad261d44ca682e36d83ec3c9bb83b7d2cbf1d45a178e7a815845a32864f4); /* line */ 
        c_0xdb6a53a0(0x8178f72dc3babdd306da17b081b4ae6b73554eddb3585e8bd78b77efebd8fe35); /* statement */ 
return msg.data;
    }
}
