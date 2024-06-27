// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FavoriteNumberStorage {
    uint private favoriteNumber; 

    function setFavoriteNumber(uint newFavorite) public {
        favoriteNumber = newFavorite;
    }
    function getFavoriteNumber() public view returns (uint) {
        return favoriteNumber;
    }
}
