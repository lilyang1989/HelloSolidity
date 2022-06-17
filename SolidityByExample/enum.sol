// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//主要用来控制合约中的函数能否被调用
contract Enum {
    // Enum representing shipping status
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // enum类型数据的默认值是你给出定义中的第一个
    // 此例中为Pending
    //不是内置（built in）的数据类型，是用刚刚上面定义的
    //想要转移状态：如从pending转到shipped  需要新建一个函数来实现
    function ship() public{
        require(status==Status.Pending);
        //只有在pending的时候才会转移到shipped
        status=Status.Shipped;

    }
    function acceptDelivery() public{
    require(status==Status.Shipped);
        status=Status.Accepted;
    }
    function rejectDelivery() public{
    require(status==Status.Shipped);
        status=Status.Rejected;
    }
    Status public status;

    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }
}
