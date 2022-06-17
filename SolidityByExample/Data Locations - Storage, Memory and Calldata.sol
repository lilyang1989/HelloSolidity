// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//所以复杂类型必须显式指定其存储的数据位置，用三种可选的数据位置
// storage-存储       直接永久存在区块链上
//memory- 内存  只有在函数被调用的时候存在 执行完毕后就会被销毁
//calldata   只读的 用来存储函数参数

contract DataLocations {
    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f() public {
        // 调用带有状态变量的参数
        _f(arr, map, myStructs[1]);

        // 从映射中得到结构体
        MyStruct storage myStruct = myStructs[1];
        // 在内存中创建一个结构体
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // 对永久存储在区块链里的变量做点什么
    }

    // 可以在这里返回内存数组
    function g(uint[] memory _arr) public returns (uint[] memory) {
        // do something with memory array
    }

    function h(uint[] calldata _arr) external {
        //在这里对函数参数数组做些什么
    }
}
