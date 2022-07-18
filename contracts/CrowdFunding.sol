// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract CrowdFunding {
    string public id;
    string public name;
    string public description;
    address payable public author;
    string public state = "Opended";
    uint public funds;
    uint public fundraisingGoal;

    constructor(string memory _id, string memory _name, string memory _description, uint _fundraisingGoal){
      id = _id;
      name = _name;
      description = _description;
      fundraisingGoal = _fundraisingGoal;
      author = payable(msg.sender);
    }

    modifier onlyOwner{
      require(msg.sender == author,
      "Only the owner can change the project status");
      // en esta linea se incerta el codigo
      _;
    }

    function fundProject() public payable{
      author.transfer(msg.value);
      funds += msg.value;
    }

    function changeProjectState(string calldata newState) public onlyOwner{
      state = newState;
    }
}
