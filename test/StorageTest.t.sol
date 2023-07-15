// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/Storage.sol";

contract StorageTest is Test {
    using stdStorage for StdStorage;

    Storage public storageContract;

    function setUp() public {
        storageContract = new Storage();
    }

    function test_StorageSlots() public {
        uint256 xSlot = stdstore.target(address(storageContract)).sig("numberX()").find();
        uint256 ySlot = stdstore.target(address(storageContract)).sig("numberY()").find();

        assertEq(xSlot, 0);
        assertEq(ySlot, 1);
    }
}
