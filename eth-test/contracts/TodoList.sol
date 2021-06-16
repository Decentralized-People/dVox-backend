pragma solidity ^0.5.0;

contract TodoList {

    uint public taskCount = 0; //Stable Variable for Todo list counter. Keeps track of number of lists

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;

    constructor() public {
        createTask("Say hello to Revaz");
    }

    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] =  Task(taskCount, _content, false);
    }
}
