* Makers Academy practise tech test, worked on independently.
* Play tic tac toe with another user in the console
* To play clone this repository and navigate into the folder, and then:  
`pry` or `irb`    
`require './lib/game.rb'  `  
`game = Game.new(3)`   
...starts a new Game with a 3 x grid.  Or you can try `game = Game.new(4)`, or something even more ambitious!  
`game.play(1,1)`     
...marks the specified cell with an 'x' and switches the player.    
`game.play(0,2)`    
...marks the specified cell with a 'o'.    
...and so on.   
* The game will announce a winner when one player gets three in a row, whether vertical, horizontal or diagonal.
* The game will announce a draw if nobody won and the board is full.
* The game will raise an error if a player tries to take an already-marked cell.

