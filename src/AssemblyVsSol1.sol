// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract AssemblyVsSol1A {
    address private owner;

    constructor() {
        assembly {
            sstore(0x0, caller())
        }
    }

    function getOwner() public view returns (address ownerAddr) {
        assembly {
            ownerAddr := sload(0x0)
        }
    }
}

contract AssemblyVsSol1B {
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}
