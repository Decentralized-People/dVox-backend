// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract PostContract {

    uint public postCount = 0; //Stable Variable for Todo list counter. Keeps track of number of lists

    struct Post {
        uint id;
        string author;
        string message;
        int votes;
        bool ban;
    }

    mapping(uint => Post) public posts;

    constructor() public {
        createPost("Creator", "Hello World. This is our first post.");
    }
 
    function createPost(string memory _author, string memory _content) public {
        postCount ++;
        posts[postCount] =  Post(postCount, _author, _content, 0, false);
    }
    
    function addVote(uint id, int i) public{
        if (i == 1 || i == -1){
            posts[id].votes = posts[id].votes + i;
            if (posts[id].votes <= -10)
                posts[id].ban = true;
        }
    }
}
