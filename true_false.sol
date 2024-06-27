// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    uint256 public yesVotes;
    uint256 public noVotes;

    mapping(address => bool) public votes;
    event Voted(address voter, bool vote);
    function vote(bool _vote) public {
        require(!votes[msg.sender], "You have already voted");

        votes[msg.sender] = _vote;

        if (_vote) {
            yesVotes++;
        } else {
            noVotes++;
        }

        emit Voted(msg.sender, _vote);
    }

    function getResult() public view returns (string memory) {
        if (yesVotes > noVotes) {
            return "Proposal Passed";
        } else if (yesVotes == noVotes) {
            return "Proposal Tied";
        } else {
            return "Proposal Failed";
        }
    }
}

