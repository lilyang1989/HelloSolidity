## 

```soli
using SafeMath for uint256;
```

### 什么是SafeMath

利用SafeMath来检查整数溢出

### tx.origin和msg.sender的区别

前者表示交易的发送者，后者则表示消息的发送者，如果情景是在一个合约下的调用，那么这两者是木有区别的，但是如果是在多个合约的情况下，比如用户通过A合约来调用B合约，那么对于B合约来说，msg.sender就代表合约A，而tx.origin就代表用户

![image-20220614202925772](C:\Users\Yang\AppData\Roaming\Typora\typora-user-images\image-20220614202925772.png)

### 三种调用代码的特殊方式

#### call

```solidity
<address>.call(bytes memory) returns (bool, bytes memory)
```

#### delegatecall

```solidity
<address>.staticcall(bytes memory) returns (bool, bytes memory)
```

#### static call

```solidity
<address>.call(bytes memory) returns (bool, bytes memory)
```

指令几乎一模一样，区别在哪？

```solidity
pragma solidity ^0.6.23;
contract Calltest {
    address public b;

    function test() public {
        b=address(this);//获取合约本身的地址
    }
}
contract Compare {
    address public b;
    address public testaddress;

    event logb(address _a);

    constructor(address _addressOfCalltest) public {
        testaddress = _addressOfCalltest;
    }
    function withcall() public {
        testaddress.call(bytes4(keccak256("test()")));
        emit logb(b);//点击withcall函数后 再点击b  发现 calltest的合约b已经变成了这个合约（Compare）的部署地址,而compare的合约地址并没有变化 说明call只是在Calltest合约中执行了test函数
  }
    function withdelegatecall() public {
        testaddress.delegatecall(bytes4(keccak256("test()")));
        emit logb(b);
    }//再执行此函数 此时的compare合约的b变成了compare合约地址 而上面的call实际上还是在CALLtest合约中执行的test函数
}
```

而如果部署后直接执行withdelegatecall，查看结果可以发现只有Compare合约的b被改变了,进一步印证了上面说的，delegatecall只在合约compare内部执行了一下，这也是solidity实现类似库函数作用的方式。

### 使用DelegationCall是很危险的,参见[这篇文章](https://blog.openzeppelin.com/on-the-parity-wallet-multisig-hack-405a8c12e8f7/)



### selfdestruct函数

这是一个自毁函数，当调用此函数时，会使合约无效化并删除该地址的字节码，然后把剩余的资金发送给参数指定的地址，并且该函数会无视fallback函数，而selfdestruct函数会无视这一点，也就是资金会优先由selfdestruct函数处理。



### 所有数据都是 可读的，包括合约内定义为private的password变量

可以使用web3.eth.getStorageAt来读取合约行对应地址的数据

```solidity
web3.eth.getStorageAt(address, position [, defaultBlock] [, callback])
```

第一个参数对应要读取的合约地址，  第二个参数是要读取内容的索引变量，第三个参数如果被设置，就不会使用默认的block（被web3.eth.defaultBlock设置的默认块），而是使用用户自定义的块，这个参数可选项有"earliest" "latest" "pending" 第四个选项设置回调函数

注意：web3.js不能自动把string解析成byte32类型 因此需要使用web3.utils.asciiToHex转换一下

用法：web3.utils.asciiToHex（“MyString”）

web3.js里0x开头的字符串可以被认为是bytes32
