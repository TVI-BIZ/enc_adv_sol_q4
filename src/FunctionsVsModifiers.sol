// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract FunctionsVsModifiersA {
    address private owner;
    uint256 public ownerAccessUint;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Token not whitelisted");
        _;
    }

    function ownerAccessTestA(uint256 _input) public view onlyOwner returns (bool accessFlag) {
        if (_input == 1) {
            accessFlag = true;
        }
    }

    function ownerAccessTestB(uint256 _input) public onlyOwner {
        ownerAccessUint = _input;
    }
}

contract FunctionsVsModifiersB {
    address private owner;
    uint256 public ownerAccessUint;

    constructor() {
        owner = msg.sender;
    }

    function onlyOwner() public view {
        require(owner == msg.sender, "Token not whitelisted");
    }

    function ownerAccessTestA(uint256 _input) public view returns (bool accessFlag) {
        onlyOwner();
        if (_input == 1) {
            accessFlag = true;
        }
    }

    function ownerAccessTestB(uint256 _input) public {
        onlyOwner();
        ownerAccessUint = _input;
    }
}
