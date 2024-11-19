<h1 align="center">
  sol-opt
  <br>
</h1>

<h4 align="center">Solidity micro optimizations and tests with <a href="https://github.com/foundry-rs/foundry" target="_blank">Foundry</a>.</h4>

<p align="center">
  <a href="https://foundry-rs.dev/">
    <img src="https://img.shields.io/badge/Foundry-v0.2.0-ff8c00?style=flat" alt="Foundry">
  </a>
  <a href="https://soliditylang.org/">
    <img src="https://img.shields.io/badge/Solidity-v0.8.28-363636?style=flat" alt="Solidity">
  </a>
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="MIT License">
  </a>
</p>

<p align="center">
  <a href="#key-features">Key Features</a> ¥
  <a href="#how-to-use">How To Use</a> ¥
  <a href="#credits">Credits</a> ¥
  <a href="#license">License</a>
</p>

```bash
| src/AssemblyVsSol2.sol:AssemblyVsSol2A contract |                 |       |        |       |         |
|-------------------------------------------------|-----------------|-------|--------|-------|---------|
| Deployment Cost                                 | Deployment Size |       |        |       |         |
| 187719                                          | 654             |       |        |       |         |
| Function Name                                   | min             | avg   | median | max   | # calls |
| addSolidity                                     | 43770           | 43770 | 43770  | 43770 | 1       |
| addition                                        | 349             | 349   | 349    | 349   | 1       |
| divSolidity                                     | 43823           | 43823 | 43823  | 43823 | 1       |
| division                                        | 350             | 350   | 350    | 350   | 1       |
| mulSolidity                                     | 43809           | 43809 | 43809  | 43809 | 1       |
| multiplication                                  | 284             | 284   | 284    | 284   | 1       |
| subSolidity                                     | 43814           | 43814 | 43814  | 43814 | 1       |
| subtraction                                     | 305             | 305   | 305    | 305   | 1       |


| src/AssemblyVsSol2.sol:AssemblyVsSol2B contract |                 |       |        |       |         |
|-------------------------------------------------|-----------------|-------|--------|-------|---------|
| Deployment Cost                                 | Deployment Size |       |        |       |         |
| 135687                                          | 413             |       |        |       |         |
| Function Name                                   | min             | avg   | median | max   | # calls |
| addAssembly                                     | 43705           | 43705 | 43705  | 43705 | 1       |
| addition                                        | 349             | 349   | 349    | 349   | 1       |
| divAssembly                                     | 43783           | 43783 | 43783  | 43783 | 1       |
| division                                        | 328             | 328   | 328    | 328   | 1       |
| mulAssembly                                     | 43684           | 43684 | 43684  | 43684 | 1       |
| multiplication                                  | 284             | 284   | 284    | 284   | 1       |
| subAssembly                                     | 43729           | 43729 | 43729  | 43729 | 1       |
| subtraction                                     | 305             | 305   | 305    | 305   | 1       |

```

## Key Features

### **Storage Optimization (Storage.sol)**
```solidity
// SPDX-License-Identifier: MIT
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
```
- **StorageA**:
  - Uses default variable types with standard packing
  - 64 bytes total

- **StorageB**:
  - Efficiently packs smaller data types
  - 56 bytes total

- **StorageC**:
  - Uses `immutable` variables for more efficient storage
  - 56 bytes total

### **Strings & Custom Errors (RequireStrings.sol)**
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract RequireA {
    address public s_owner;

    constructor() {
        s_owner = msg.sender;
    }

    function testRequireA() public view returns (bool _result) {
        require(msg.sender == s_owner, "invalid request, msg.sender should be _owner");
        return true;
    }
}

contract RequireB {
    address public s_owner;

    error InvalidRequest(address sender);

    constructor() {
        s_owner = msg.sender;
    }

    function testRequireB() public view returns (bool _result) {
        if (msg.sender != s_owner) revert InvalidRequest(msg.sender);
        return true;
    }
}
```

- **RequireA**:
  - Uses the `require` statement with a revert string.
  - **Higher gas cost** due to storing the revert string in contract bytecode and returning it on failure.
  - Good for simple conditions but less optimal in gas-sensitive scenarios.

- **RequireB**:
  - Uses a custom error (`InvalidRequest`) instead of a `require` statement.
  - **More gas efficient** since custom errors are encoded with their selector and arguments, avoiding the cost of storing revert strings.
  - Recommended for contracts with multiple error conditions or complex logic to save gas.

### **Public vs Private Variables (PublicVsPrivate.sol)**
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract PublicVariable {
    // Public variable with automatic getter function
    uint256 public value;

    constructor(uint256 _initialValue) {
        value = _initialValue;
    }

    // Function to update the value
    function updateValue(uint256 _newValue) public {
        value = _newValue;
    }
}

contract PrivateVariable {
    // Private variable with manual getter function
    uint256 private value;

    constructor(uint256 _initialValue) {
        value = _initialValue;
    }

    // Getter function to access the private variable
    function getValue() public view returns (uint256) {
        return value;
    }

    // Function to update the value
    function updateValue(uint256 _newValue) public {
        value = _newValue;
    }
}
```

