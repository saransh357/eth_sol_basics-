pragma solidity ^0.8.0;

contract GradeManagement {
    mapping(uint256 => string) public studentGrades;

    function addGrade(uint256 studentID, string memory grade) external {
        studentGrades[studentID] = grade;
    }

    function getGrade(uint256 studentID) external view returns (string memory) {
        string memory grade = studentGrades[studentID];
        if (keccak256(bytes(grade)) == keccak256(bytes("F"))) {
            return "Fail";
        }
        return grade;
    }
}
// SPDX-License-Identifier: MIT
