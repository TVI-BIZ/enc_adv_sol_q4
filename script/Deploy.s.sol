// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

// import {Script, console} from "forge-std/Script.sol";
// import {StorageA, StorageB} from "../src/Storage.sol";
// import {MemoryVsStorageA, MemoryVsStorageB} from "../src/MemoryVsStorage.sol";
// import {RequireA, RequireB} from "../src/RequireStrings.sol";
// import {PublicVariable, PrivateVariable} from "../src/PublicVsPrivate.sol";
// import {ArrayVsMappingA, ArrayVsMappingB} from "../src/ArrayVsMapping.sol";
// import {Mapping} from "../src/Mapping.sol";
// import {Packing} from "../src/Packing.sol"; // Declare the MemoryVsStorage contract

// contract StorageScript is Script {
//     StorageA public storageA;
//     StorageB public storageB;
//
//     MemoryVsStorageA public memoryVsStorageA;
//     MemoryVsStorageB public memoryVsStorageB;
//
//     RequireA public requireA;
//     RequireB public requireB;
//
//     PublicVariable public publicVariable;
//     PrivateVariable public privateVariable;
//
//     // ArrayVsMappingA public arrayVsMappingA;
//     // ArrayVsMappingB public arrayVsMappingB;
//
//     function setUp() public {}
//
//     function run() public {
//         vm.startBroadcast();
//
//         // Deploy StorageA
//         storageA = new StorageA();
//         storageB = new StorageB();
//         // console.log("StorageA deployed at:", address(storageA));
//         // console.log("StorageB deployed at:", address(storageB));
//
//         // Deploy MemoryVsStorage
//         memoryVsStorageA = new MemoryVsStorageA();
//         memoryVsStorageB = new MemoryVsStorageB();
//         // console.log("MemoryVsStorageA deployed at:", address(memoryVsStorageA));
//         // console.log("MemoryVsStorageB deployed at:", address(memoryVsStorageB));
//
//         // Deploy MemoryVsStorage
//         requireA = new RequireA();
//         requireB = new RequireB();
//         // console.log("RequireA deployed at:", address(requireA));
//         // console.log("RequireB deployed at:", address(requireB));
//
//         // Deploy SimpleMapping
//         // simpleMapping = new Mapping();
//         // console.log("SimpleMapping deployed at:", address(simpleMapping));
//
//         // packing = new Packing();
//         // console.log("Packing deployed at:", address(packing));
//
//         // arrayVsMappingA = new arrayVsMappingA();
//         // arrayVsMappingB = new arrayVsMappingB();
//         // console.log("ArrayVsMappingA deployed at:", address(arrayVsMappingA));
//         // console.log("ArrayVsMappingB deployed at:", address(arrayVsMappingB));
//
//         // publicVariable = new PublicVariable();
//         // privateVariable = new PrivateVariable();
//         // console.log("PublicVariable deployed at:", address(publicVariable));
//         // console.log("PrivateVariable deployed at:", address(privateVariable));
//
//         vm.stopBroadcast();
//     }
// }