- **PublicVariable**:
  - Uses a public variable, automatically generating a getter function.
  - Slightly higher deployment cost due to the creation of the getter function.
  - More efficient for direct access to the variable.

- **PrivateVariable**:
  - Uses a private variable with a manual getter function.
  - Slightly cheaper deployment cost due to the absence of an automatic getter.
  - Manual getter makes access slightly more expensive than public variables.

### **Memory vs Storage (MemoryVsStorage.sol)**
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract MemoryVsStorageA {
    uint256[] public numbers;
    // Adding an array to state storage

    function addToStorage(uint256[] memory _numbers) public {
        for (uint256 i = 0; i < _numbers.length; i++) {
            numbers.push(_numbers[i]);
        }
    }
}

contract MemoryVsStorageB {
    uint256[] public numbers;

    // Uses memory, only modifies state memory temporarily for processing
    function addToMemory(uint256[] memory _numbers) public pure returns (uint256[] memory) {
        uint256[] memory newNumbers = new uint256[](_numbers.length);
        for (uint256 i = 0; i < _numbers.length; i++) {
            newNumbers[i] = _numbers[i] + 1; // does not affect state
        }
        return newNumbers;
    }
}
```

- **Memory (Temporary)** vs **Storage (Persistent)**:
  - **MemoryVsStorageA (Storage)**: In the `addToStorage` function, data is stored in the contract's state storage. Each time an element is pushed into the `numbers` array, gas is used to store the data persistently on the blockchain. Writing to storage is more expensive than working with memory.

  - **MemoryVsStorageB (Memory)**: In the `addToMemory` function, the array is manipulated in memory and does not affect the contract's persistent state. Memory is cheaper for temporary data processing compared to storage. This function creates a temporary array in memory, processes it, and returns the result without writing to the blockchain.

- **addToStorage (Storage)**:
  - More expensive due to persistent data storage on the blockchain.
  - Each `push` operation on the array involves writing data to the contract's state storage.

- **addToMemory (Memory)**:
  - Less expensive since memory is used for temporary processing. No gas is spent writing to the blockchain.
  - Suitable for data manipulation that doesn't need to be stored on-chain.

### **Functions vs Modifiers (FunctionsVsModifiers.sol)**
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract FunctionsVsModifiersA {
    address private owner;
    uint256 public ownerAccessUint;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Token not whitelisted");
        _;
    }

    function ownerAccessTestA(uint256 _input) public view onlyOwner returns (bool accessFlag) {
        if (_input == 1) {
            accessFlag = true;
        }
    }

    function ownerAccessTestB(uint256 _input) public onlyOwner {
        ownerAccessUint = _input;
    }
}

contract FunctionsVsModifiersB {
    address private owner;
    uint256 public ownerAccessUint;

    constructor() {
        owner = msg.sender;
    }

    function onlyOwner() public view {
        require(owner == msg.sender, "Token not whitelisted");
    }

    function ownerAccessTestA(uint256 _input) public view returns (bool accessFlag) {
        onlyOwner();
        if (_input == 1) {
            accessFlag = true;
        }
    }

    function ownerAccessTestB(uint256 _input) public {
        onlyOwner();
        ownerAccessUint = _input;
    }
}
```

- **FunctionsVsModifiersA (Modifiers)**:
  - Uses a modifier (`onlyOwner`) to check ownership before executing functions.
  - Less gas efficient due to the overhead introduced by the modifier, which adds extra internal calls before the function body is executed.

- **FunctionsVsModifiersB (Functions)**:
  - Uses a direct function call (`onlyOwner`) to check ownership.
  - More gas efficient by avoiding the additional execution overhead of modifiers and directly performing the check within the function body.

### BytesVsStrings Gas Optimization (BytesVsString.sol)
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract BytesVsStringsA {
    bytes32 public bytes32Var = "Test bytes32 vs string";
}

