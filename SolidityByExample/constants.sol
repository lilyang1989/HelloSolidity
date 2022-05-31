// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
//常量的值不能被修改，用常量可以省gas
contract Constants {
    // 习惯用大写字母来表示常量
   // coding convention to uppercase constant variables
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public constant MY_UINT = 123;
}
