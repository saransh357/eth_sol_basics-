pragma solidity ^0.8.0;
contract Inventory {
    mapping(uint256 => uint256) public inventory;

    function addItem(uint256 itemId, uint256 quantity) external {
        require(quantity > 0, "Quantity must be greater than 0");
        inventory[itemId] += quantity;
    }

    function updateQuantity(uint256 itemId, uint256 newQuantity) external {
        require(inventory[itemId] > 0, "Item does not exist in inventory");
        inventory[itemId] = newQuantity;
    }

    function getQuantity(uint256 itemId) external view returns (uint256) {
        return inventory[itemId];
    }
}
