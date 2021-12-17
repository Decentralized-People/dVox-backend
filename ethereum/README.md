# dVox (backend) 🌠

dVox is a decentralized application that allows students to anonymously express their thoughts and ideas. It is powered by Ethereum blockchain system

## Detailed description

dVox allows users to publish posts under randomly generated nicknames. Each post has its own title, message, hashtag, the number of upvotes, downvotes, and a section for comments, where users can express their views and reply to the author. The application is designed to keep all the users anonymous, even the developers cannot identify what was posted by whom. Each user has a randomly generated nickname, which is assigned during the first login but can be regenerated within 2 clicks. Each user's profile is saved on their own device and is not associated with their sign-in account. In fact, all the sign-in accounts are stored at Firebase, while all the posts and comments are stored at the Ethereum blockchain system. This approach helps us to isolate the login system from the users' profiles, which brings anonymity to a new level!

## Author:
[**<code>Decentralized People</code>**](https://dpearth.com) team:
- Aleksandr Molchagin
- Revaz Bakuradze
- David Xu
- Fatima Ortega

## Backend

Backend of dVox consists of 2 parts: Ethereum - a blockchain platform where we store all the messages & posts, Firebase - a place where we store the rest information.
To understand how the app works look through the diagram below. 

<img src="%23readme/diagram.png" alt="ProjectDIES, diagram">
