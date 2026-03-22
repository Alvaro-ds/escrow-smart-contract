// SPDX-License-Identifier: LGPL-3.0-only

pragma solidity 0.8.24;

contract Escrow {

    address public buyer;
    address public seller;
    uint256 public amount;
    bool public completed;

    constructor(address buyer_, address seller_) {
        buyer = buyer_;
        seller = seller_;
    }

    modifier onlyBuyer(address buyer_) {
        if (msg.sender != buyer_) revert ("Only buyer can call this function");
        _;
    }

    modifier notCompleted(bool completed_) {
        if (completed_) revert("Escrow already completed");
        _;
    }

    modifier isFunded(uint amount_) {
        if (amount_ == 0) revert("No funds deposited");
        _;
    }

    function deposit() public payable onlyBuyer(buyer) notCompleted(completed) {

        if (amount != 0) revert("Already funded");
        if (msg.value == 0) revert("Send ETH");

        amount = msg.value;
    }

    function confirmDelivery() public onlyBuyer(buyer) notCompleted(completed) isFunded(amount) {

        completed = true;
        payable(seller).transfer(amount);
    }

    function cancel() public onlyBuyer(buyer) notCompleted(completed) isFunded(amount) {
        
        completed = true;
        payable(buyer).transfer(amount);
    }
}