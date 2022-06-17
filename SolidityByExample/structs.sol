// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todos;

    function create(string calldata _text) public {
        // 三种方式初始化结构体
        // - 函数式调用
        todos.push(Todo(_text, false));

        // Key-Value映射
        todos.push(Todo({text: _text, completed: false}));

        // 用一个空结构体初始化然后在更新它
        Todo memory todo;
        todo.text = _text;
        // todo.completed 初始化为false

        todos.push(todo);
    }

   //solidity自动为todos创造了一个访问器，所以其实你不需要下面这个函数。
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
//至于声明和引入结构体 在一个文件中定义好后在另一个文件中直接引入即可