contract BytesVsStringsB {
    string public stringVar = "Test bytes32 vs string";
}
```

- **BytesVsStringsA**:
  - Uses `bytes32` for fixed-size, more gas-efficient storage.
  - Lower gas cost due to static length.

- **BytesVsStringsB**:
  - Uses `string` for dynamic-size storage.
  - Higher gas cost due to additional processing for dynamic length.

### Bytecode vs Storage Variables Gas Optimization (ByteCodeVsStorageVars.sol)
```solidity
// SPDX-License-Identifier: MIT
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
```

- **ByteCodeVsStorageVarsA**:
  - Uses `constant` variable stored directly in bytecode.
  - More gas-efficient for reads due to lack of storage access.

- **ByteCodeVsStorageVarsB**:
  - Uses a `public` storage variable.
  - Higher gas cost due to storage read operations.

### Assembly vs Solidity Gas Optimization (AssemblyVsSol2.sol)
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract AssemblyVsSol2A {
    uint256 public addition;
    uint256 public subtraction;
    uint256 public multiplication;
    uint256 public division;

    function addSolidity(uint256 a, uint256 b) public {
        addition = a + b;
    }

    function subSolidity(uint256 a, uint256 b) public {
        subtraction = a - b;
    }

    function mulSolidity(uint256 a, uint256 b) public {
        multiplication = a * b;
    }

    function divSolidity(uint256 a, uint256 b) public {
        require(b != 0, "division by zero");
        division = a / b;
    }
}

contract AssemblyVsSol2B {
    uint256 public addition;
    uint256 public subtraction;
    uint256 public multiplication;
    uint256 public division;

    function addAssembly(uint256 a, uint256 b) public {
        assembly {
            sstore(0x0, add(a, b))
        }
    }

    function subAssembly(uint256 a, uint256 b) public {
        assembly {
            sstore(0x1, sub(a, b))
        }
    }

    function mulAssembly(uint256 a, uint256 b) public {
        assembly {
            sstore(0x2, mul(a, b))
        }
    }

    function divAssembly(uint256 a, uint256 b) public {
        assembly {
            if iszero(b) { revert(0, 0) }
            sstore(0x3, div(a, b))
        }
    }
}
```

- **AssemblyVsSol2A**:
  - Performs arithmetic using standard Solidity functions.
  - Higher gas costs due to overhead of Solidity's safety checks and storage handling.

- **AssemblyVsSol2B**:
  - Utilizes inline assembly for arithmetic operations.
  - More gas-efficient by directly interacting with storage, bypassing Solidity's additional checks.

### Assembly vs Solidity Constructor & Storage (AssemblyVsSol1.sol)
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract AssemblyVsSol1A {
    address private owner;

    constructor() {
        assembly {
            sstore(0x0, caller())
        }
    }

    function getOwner() public view returns (address ownerAddr) {
        assembly {
            ownerAddr := sload(0x0)
        }
    }
}

contract AssemblyVsSol1B {
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}
```

- **AssemblyVsSol1A**:
  - Manually sets and retrieves the contract owner using `sstore` and `sload` with inline assembly.
  - **Less gas efficient** due to direct storage access, bypassing Solidity's optimized storage allocation.

- **AssemblyVsSol1B**:
  - Utilizes Solidity's built-in storage handling with `msg.sender`.
  - **More gas efficient** by leveraging automatic storage slot management.

### Array vs Mapping for Data Storage (ArrayVsMapping.sol)
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract ArrayVsMappingA {
    uint256[] public array;

    // Adds a new element to the array
    function addElement(uint256 _value) public {
        array.push(_value);
    }

    // Retrieves an element from the array by index
    function getElement(uint256 _index) public view returns (uint256) {
        require(_index < array.length, "Index out of bounds");
        return array[_index];
    }
}

contract ArrayVsMappingB {
    mapping(address => uint256) public storedValues;

    // Adds a value to the caller's address
    function addElement(uint256 _value) public {
        storedValues[msg.sender] = _value;
    }

    // Get the stored value for the caller's address
    function getElement() public view returns (uint256) {
        return storedValues[msg.sender];
    }
}
```

- **ArrayVsMappingA**:
  - Uses a dynamic array to store values.
  - Adding elements has a lower gas cost initially, but retrieving values by index may become more expensive as the array grows, especially with bounds checking (`require` statement).
  - **Less efficient for frequent lookups**, especially with large datasets.

- **ArrayVsMappingB**:
  - Uses a mapping to store values associated with user addresses.
  - **More gas efficient** for lookups and updates as mappings offer constant time complexity (`O(1)`), regardless of the dataset size.
  - Ideal for scenarios where direct value access by a key (e.g., address) is required.




## How To Use

To run these tests, you'll need [Foundry](https://book.getfoundry.sh/getting-started/installation.html) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone https://github.com/TVI-BIZ/enc_adv_sol_q4

# Go into the repository
$ cd enc_adv_sol_q4

# Install dependencies
$ git clone https://github.com/Foundry-rs/forge-std lib/forge-std

# Run forge test
$ forge test --gas-report
```

## Credits

This project uses the following open-source package:

- [Foundry](https://book.getfoundry.sh/)

## License

MIT

---
