// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//一次转账所需的gas费用由gas spent和gas price决定
//更高的gas在区块中有着更高的优先权
//gas的上限由两个因素决定
//gas limit:由自己确定，愿意为每笔gas花费多少
//block gas limit:由网络决定的每个区块内最多多少gas
contract Gas {
    uint public i = 0;

    // 用完所有gas则转账失败
    // State changes are undone.
    // 已花费的gas不退换
    function forever() public {
        // Here we run a loop until all of the gas are spent
        // and the transaction fails
        while (true) {
            i += 1;
            
        }
    }
}
