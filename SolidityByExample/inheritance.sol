// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
// virtual 代表可以被子合约覆盖
//override代表可以覆盖父合约
//pure修饰的函数既不能改也不能读状态变量 否则编译无法通过
//view只能读状态变量但不能改
//super关键字将调用最近的父合约函数  or  it will call all parents functions?
contract A{
    function foo() public pure virtual returns(string memory){
        return "A";
    }
}

contract B is A{
    function foo() public pure virtual override returns (string memory){
        return "B";
    }
}

contract C is A{
    function foo() public pure virtual override returns (string memory){
        return "C";
    }
}

contract D is B,C{
    function foo() public  pure override(B,C) returns(string memory){
        return super.foo(); //调用C
}
}

contract E is C,B{
    function foo() public pure override(C,B) returns(string memory){
        return super.foo(); //调用B
    }
}

contract F is A,B{
    function foo() public pure override(A,B) returns(string memory){
        return super.foo();
    }
}