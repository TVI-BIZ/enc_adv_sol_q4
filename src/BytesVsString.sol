// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract BytesVsStringsA {
    bytes32 public bytes32Var = "Test bytes32 vs string";
}

contract BytesVsStringsB {
    string public stringVar = "Test bytes32 vs string";
}
