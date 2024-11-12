// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

contract StorageA {
    uint256 public uintA; // 32 bytes
    uint256 public uintB; // 32 bytes
    uint256 public uintC; // 32 bytes
}

contract StorageB {
    uint256 public uintA; // 32 bytes
    uint128 public uintB; // 16 bytes
    uint64 public uintC; // 8 bytes
}
