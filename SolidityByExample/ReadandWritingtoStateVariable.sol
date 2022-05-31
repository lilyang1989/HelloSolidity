// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
// 为了写或者更新状态变量 需要进行一次转账
//也就是说度读状态变量不需任何费用
contract SimpleStorage {
    // State variable to store a number
    uint public num;

    // You need to send a transaction to write to a state variable.
    function set(uint _num) public {
        num = _num;
    }

    // You can read from a state variable without sending a transaction.
    function get() public view returns (uint) {
        return num;
    }
}
