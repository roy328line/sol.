// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {
    address public owner;
    uint256 public count;

    event CountIncreased(uint256 newCount);
    event CountSet(uint256 newCount);
    event OwnerChanged(address newOwner);

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    constructor(uint256 initialCount) {
        owner = msg.sender;
        count = initialCount;
    }

    function increment() external {
        count += 1;
        emit CountIncreased(count);
    }

    function setCount(uint256 newCount) external onlyOwner {
        count = newCount;
        emit CountSet(newCount);
    }

    function changeOwner(address newOwner) external onlyOwner {
        require(newOwner != address(0), "zero address");
        owner = newOwner;
        emit OwnerChanged(newOwner);
    }
}
