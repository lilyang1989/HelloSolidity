pragma solidity ^0.4.0;
 contract interfaceContract{//把已经在A中实现的方法放入这个抽象合约
     function method_a(){
        
     }
 }
//  //接口不能：
// 定义变量
// 定义结构体
// 定义枚举类
// 定义构造器
// 继承其他合约或接口
 contract A is interfaceContract{//A继承抽象合约
     function method_a(){
         //具体实现方法
     }
 }
 contract B{//B通过A的地址连接到A的接口
     function B(address _addressA) {
         //加载A合约
         interfaceContract _interfaceContract =interfaceContract(_addr);
         //调用合约A的方法
         _interfaceContract.method_a();
         
     }
 }
 //可直接用接口来创建变量 并用接口自带的函数进行初始化