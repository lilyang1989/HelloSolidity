// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Base contract X
contract X {
    string public name;
    constructor(string memory _name) {
        name = _name;
    }
}

// Base contract Y
contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

//两种方式来初始化带有参数的合约

// 在继承时传参
contract B is X("Input to X"), Y("Input to Y") {

}

contract C is X, Y {
  //在这里用构造器传参
  //和函数修饰符差不多
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

//父级构造器被调用的顺序按照继承时的顺序来，与子合约中的构造器中的顺序无关
// Order of constructors called:
// 1. X
// 2. Y
// 3. D
contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}

// Order of constructors called:
// 1. X
// 2. Y
// 3. E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}
