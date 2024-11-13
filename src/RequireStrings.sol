// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

contract RequireA {
    address public s_owner;

    constructor() {
        s_owner = msg.sender;
    }

    function testRequireA() public view returns (bool _result) {
        require(msg.sender == s_owner, "invalid request, msg.sender should be _owner");
        return true;
    }
}

contract RequireB {
    address public s_owner;

    error InvalidRequest(address sender);

    constructor() {
        s_owner = msg.sender;
    }

    function testRequireB() public view returns (bool _result) {
        if (msg.sender != s_owner) revert InvalidRequest(msg.sender);
        return true;
    }
}
