// SPDX-License-Identifier: MIT
//状态变量不能像函数一样 通过在子合约中重声明来覆盖
pragma solidity ^0.8.13;

contract A{
    string public name="contract A";

    function getName() public view returns (string memory){
        return name;
    }
}

contract C is A{
    //不能直接写 string public name ="合约b";
    constructor(){
        name="contract C";
    }
}