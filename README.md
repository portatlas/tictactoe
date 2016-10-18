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
Iteration 1)
1. I started researching about algorithms that would allow me to use play tic tac toe with a computer, this is when I came across the [minimax algorithms](http://neverstopbuilding.com/minimax)
2. I played around with the minimax algorithm to get some understanding of how it works
3. I started building a simple tic tac toe application with two people, this allowed me to break down the application into methods with single responsibility
4. Now that I have some understanding of the components of the application, I used TDD to build this application based on the functionality that was required
    * a) Tic Tac Toe Board & Displaying it to the Screen
    * b) Functionality to move pieces on the board
    * c) Functionality to determine the status of if there is a win or a draw?
    * d) Created the minimax methods.  There were many different ways of implementation but I used this [repo](https://github.com/chongkim/ttt-ruby-gosu) as a reference.
    * e) Tying it all together and playing a game

Iteration 2)
1. I began to refactor the code to remove the dependency the Game has on TicTacToe, instead of creating an instance of TicTacToe inside the Game Class. I created the TicTacToe instance outside and injected the dependency to the Game class as a parameter.
2. I started to add more test to the Game Class so that any additional refactoring to the Game Class can be easily tested that behaviors do not change. The Game class was not developed with TDD, and I could see how the code became more procedural and problematic. If I had more time, I would have developed it with TDD. The lesson learned is that by not using TDD, I ended up going in circles creating code that works but not elegantly, writing test, refactoring, and end up having to rewrite test again. It turns out I would have been in a better position using TDD.
3. I removed the logic where the code is decoupled with standard input (stdin) and standard output (stdout). I created a class to to encapsulate the User Inteface and a seperate class specifically for the stdin and stdout called Console.  The Ui takes a paramter of IO in this specific case it takes the Console to handle input and output. After making this refactor, I realized my Game class is more concise and describe what it should do.

##Things I Learned from this assignment
1. I learned about the concept of minimax algorithm and how to apply it to a game like tic tac toe
2. I learned about the send method and how to use it to dynamically pass in different parameters based on a given situation

##What I can do to improve the application
1. Have the computer start first at the most optimal spot, this will increase the likely hood of the computer winning
2. Optimize the #minimax method with memoization
3. Create a more user friendly interface, Rails API + Web Front End