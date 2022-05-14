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

## 比较字符串的是否相同

```solidity
(keccak256(sandwich) == keccak256("BLT")
```

## 关于事件
当事件被触发时，会触发参数存储到交易的日志中，这些日志与合约的地址相关联，并记录到区块链中。
```solidity
event myEvent(address _myaddress,uint _myNumber)
```
触发事件可以在任何函数中调用
```solidity
function testEvent() public{
  emit myEvent(addressName,NumberName);
}
```
### 事件监听
先留个坑

### 函数修饰符
用来修饰已有函数用的，最常见的情况是放在函数执行之前添加快速的require检查
```solidity
modifier onlyOwner(){
  require(msg.sender == owener);
  _; //执行到此时再返回执行要修饰的函数的代码
}
event Laugh(string words)
function laalal() external onlyOwner {
 Laugh("lalalala")
}
```

### 省gas
>为什么会有gas？
区块链的激励机制，作为付给运行节点的计算与存储费用

注意：uint的变种不会为你节省任何gas
·view和pure函数在外部调用时不会承担gas费用，但改变状态的函数都需要消耗gas
* 在数组后面加上memory关键字，表明这个数组仅在内存中创建，不需要写入外部存储

### 函数修饰符
* 可见性修饰符
>private意味着只能被合约内部调用internal就像是private但也能被继承的合约调用；external只能从合约外部调用，public可以在任何地方调用

* 状态修饰符 
>函数如何与区块链交互。view代表不会更改和保存任何数据；pure代表不会写甚至也不会读取数据，这两种从合约外部调用时不花费任何gas，但被内部其他函数调用时会耗费gas

* 自定义修饰符
>可以自定义对函数的约束逻辑
```solidity
function test()external view onlyOwner anotherModifier{
  
}
```