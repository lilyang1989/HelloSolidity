// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Immutable {
    // 与常量类似，但常量在编译后永远不能更改，而immutable在结构体内可以设置
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}
