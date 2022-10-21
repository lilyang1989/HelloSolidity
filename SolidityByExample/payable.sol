// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract payable{
    address payable public owner;

    constructor() payable{
        owner=payable(msg.sender);
    }

    function deposit() public payable{}
    function notPayable() public {}
    function withdraw() public{
        uint amount=address(this).balance;
         
    }
 }