// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract ByteCodeVsStorageVarsA {
    uint256 constant CONSTANTVAR = 1;

    function constantGetter() public pure returns (uint256) {
        return CONSTANTVAR;
    }
}

contract ByteCodeVsStorageVarsB {
    uint256 public s_publicVarStorage = 1;
}
