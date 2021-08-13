// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract PostContract {

    uint public postCount = 0; //Stable Variable for Todo list counter. Keeps track of number of lists

    struct Post {
        uint id;
        string title;
        string author;
        string message;
        string hashtag;
        int upVotes;
        int downVotes;
        Comment[] comments;
        uint commentCount;
        bool ban;
    }

    struct Comment {
        uint commentID;
        string commentAuthor;
        string commentMessage;
    }

    mapping(uint => Post) public posts;


    constructor() public {
        createPost("Welcome message","Creator", "Hello World. This is our first post.", "hashtagtest");
    }
 
    function createPost(string memory _title, string memory _author, string memory _message, string memory _hashtag) public {
        postCount ++;
        posts[postCount] = Post(postCount, _title, _author, _message, _hashtag, 0, 0, new Comment[](7), 0, false);
    }
    
    function upVote(uint id, int i) public{
        if (i == 1){
            posts[id].upVotes = posts[id].upVotes + i;
        }
    }

    function downVote(uint id, int i) public{
        if (i == -1){
            posts[id].downVotes = posts[id].downVotes + i;
        }
    }

    function addComment(uint _commentID, string memory _comment_author, string memory _comment_message) public{
        Post memory post = posts[_commentID];
        post.commentCount++;
        post.comments[post.commentCount] = Comment(post.commentCount, _comment_author, _comment_message);
    }
}
