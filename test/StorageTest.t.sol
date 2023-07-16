// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/Storage.sol";
import "../src/StorageSlot.sol";

contract StorageTest is Test {
    using stdStorage for StdStorage;

    Storage public storageContract;

    function setUp() public {
        storageContract = new Storage();
    }

    function test_IntegerStorageSlots() public {
        uint256 xSlot = stdstore.target(address(storageContract)).sig("numberX()").find();
        uint256 ySlot = stdstore.target(address(storageContract)).sig("numberY()").find();

        assertEq(xSlot, 0);
        assertEq(ySlot, 1);
    }

    function test_MappingStorageSlots() public {
        uint256 slot1 =
            stdstore.target(address(storageContract)).sig(storageContract.numMapping.selector).with_key(1).find();
        uint256 slot31 =
            stdstore.target(address(storageContract)).sig(storageContract.numMapping.selector).with_key(31).find();
        uint256 slot41 =
            stdstore.target(address(storageContract)).sig(storageContract.numMapping.selector).with_key(41).find();

        uint256 atSlot1 = uint256(vm.load(address(storageContract), bytes32(slot1)));
        uint256 atSlot31 = uint256(vm.load(address(storageContract), bytes32(slot31)));
        uint256 atSlot41 = uint256(vm.load(address(storageContract), bytes32(slot41)));

        assertEq(atSlot1, 75);
        assertEq(atSlot31, 98);
        assertEq(atSlot41, 18);
    }

    function test_insertingInfoInSlots() public {
        StorageSlot.getUint256Slot(keccak256("testslot")).value = 256;
        uint256 value = StorageSlot.getUint256Slot(keccak256("testslot")).value;

        assertEq(value, 256);
    }
}
