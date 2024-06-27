// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//import "./AggregatorV3Interface.sol"
//import directly from github
// import "AggregatorV3Interface.sol";

interface AggregatorV3Interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  // getRoundData and latestRoundData should both raise "No data present"
  // if they do not have data to report, instead of returning unset values
  // which could be misinterpreted as actual reported values.
  function getRoundData(uint80 _roundId)
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );

  function latestRoundData()
    external
    view
    returns (
      uint80 roundId,
      int256 answer,
      uint256 startedAt,
      uint256 updatedAt,
      uint80 answeredInRound
    );
}
contract FundMe
{
    uint256 public minUSD = 5 * 1e18;
    function getEther() public payable
    {
        require(getConversion(msg.value) >= minUSD, "IB");
        //msg.value has 18 decimal places
    }

    function getPrice() public view returns(uint256)
    {
        //AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
        //ABI
        //Address of the contract we want to interact with : 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface PriceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        ( ,int256 answer, , ,)= PriceFeed.latestRoundData();
        return uint256(answer * 1e10);
        //Price of Eth in USD
    }

    function getVersion() external view returns(uint256)
    {
        AggregatorV3Interface PriceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return PriceFeed.version();

    }

    function getConversion(uint256 EthAmount) public view returns(uint256)
    {
      uint256 EthPrice = getPrice();
      uint256 EthAmountInUSD = (EthPrice * EthAmount)/1e18;
      return EthAmountInUSD;

    }
}