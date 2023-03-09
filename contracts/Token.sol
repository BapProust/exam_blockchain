pragma solidity ^0.8.0;

contract Marketplace {

    enum ShippingStatus { Pending, Shipped, Delivered }
    ShippingStatus private status;

    event MissionComplete();

    address private owner;
    address private customer;

    constructor() {
        owner = msg.sender;
        status = ShippingStatus.Pending;
    }

    modifier ownerOnly {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    modifier customerOnly {
        require(msg.sender == customer, "Only the customer can perform this action");
        _;
    }

    function Shipped() public ownerOnly {
        status = ShippingStatus.Shipped;
    }

    function Delivered() public ownerOnly {
        status = ShippingStatus.Delivered;
        emit MissionComplete();
    }

    function getStatus() public view ownerOnly returns (ShippingStatus) {
        return status;
    }

    function Status() public payable customerOnly returns (ShippingStatus) {
        require(msg.value > 0, "Payment required");
        customer = msg.sender;
        return status;
    }
}
