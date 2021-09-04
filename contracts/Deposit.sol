// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./IERC20.sol";
import "./utils/Context.sol";
/*
library Balances {
    function move(mapping(address => uint256) storage balances, address from, address to, uint amount) internal {
        require(balances[from] >= amount);
        require(balances[to] + amount >= balances[to]);
        balances[from] -= amount;
        balances[to] += amount;
    }
}*/

contract Deposit is Context{
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
        _owner = _msgSender();
    } 

    modifier onlyOwner() {
        require(
            _msgSender() == _owner,
            "Only owner can call this function."
        );
        _;
    }

    function depositEth() payable external {
        require(_msgSender() != address(0), "Deposit: transfer from the zero address");  
        require(_balances[_msgSender()] + _msgValue() >= _balances[_msgSender()], "Deposit: deposit amount has to be positive");

        _balances[_msgSender()] += _msgValue(); 
 
        emit DepositEth(_msgSender(), _msgValue());
    }

    function depositToken(address token) payable external { 
        require(_tokenAllow[token], "Token: not allowed");
        require(_msgSender() != address(0), "Token: transfer from the zero address");  
        require(_tokenBalances[token][_msgSender()] + _msgValue() >= _tokenBalances[token][_msgSender()], "Token: deposit amount has to be positive");

        bool isOk = IERC20(token).transferFrom(_msgSender(), address(this), _msgValue());
        require(isOk, "Token: transfer error");

        _tokenBalances[token][_msgSender()] += _msgValue();
 
        emit DepositToken(token, _msgSender(), address(this), _msgValue());
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
        require(_msgSender() != address(0), "Deposit: transfer from the zero address"); 

        require(_balances[_msgSender()] >= amount, "Deposit: insufficient funds");
        require(_balances[_msgSender()] + amount >= _balances[_msgSender()], "Deposit: withdraw amount has to be positive");
 
        _balances[_msgSender()] -= amount;

        payable(_msgSender()).transfer(amount);
  
        emit WithdrawEth(_msgSender(), amount);
    }

    
    function withdrawToken(address token, uint256 amount) internal {
        require(_tokenAllow[token], "Token: not allowed");

        require(_tokenBalances[token][_msgSender()] >= amount, "Deposit: insufficient funds");
        require(_tokenBalances[token][_msgSender()] + amount >= _tokenBalances[token][_msgSender()], "Deposit: withdraw amount has to be positive");

        bool isOk = IERC20(token).transfer(_msgSender(), amount);
        require(isOk, "Token: transfer error");

        _tokenBalances[token][_msgSender()] -= amount;
 
        emit WithdrawToken(token, _msgSender(), amount);
    }
 
}