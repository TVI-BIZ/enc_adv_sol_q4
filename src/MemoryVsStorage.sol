// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

contract MemoryVsStorage {
    uint256[] public numbers;

    // Adding an array to state storage
    function addToStorage(uint256[] memory _numbers) public {
        for (uint256 i = 0; i < _numbers.length; i++) {
            numbers.push(_numbers[i]);
        }
    }

    // Uses memory, only modifies state memory temporarily for processing
    function addToMemory(uint256[] memory _numbers) public pure returns (uint256[] memory) {
        uint256[] memory newNumbers = new uint256[](_numbers.length);
        for (uint256 i = 0; i < _numbers.length; i++) {
            newNumbers[i] = _numbers[i] + 1; // does not affect state
        }
        return newNumbers;
    }
}
