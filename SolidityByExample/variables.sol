// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
/*
变量共有三种形式：
局部变量local variables：在函数内声明，不存储在区块链上
状态变量state variables：在函数外声明，存储在区块链上
全局变量global variables：保存在全局命名变量，用来获取区块链上相关信息的特殊变量
*/
contract Variables {
    // 状态变量的例子
    string public text = "Hello";
    uint public num = 123;

    function doSomething() public {
        // 局部变量的例子
        uint i = 456;

        // 全局变量的例子
        uint timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; // address of the caller
    }
}
