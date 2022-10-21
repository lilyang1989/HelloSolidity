// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//直接调用和用关键字调用的区别： 直接调用只会调用辈分离自己最近的父合约 而用关键字则会调用所以的parent function
contract A{
    event log(string message);//定义输出日志的数据类型

    function foo() public virtual{
        emit log("A foo called");
    }
    function bar() public virtual{
        emit log("abar is called");
    }
}

contract B is A{
    function foo() public virtual override{
        emit log("b foo is called");
        A.foo();
    }
    function bar()public virtual override{
        emit log("b bar is called");
        super.bar();
    }
}

contract C is A{
    function foo() public virtual override{
        emit log("c.foo called");
        A.foo();
    }

    function bar() public virtual override{
        emit  log("c bar is called");
        super.bar();
    }
}

contract  D is B,C{
    function foo()public override(B,C){
        super.foo();
    }
    function bar() public override(B,C){
        super.bar();
    }
}
