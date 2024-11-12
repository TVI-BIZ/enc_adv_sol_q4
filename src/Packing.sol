// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Packing {
    struct DataPacked {
        uint16 proto;
        uint8 flag;
        bool isActive;
    }

    DataPacked public data;

    constructor() {
        data = DataPacked({proto: 65535, flag: 255, isActive: true});
    }

    function updateData(uint16 _proto, uint8 _flag, bool _isActive) public {
        data.proto = _proto;
        data.flag = _flag;
        data.isActive = _isActive;
    }

    function getData() public view returns (uint16, uint8, bool) {
        return (data.proto, data.flag, data.isActive);
    }
}
