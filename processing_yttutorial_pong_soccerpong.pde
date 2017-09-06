//The Game

//variables always at the beginning
float playerx;
float playery;
float ballx;
float bally;
float ball_velocityx;
float ball_velocityy;
int player1pt;
int player2pt;
float player2x;
float player2y;
float goaly;
float goal_velocityy;

//is applied once in the very beginning
void setup(){
  //defining the Variables
  
  //player one stats
  playerx = 10;
  playery = 300;
  
  //ball stats
  ballx = 400;
  bally = 300;
  ball_velocityx = -4;
  ball_velocityy = 0;
  
  //player points
  player1pt = 0;
  player2pt = 0;
  
  //Player two stats
  player2x = 790;
  player2y = 300;
  
  //goal stats
  goaly = 300;
  goal_velocityy = -1.5;
  
  
  //Size of the Window
  size(800, 600);
  
    //rectMode(CENTER) centers point of orientation of the rectangle (from top left corner to the middle)
   rectMode(CENTER);
}

//makes the things within the brackets run indefinitely
void draw(){
  
  //is within the loop so the object doesn't leave a trail
  background(0);
  
  //rect(x, y, width, height)
  rect(playerx, playery, 20, 100);
  rect(ballx, bally, 10, 10);
  rect(player2x, player2y, 20, 100);
  rect(400, 300, 2, 600);
  
  //goal visual 
  rect(400, goaly + 40, 10, 5);
  rect(400, goaly - 40, 10, 5);
  
  //movement
  if(keyPressed){
    if(keyCode == DOWN){
      if(playery < 550){
        playery = playery + 5;
      }
    }
    if(keyCode == UP){
      if(playery > 50){
        playery = playery - 5;
      }
    }
    if(keyCode == CONTROL){
      if(player2y < 550){
       player2y = player2y + 5;
      }
    }
    if(keyCode == SHIFT){
      if(player2y > 50){
        player2y = player2y - 5;
      }
    }
  }
  //ball movement
  ballx = ballx + ball_velocityx;
  bally = bally + ball_velocityy;
  goaly = goaly + goal_velocityy;
  
  //ball bounce player1
  if(ballx < 30){
    if(bally < (playery + 55) && bally > (playery - 55)){
      ball_velocityx = -ball_velocityx;
      ball_velocityy = ball_velocityy - (playery - bally) * 0.1;
  }else{
    //resetting
    ballx = 400;
    bally = 300;
    ball_velocityx = -3;
    ball_velocityy = 0;
    player1pt = 0;
    }
  }
  
  //ball bounce player2
  if(ballx > 770){
    if(bally < (player2y + 55) && bally > (player2y - 55)){
      ball_velocityx = -ball_velocityx;
      ball_velocityy = ball_velocityy - (player2y - bally) * 0.1;
    }else{
    //resetting
    ballx = 400;
    bally = 300;
    ball_velocityx = -3;
    ball_velocityy = 0;
    player2pt = 0;
    }
  }
  
  //goal middle hitreg
  if(ballx == 400){
    if(bally > (goaly - 40) && bally < (goaly + 40)){
      if(ball_velocityx > 0){
       player1pt = player1pt + 1;
      }
      if(ball_velocityx < 0){
       player2pt = player2pt + 1;
      }
    }
  }
  
  //keeping the ball on the field
  if(bally > 595){
    ball_velocityy = -ball_velocityy;
  }
  if(bally < 5){
   ball_velocityy = -ball_velocityy;
  }
  
  //goal vertical bounce
  if(goaly > 558){
    goal_velocityy = -goal_velocityy; 
  }
  if(goaly < 42 ){
    goal_velocityy = -goal_velocityy;
  }

  //displays text (Var, x, y)
  text("Goals: " + player1pt, 100, 20);
  text("Goals: " + player2pt, 700, 20);
}