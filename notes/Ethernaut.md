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
    }//再执行此函数 此时的compare合约的b变成了compare合约地址 而上面的
}
```

