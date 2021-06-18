// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract PostContract {

    uint public postCount = 0; //Stable Variable for Todo list counter. Keeps track of number of lists

    struct Post {
        uint id;
        string message;
        uint upvotes;
        uint downvotes;
        bool ban;
    }

    mapping(uint => Post) public posts;

    constructor() public {
        createPost("Hello World. This is our first post.");
    }
 
    function createPost(string memory _content) public {
        postCount ++;
        posts[postCount] =  Post(postCount, _content, 0, 0, false);
    }
}