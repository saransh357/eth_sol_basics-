// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EvenOddChecker {
    function isEven(uint256 number) public pure returns (bool) {
        return number % 2 == 0;
    }

    function isOdd(uint256 number) public pure returns (bool) {
        return number % 2 != 0;
    }
}
