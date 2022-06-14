## 

```soli
using SafeMath for uint256;
```

### 什么是SafeMath





### tx.origin和msg.sender的区别

前者表示交易的发送者，后者则表示消息的发送者，如果情景是在一个合约下的调用，那么这两者是木有区别的，但是如果是在多个合约的情况下，比如用户通过A合约来调用B合约，那么对于B合约来说，msg.sender就代表合约A，而tx.origin就代表用户

![image-20220614202925772](C:\Users\Yang\AppData\Roaming\Typora\typora-user-images\image-20220614202925772.png)