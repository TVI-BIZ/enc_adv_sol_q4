// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

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

contract StorageC {
    uint256 public immutable uintA; // 32 bytes
    uint128 public immutable uintB; // 16 bytes
    uint64 public immutable uintC; // 8 bytes
}
