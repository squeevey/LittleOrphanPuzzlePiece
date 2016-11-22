# LittleOrphanPuzzlePiece
How many puzzle pieces can you randomly discard from a jigsaw puzzle on the average before you are left with an orphaned piece?

This code was spawned after redditor /u/podcastman raised the question - "What if I throw away half the pieces of a jigsaw puzzle, will I get an orphan?" "https://www.reddit.com/r/CasualMath/comments/5e34mp/suppose_i_buy_a_1000_piece_puzzle_and_throw_half/


-----------
This is created using Processing 3.0.
-----------
I tested the puzzle idea using just a 10x10 grid. 
Average pieces removed before an orphan was created: 25.

Here is a google doc with a graph: https://docs.google.com/spreadsheets/d/1CHpVmSuay0W67O7w7kf4d3MnI_aXrTP4-2Uq-YDtiPY/edit?usp=sharing

Method: 

• Create an adjancency list using an array and IntList to emulate the layout of a grid (like a chessboard or puzzle); diagonals do not count, in this case, as connect.

• Randomly select a piece and find out its neighbors. 

• Go to those neighbors, and remove the piece from their list.
 
• Once a neighbor has an empty list - they are orphaned - and the simulation should stop.  
