// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Auction {
    address public owner;
    address public highestBidder;
    uint256 public highestBid;

    constructor() {
        owner = msg.sender;
        highestBidder = address(0); 
        highestBid = 2;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function placeBid() external payable {
        require(msg.value > highestBid, "Bid amount must be higher than the current highest bid");

        // Refund the previous highest bidder
        if (highestBidder != address(0)) {
            payable(highestBidder).transfer(highestBid);
        }

        // Update highest bidder and bid value
        highestBidder = msg.sender;
        highestBid = msg.value;
    }

    function withdraw() external {
        require(msg.sender == highestBidder, "Only the highest bidder can withdraw");
        require(highestBid > 0, "No funds to withdraw");

        uint256 amount = highestBid;
        highestBid = 0;
        highestBidder = address(0);

        payable(msg.sender).transfer(amount);
    }
}
