# Tic Tac Toe

##Specifications
- allow for a human player
- play against a computer player
- have some user interface (text is fine)
- never lose and win whenever possible

##How to run
1. clone the repo to your local machine
2. navigate to the directory and run ```bundle install```
3. run ```ruby bin/play_ttt``` on the command line to start playing

##Process
1. I started researching about algorithms that would allow me to use play tic tac toe with a computer, this is when I came across the [minimax algorithms](http://neverstopbuilding.com/minimax)
2. I played around with the minimax algorithm to get some understanding of how it works
3. I started building a simple tic tac toe application with two people, this allowed me to break down the application into methods with single responsibility
4. Now that I have some understanding of the components of the application, I used TDD to build this application based on the functionality that was required
    * a) Tic Tac Toe Board & Displaying it to the Screen
    * b) Functionality to move pieces on the board
    * c) Functionality to determine the status of if there is a win or a draw?
    * d) Created the minimax methods.  There were many different ways of implementation but I used this [repo](https://github.com/chongkim/ttt-ruby-gosu) as a reference.
    * e) Tying it all together and playing a game

##Things I Learned from this assignment
1. I learned about the concept of minimax algorithm and how to apply it to a game like tic tac toe
2. I learned about the send method and how to use it to dynamically pass in different parameters based on a given situation

##What I can do to improve the application
1. Have the computer start first at the most optimal spot, this will increase the likely hood of the computer winning
2. Optimize the #minimax method with memoization
3. Create a more user friendly interface, Rails API + Web Front End