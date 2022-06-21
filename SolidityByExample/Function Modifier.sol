// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
//本节讲的是函数修饰符
contract FunctionModifier {
//我们将用以下变量来演示如何使用函数修饰符
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        //将交易发起者作为合约的owner
        owner = msg.sender;
    }

    //用修饰符来确认调用合约的人
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    // Modifiers can take inputs. This modifier checks that the
    // address passed in is not the zero address.
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // it is still executing.
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}
