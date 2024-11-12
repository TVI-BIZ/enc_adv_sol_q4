// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "forge-std/Test.sol";
import "../src/MemoryVsStorage.sol"; // Adjust this path according to your directory structure

contract TestMemoryVsStorage is Test {
    MemoryVsStorage private memoryVsStorage;

    function setUp() public {
        memoryVsStorage = new MemoryVsStorage();
    }

    function testAddToStorage() public {
        uint256[] memory numsToAdd = new uint256[](3);
        numsToAdd[0] = 1;
        numsToAdd[1] = 2;
        numsToAdd[2] = 3;

        memoryVsStorage.addToStorage(numsToAdd);

        for (uint256 i = 0; i < numsToAdd.length; i++) {
            uint256 storedNumber = memoryVsStorage.numbers(i);
            assertEq(storedNumber, numsToAdd[i], "Stored numbers should match input numbers");
        }
    }

    function testAddToMemory() public {
        uint256[] memory numsToAdd = new uint256[](3);
        numsToAdd[0] = 1;
        numsToAdd[1] = 2;
        numsToAdd[2] = 3;

        uint256[] memory processedNumbers = memoryVsStorage.addToMemory(numsToAdd);

        for (uint256 i = 0; i < numsToAdd.length; i++) {
            assertEq(processedNumbers[i], numsToAdd[i] + 1, "Processed numbers should be incremented by 1");
        }
    }

    // function testAddToMemoryDoesNotChangeState() public {
    //     uint256[] memory numsToAdd = new uint256[](3);
    //     numsToAdd[0] = 4;
    //     numsToAdd[1] = 5;
    //     numsToAdd[2] = 6;

    //     memoryVsStorage.addToMemory(numsToAdd);

    //     // Check that the contract's storage hasn't been modified by the addToMemory function
    //     assertEq(memoryVsStorage.numbers.length, 0, "Storage length should be unchanged");
    // }
}
