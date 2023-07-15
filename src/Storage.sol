// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

//possible storage slots for a smart contract is 2^256
//each storage slot is 32 bytes, so 1 byte=8 bits, we have 256 bits in each storage slot
//starting storage slot is 0x0... and last one is 0xff.....
contract Storage {
    uint256 x = 97;
}
