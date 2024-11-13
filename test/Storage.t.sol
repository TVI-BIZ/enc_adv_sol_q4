// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import {Test, console} from "forge-std/Test.sol";
import {StorageA, StorageB, StorageC} from "../src/Storage.sol";

contract StorageTest is Test {
    StorageA public storageA;
    StorageB public storageB;
    StorageC public storageC;

    function setUp() public {
        storageA = new StorageA();
        storageB = new StorageB();
        storageC = new StorageC();
    }

    function test_StorageACtr() public view {
        storageA.uintA();
        storageA.uintB();
        storageA.uintC();
    }

    function test_StorageBCtr() public view {
        storageB.uintA();
        storageB.uintB();
        storageB.uintC();
    }

    function test_StorageCCtr() public view {
        storageC.uintA();
        storageC.uintB();
        storageC.uintC();
    }
}
