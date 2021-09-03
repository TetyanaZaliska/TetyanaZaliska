// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./IERC20.sol";
/*
library Balances {
    function move(mapping(address => uint256) storage balances, address from, address to, uint amount) internal {
        require(balances[from] >= amount);
        require(balances[to] + amount >= balances[to]);
        balances[from] -= amount;
        balances[to] += amount;
    }
}*/

contract Deposit{
    //using Balances for *;

    address private _owner; 
 
    mapping(address => uint256) private _balances;  

    mapping (address => mapping (address => uint256)) private _tokenBalances;
    mapping(address => bool) private _tokenAllow;  

    event DepositEth(address from, uint256 value);
    event DepositToken(address token, address from, address to, uint256 value);
    
    event WithdrawEth(address from, uint256 value);
    event WithdrawToken(address token, address to, uint256 value);

    constructor() {
        _owner = msg.sender;
    } 

    modifier onlyOwner() {
        require(
            msg.sender == _owner,
            "Only owner can call this function."
        );
        _;
    }

    function depositEth() payable external {
        require(msg.sender != address(0), "ERC20: transfer from the zero address");  
        require(_balances[msg.sender] + msg.value >= _balances[msg.sender], "ERC20: deposit amount has to be positive");

        _balances[msg.sender] += msg.value; 
 
        emit DepositEth(msg.sender, msg.value);
    }

    function depositToken(address token) payable external { 
        require(_tokenAllow[token], "Token: not allowed");
        require(msg.sender != address(0), "Token: transfer from the zero address");  
        require(_tokenBalances[token][msg.sender] + msg.value >= _tokenBalances[token][msg.sender], "Token: deposit amount has to be positive");

        bool isOk = IERC20(token).transferFrom(msg.sender, address(this), msg.value);
        require(isOk, "Token: transfer error");

        _tokenBalances[token][msg.sender] += msg.value;
 
        emit DepositToken(token, msg.sender, address(this), msg.value);
    }


    function getBalanceEth(address spender) public view returns (uint256) {
        return _balances[spender];
    } 

    function getBalanceToken(address token, address spender) public view returns (uint256) {
        return _tokenBalances[token][spender];
    } 

    function addAllow(address token, bool isAllow) onlyOwner() public returns (bool) {  
        _tokenAllow[token] = isAllow; 
        return true;
    }

    function withdrawEth(uint256 amount) payable external {
        require(msg.sender != address(0), "ERC20: transfer from the zero address"); 

        require(_balances[msg.sender] >= amount, "ERC20: insufficient funds");
        require(_balances[msg.sender] + amount >= _balances[msg.sender], "ERC20: withdraw amount has to be positive");
 
        _balances[msg.sender] -= amount;

        payable(msg.sender).transfer(amount);
  
        emit WithdrawEth(msg.sender, amount);
    }

    
    function withdrawToken(address token, uint256 amount) internal {
        require(_tokenAllow[token], "Token: not allowed");

        require(_tokenBalances[token][msg.sender] >= amount, "ERC20: insufficient funds");
        require(_tokenBalances[token][msg.sender] + amount >= _tokenBalances[token][msg.sender], "ERC20: withdraw amount has to be positive");

        bool isOk = IERC20(token).transfer(msg.sender, amount);
        require(isOk, "Token: transfer error");

        _tokenBalances[token][msg.sender] -= amount;
 
        emit WithdrawToken(token, msg.sender, amount);
    }
 
}