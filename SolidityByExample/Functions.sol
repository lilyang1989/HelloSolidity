// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//有很多种方式来返回函数的值
contract Function {
    // 函数可以返回多种不同的值
    function returnMany()
        public
        pure
        returns (
            uint,
            bool,
            uint
        )
    {
        return (1, true, 2);
    }

    // 返回的值可以被重命名
    function named()
        public
        pure
        returns (
            uint x,
            bool b,
            uint y
        )
    {
        return (1, true, 2);
    }

    // 返回的值可直接安排到他们的名称上
    // 此例中最后的return语句可以省略
    function assigned()
        public
        pure
        returns (
            uint x,
            bool b,
            uint y
        )
    {
        x = 1;
        b = true;
        y = 2;
    }
        //也可以用来返回调用的函数 比如一次性返回两个
    function f()public returns(uint){
        return 1;
    }
    function g()public returns(uint){
        return 2;
    }
    function callTwo() public returns(uint,uint){
        return (f(),g());
    }
    //当调用另一个返回多种数据类型的函数的时候采用解构赋值
    function destructuringAssignments()
        public
        pure
        returns (
            uint,
            bool,
            uint,
            uint,
            uint
        )
    {
        (uint i, bool b, uint j) = returnMany();

        // 在这种情况下，假如只需要第一、第三个变量 可以直接把第二个省略
        (uint x, , uint y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // 输入和输出都不能用map
    //输入和输出都可以使用数组
    function arrayInput(uint[] memory _arr) public {}

 
    uint[] public arr;

    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }
}
