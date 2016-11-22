PrintWriter output;

int cols;
int rows;
int total;
IntList[] grid; 
int totalCounter;
//build grid list
void buildgridlist(){
  totalCounter = 0;
  for (int i=0; i < cols; i++) {
    for (int j=0; j < rows; j++) {
      //Get integer values of neighbors of i,j to determine edges. 
      int u = i-1;
      int r = j+1;
      int l = j-1;
      int d = i+1;
      //Create an integer list object to hold the neighbors of i,j
      IntList neighbors = new IntList();
      //println("Grid Values of Neighbors " + l + " " + d + " " + u + " " + r);
      //Test if the neighbors are still on the board  and add them to the list.
      if(u >= 0 )
      {
        int uTot = totalCounter-cols;
        neighbors.append(uTot);
      }
      if(d < cols)
      {
        int dTot=totalCounter+cols;
        neighbors.append(dTot);
      }
       if(l >= 0 )
      {
        int lTot=totalCounter-1;
        neighbors.append(lTot);
      }
      if(r < rows)
      {
        int rTot=totalCounter+1;
        neighbors.append(rTot);
      }
      //Add the integer list to array.
      /* println("Size of Neighbors " + neighbors.size());
      println("This is the totalcounter inside " + totalCounter); 
      println("These are the dirty neighbors " + totalCounter + neighbors);*/
      grid[totalCounter] = neighbors; 
      totalCounter++;
    }
  }
}


int doAgain(){

IntList[] gridCopy = grid; //copy the grid to work from. 
boolean isNotEmpty = true; //if the size of a IntList is empty, it is orphaned. DONE
int piecesCount = 0; //how many pieces did we remove?
IntList removedPieces = new IntList(); //Keep a list of the pieces we've removed. 
int pieceNum=-1; //Set the initial piece number to -1

//If there isn't an empty list keep going
//println("have I found an empty "+ isNotEmpty);
while(isNotEmpty)
{
  
  //is this the first time or we've called the piece before then generate another random piece
 // println("I can has value? " + removedPieces.hasValue(pieceNum));
   while(pieceNum == -1 || removedPieces.hasValue(pieceNum))
  {
    println(total);
    pieceNum = int(random(total));
  }
  
  //add the random piece to the list. 
  removedPieces.append(int(pieceNum));
  //println(removedPieces);
  //update the piece count
  piecesCount++;
  //get the list of neighbors to disassociate from
  IntList neighborsToRemove = gridCopy[pieceNum];
  //println("removed pieces " + removedPieces);
  //println("Piece Number " + pieceNum);
  //println("Neighbors to remove " + neighborsToRemove);
  
  //for each neighbor remove yourself
  for(int val : neighborsToRemove)
  {
    //println("This is the value to remove from Neighbor " + val);
    IntList neighborToUpdate = gridCopy[val]; //get the neighbors list of neighbors
    //println("This is the neighbor to update " + neighborToUpdate);
    int indexOfVal = neighborToUpdate.index(pieceNum); //find yourself on the list
    neighborToUpdate.remove(indexOfVal); //remove yourself from the list
    //println("Pieces Removed "+ piecesCount);
    gridCopy[val] = neighborToUpdate;
    
    if(neighborToUpdate.size()==0)
    {
      //println("WHERE ARE YOU?");
      isNotEmpty = false;
      break;
    }
    
  }
  //println(piecesCount);
  
}
return piecesCount;
}


void setup(){

size(10,10);
cols = width;
rows = height;
total=cols*rows;
/* println(width);
println(height);
println(total);
println(totalCounter); */
output = createWriter("pieces.txt"); 
}


void draw()
{
  grid = new IntList[total]; 
  buildgridlist();
  if(total != totalCounter)
  {
    print("This Isn't Right");
    exit();
  }
  output.println(doAgain());
} 



void keyPressed() {
  output.flush();  // Writes the remaining data to the file
  output.close();  // Finishes the file
  exit();  // Stops the program
}