//The Game

//variables always at the beginning
float playerx;
float playery;
float ballx;
float bally;
float ball_velocityx;
float ball_velocityy;
int round;

//is applied once in the very beginning
void setup(){
  playerx = 10;
  playery = 200;
  ballx = 400;
  bally = 300;
  ball_velocityx = -4;
  ball_velocityy = 0;
  round = 0;
  size(800, 600);
    //rectMode(CENTER) centers point of orientation of the rectangle (from top left corner to the middle)
   rectMode(CENTER);
}

//makes the game things within the brackets run indefinitely
void draw(){
  
  //is within the loop so the object doesn't leave a trail
  background(0);
  
  //rect(x, y, height, width)
  rect(playerx, playery, 20, 100);
  rect(ballx, bally, 10, 10);
  
  //player movement
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
  }
  
  //ball movement
  ballx = ballx + ball_velocityx;
  bally = bally + ball_velocityy;
  
  //ball bounce player
  if(ballx < 30){
    if(bally < (playery + 55) && bally > (playery - 55)){
      ball_velocityx = (-ball_velocityx) + 0.5;
      ball_velocityy = ball_velocityy - (playery - bally) * 0.1;
      round = round + 1;
  }else{
    //resetting
    ballx = 400;
    bally = 300;
    ball_velocityx = -3;
    ball_velocityy = 0;
    round = 0;
    }
  }
  
  //ball restriction
  if(bally > 595){
    ball_velocityy = -ball_velocityy;
  }
   if(bally < 5){
   ball_velocityy = -ball_velocityy;
  }
  if(ballx > 795){
   ball_velocityx = -ball_velocityx; 
  }
  
  text("Round: " + round, 700, 20)
;}