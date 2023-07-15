// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

//possible storage slots for a smart contract is 2^256
//each storage slot is 32 bytes, so 1 byte=8 bits, we have 256 bits in each storage slot
//starting storage slot is 0x0... and last one is 0xff.....
contract Storage {
    uint256 public numberX = 97; // 0x0000000000000000000000000000000
    uint256 public numberY = 15; //0x0000000000000000000000000000001

    //memory is added contigiously, so this will be slot @2 after the uint256 are assigned slot 0 and slot 1
    //keccak(key+base) i.e. keccak(key + 0x0x0000000000000000000000000000002)
    mapping(uint256 => uint256) public numMapping; //0x0000000000000000000000000000002

    constructor() {
        numMapping[1] = 75; //storage at keccak(0x0000000000000000000000000000001 + 0x0000000000000000000000000000002)
    }
}
