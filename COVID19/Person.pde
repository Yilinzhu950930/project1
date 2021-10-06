class Person {
  float x;
  float y;
  
  float targetX;
  float targetY;
  
  float speed;
  
  int status;
  PImage[] images;
  
  Person() {
    
    targetX = random(0, width);
    targetY = random(0, height);
    
    x = random(0, width);
    y = random(0, height);

    
    speed = 0.5;
    status = 0;
    images = new PImage[4];
    images[0] = loadImage("images/person.png");
    images[1] = loadImage("images/infected.png");
    images[2] = loadImage("images/immune.png");
    images[3] = loadImage("images/tomb.png");
  }
  
  void move() {
    if(status!=3) {
      if(abs(x-targetX)<1&&abs(y-targetY)<1) {
        targetX = random(0, width);
        targetY = random(0, height);
      }else{
        float angle = atan2((targetY-y),(targetX-x));
        float speedX = speed*cos(angle);
        float speedY = speed*sin(angle);
        x+=speedX;
        y+=speedY;
      }
      
    }
    
  }
  
  float distance(Person other) {
    return (float)Math.sqrt((x-other.x)*(x-other.x)+(y-other.y)*(y-other.y));
  }
 
  void drawSelf() {
    image(images[status], x, y);    
  }
}
