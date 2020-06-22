PImage wall,topNail,playerDefault,playerLeft,playerLeftRun,playerRight,playerRightRun;
PImage platformFake,platformJump,platformLeft,platformNail,platformRight,platformTrue;
float playerX ,playerY = 50;
boolean playerMoveLeft = false,playerMoveRight = false;
platform[] p = new platform[20];
void setup(){
  wall = loadImage("images/wall.png");
  topNail = loadImage("images/top-nail.png");
  playerDefault = loadImage("images/player-default.png");
  playerLeft = loadImage("images/player-left.png");
  playerLeftRun = loadImage("images/player-leftRun.png");
  playerRight = loadImage("images/player-right.png");
  playerRightRun = loadImage("images/player-rightRun.png");
  platformFake = loadImage("images/platform-fake.png");
  platformJump = loadImage("images/platform-jump.png");
  platformLeft = loadImage("images/platform-left.png");
  platformNail = loadImage("images/platform-nail.png");
  platformRight = loadImage("images/platform-right.png");
  platformTrue = loadImage("images/platform-true.png");
  size(436,640,P2D);//topNail.width + wall.width*2
  playerX = width/2-playerDefault.width/2;
  for(int i=0;i < p.length;i++){
    p[i] = new platform(height + i*120);
  }
}

void draw(){
  background(0);
  image(wall,0,0);
  image(wall,width-wall.width,0);
  image(topNail,0+wall.width,0);
  
  if(playerMoveLeft){
    if(frameCount%10<=5)image(playerLeft,playerX,playerY);
    else image(playerLeftRun,playerX,playerY);
    if(playerX >= wall.width)playerX -= 3;
  }
  else if(playerMoveRight){
    if(frameCount%10<=5)image(playerRight,playerX,playerY);
    else image(playerRightRun,playerX,playerY);
    if(playerX + playerDefault.width <= width-wall.width)playerX += 3;
  }
  else{
    image(playerDefault,playerX,playerY);
  }
  if(playerY+playerDefault.height <= height)playerY += 3;//falling down
  for(int i=0;i < p.length;i++){
    p[i].update();
    if(p[i].platformY <= -1700)p[i] = new platform();//renew the platform
  }
  
}

void keyPressed(){
  switch(keyCode){
    case LEFT:
      playerMoveLeft = true;
      playerMoveRight = false;
      break;
    case RIGHT:
      playerMoveRight = true;
      playerMoveLeft = false;
      break;
    default:
      playerMoveRight = false;
      playerMoveLeft = false;
      break;
  }
}

void keyReleased(){
  playerMoveRight = false;
  playerMoveLeft = false;
}