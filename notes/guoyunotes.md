# Whats this for?

check [this](https://guoyu.mirror.xyz/RD-xkpoxasAU7x5MIJmiCX4gll3Cs0pAd5iM258S1Ek).

是我目前能找到的最好最权威的DappTutorial（dapplearning,buildspace,useweb3等人:礼貌你吗

aight lets jump into it

## 2.1合约特征

### 事务性
在合约中编写的函数要么全部被执行状态依次修改，要么全都回滚到未被修改的样子。（要活一起活，要完一起完）
不应该对参数重载
谨慎注意API的设计和进行错误处理。

### 错误处理
```solidity
require(condition,ERR_MESSAGE)
//or
revert customError()
```
### 运行成本
声明变量时的关键字、内联汇编、函数的状态,都会对运行成本有所影响
对外部白名单进行管理最好用MerkleProof

### 不可变
一旦部署无法动态替换或升级。
部署前考虑是否依赖可升级架构
### 可见性与权限
不应在合约中存储任何敏感数据
不应依赖区块当中的任何状态（区块高度和时间戳）作为核心业务逻辑的判断基准
基本：Ownable
复杂合约：AccessControl

### 安全性
遵循ConsenSys的合约代码安全最佳实践指南
足够多的测试用例与覆盖度

## 2.2 合约依赖与调用

### 依赖引入
import、npm、git submodule

### 调用
**只需知道地址和ABI**即可在合约内部调用其他合约
调用合约也是事务性操作
消耗额外的gas费用，调用失败不退钱
### ABI
如何操作一个合约的具体方法的描述。
通常在interface文件中被定义
Iblablabla.sol
### 合约事件
* 合约的函数调用是事务性的且无法为外部调用者提供返回值，故引入了事件的概念。
* 通过向日志系统中写入特定数据的方式来实现对函数修改的记录，通过监听和查询的方式列出合约注册的事件来实现对函数异步结果的查询和前端UI状态的变更。
* 以单一合约为key作为索引
* 在声明事件时，声明不多于三个index key来保证DApp前端对这些索引key的查询效率
* 如果非常复杂，采用Relay提供的graph/webhook来查询

### 创建合约
通过合约创建合约、通过钱包账户向0x00发送合约创建的操作来新建合约

## 3 开发工作流与单元测试


## 4 前端与客户端开发
### 4.1框架选择
ethers.js+react
理解React hooks的概念
### 4.2 搭建脚手架项目
**推荐React+Next.js**
### 4.3 前端与合约的交互流程
准备好RelayNetwork里的access key

### 4.4 前端依赖
wagmi、useDApp、Siwe
UI库：MUI、NextUI


## 5 开发、测试与生产环境调试
### 5.1开发环境调试
借助hardhat-deploy，简单地使用--export-all导出所有被发布的合约ABI为一个完整的json文件
 ### 5.2 测试与生产环境调试
 发布到公开测试网络或者用fork主网状态来充当测试环境

 ## 6 服务端编码与集成
 需要编写服务端API的原因：链上状态储存的成本过高，以及反复的签名与交互对用户来说体验不佳

 ### 6.1开发环境
 不复杂的DApp：Next.js
 依赖较多：FaaS

 ### 6.2钱包登录
 Siwe
 ### 6.3 服务端与区块链的通信
 dotenv
 secret manager
 ### 6.4 实用的SDK
 thirdweb
