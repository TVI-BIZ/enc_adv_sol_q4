// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import {Script, console} from "forge-std/Script.sol";
import {StorageA} from "../src/Storage.sol";
import {StorageB} from "../src/Storage.sol";
import {Mapping} from "../src/Mapping.sol";
import {MemoryVsStorage} from "../src/MemoryVsStorage.sol";
import {Packing} from "../src/Packing.sol"; // Declare the MemoryVsStorage contract

contract StorageScript is Script {
    StorageA public storageA;
    StorageB public storageB;
    Mapping public simpleMapping;
    MemoryVsStorage public memoryVsStorage;
    Packing public packing;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        // Deploy StorageA
        storageA = new StorageA();
        console.log("StorageA deployed at:", address(storageA));

        // Deploy StorageB
        storageB = new StorageB();
        console.log("StorageB deployed at:", address(storageB));

        // Deploy SimpleMapping
        simpleMapping = new Mapping();
        console.log("SimpleMapping deployed at:", address(simpleMapping));

        // Deploy MemoryVsStorage
        memoryVsStorage = new MemoryVsStorage();
        console.log("MemoryVsStorage deployed at:", address(memoryVsStorage));

        packing = new Packing();
        console.log("Packing deployed at:", address(packing));

        vm.stopBroadcast();
    }
}
