// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Coffee{

    struct Memo{
        string name;
        string message;
        uint timestamp;
        address from;
    }

    Memo[] memos;

    address payable owner;

    constructor() {
        owner = payable (msg.sender);

    }

    function buyCoffee(string calldata name, string calldata message) public payable {

        require(msg.value>0, "Some money needs to be sent");
        owner.transfer(msg.value);
        memos.push(Memo(name, message, block.timestamp, msg.sender));

    }

    function getMemos() public view returns(Memo[] memory)
    {
        return memos; }

}
