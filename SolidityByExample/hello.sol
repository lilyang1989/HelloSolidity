pragma solidity ^0.8.13;
 contract Hello{
     string public greet="hello";
 }
 contract Counter {
    uint public count;

    // Function to get the current count
    function get() public view returns (uint) {
        return count;
    }
    //可见性修饰符、状态修饰符、再return自定义
    // Function to increment count by 1
    function inc() public {
        count += 1;
    }


    // Function to decrement count by 1
    function dec() public {
        // This function will fail if count = 0
        count -= 1;
    }
}