// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Test, console} from "forge-std/Test.sol";
import {MemoryVsStorageA} from "../src/MemoryVsStorage.sol";
import {MemoryVsStorageB} from "../src/MemoryVsStorage.sol";

contract TestMemoryVsStorage is Test {
    MemoryVsStorageA public memoryVsStorageA;
    MemoryVsStorageB public memoryVsStorageB;

    function setUp() public {
        memoryVsStorageA = new MemoryVsStorageA();
        memoryVsStorageB = new MemoryVsStorageB();
    }

    function test_MemoryVsStorageACtr() public {
        uint256[] memory numsToAdd = new uint256[](3);
        numsToAdd[0] = 1;
        numsToAdd[1] = 2;
        numsToAdd[2] = 3;
        memoryVsStorageA.addToStorage(numsToAdd);
        for (uint256 i = 0; i < numsToAdd.length; i++) {
            uint256 storedNumber = memoryVsStorageA.numbers(i);
            assertEq(storedNumber, numsToAdd[i], "Stored numbers should match input numbers");
        }
    }

    function test_MemoryVsStorageBCtr() public view {
        uint256[] memory numsToAdd = new uint256[](3);
        numsToAdd[0] = 1;
        numsToAdd[1] = 2;
        numsToAdd[2] = 3;
        uint256[] memory processedNumbers = memoryVsStorageB.addToMemory(numsToAdd);
        for (uint256 i = 0; i < numsToAdd.length; i++) {
            assertEq(processedNumbers[i], numsToAdd[i] + 1, "Processed numbers should be incremented by 1");
        }
    }
}
