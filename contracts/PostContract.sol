// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract PostContract {
    uint public commentCount2 = 0; 

    uint public postCount = 0; 
    
    struct Comment {
        uint commentID;
        string commentAuthor;
        string commentMessage;
    }

    struct Post {
        uint id;
        string title;
        string author;
        string message;
        string hashtag;
        int upVotes;
        int downVotes;
        uint commentCount;
        bool ban;
        mapping (uint => Comment) comments;
    }

    mapping(uint => Post) public posts;

    constructor() {
        createPost("Welcome message","Creator", "Hello World!! This is our first post.", "hashtagtest");
        addComment(1, "Aleksandr", "Hello, this is the first comment!");
    }
 

    function createPost(string memory _title, string memory _author, string memory _message, string memory _hashtag) public {
        postCount ++;
        Post storage post = posts[postCount];
        post.id = postCount;
        post.title = _title;
        post.author = _author;
        post.message = _message;
        post.hashtag = _hashtag;
        post.upVotes = 0;
        post.downVotes = 0;
        post.commentCount = 0;
        post.ban = false;
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

    function addComment(uint _postID, string memory _comment_author, string memory _comment_message) public {
        Post storage post = posts[_postID];
        post.commentCount++;
        post.comments[post.commentCount] = Comment({commentID: post.commentCount, commentAuthor:_comment_author, commentMessage: _comment_message});
    }
    
    function getComment(uint postID, uint commentID) public view returns(uint id, string memory author, string memory message) {
        id = posts[postID].comments[commentID].commentID;
        author = posts[postID].comments[commentID].commentAuthor;
        message = posts[postID].comments[commentID].commentMessage;
        return (id, author, message);
    }
}
