// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SavingsBank{

    address payable public user ;

    constructor(){
        user = payable(msg.sender);
    }

    function deposit() public payable{

    }

    function getBalance()public view returns(uint){
        return address(this).balance;
    }

    function withdraw(uint _amount) public {
        // only owner can withdraw
        require(msg.sender == user, "Access Denied: Only owner can withdraw");

        // filter: cannot withdraw more than balance
        require(_amount <= address(this).balance, "Insufficient Balance");

        // transfer ETH
        (bool sent, ) = user.call{value: _amount}("");
        require(sent, "Transfer Failed");

    }
}