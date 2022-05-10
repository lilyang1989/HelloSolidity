## Storage和memory关键字的区别和用法
  * 状态变量默认使用storage形式，永久写入区块链
  * 在函数内部声明的变量则默认是memory类型，在函数调用结束后消失
```solidity
 function eatSandwich(uint _index) public {
    // 如果写成 Sandwich mySandwich = sandwiches[_index];
    // Solidity 将会给出警告，告诉你应该明确在这里定义 `storage` 或者 `memory`。
    // 这里定义为 `storage`:
    Sandwich storage mySandwich = sandwiches[_index];
    // ...这样 `mySandwich` 是指向 `sandwiches[_index]`的指针
    // 在存储里，另外...
    mySandwich.status = "Eaten!";
    // ...这将永久把 `sandwiches[_index]` 变为区块链上的存储
    // 如果你只想要一个副本，可以使用`memory`,这样拿到的是一份拷贝:
    Sandwich memory anotherSandwich = sandwiches[_index + 1];
    // ...这样 `anotherSandwich` 就仅仅是一个内存里的副本了
    // 另外
    anotherSandwich.status = "Eaten!";
    // ...将仅仅修改临时变量，对 `sandwiches[_index + 1]` 没有任何影响
    // 不过你可以这样做:
    sandwiches[_index + 1] = anotherSandwich;
    // ...如果你想把副本的改动保存回区块链存储
  }
```
   