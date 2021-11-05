BigBang[] star = new BigBang[1000];

void setup() {
  size(400, 400);
  for (int i = 0; i < 5; i ++)
    star[i] = new infinity();
  for (int i = 5; i < star.length; i ++)
    star[i] = new BigBang();
}

void draw() {
  background(255);
  for (int i = 0; i < star.length; i ++) {
    star[i].show();
    star[i].explode();
  }
}

void mouseClicked() {
  
}

class BigBang {
  double myX, myY, myLength, mySpeed, myAngle;
  BigBang() {
    myX = myY = 200;
    mySpeed = (Math.random() * 10) - 5;
    myLength = 0.0;
    myAngle = (Math.random() * 2*Math.PI);
  }
  void explode() {
    myX += mySpeed*Math.cos(myAngle);
    myY += mySpeed*Math.sin(myAngle);
    myLength += mySpeed;
    if (myX < 0 || myY < 0 || myX  > 400 || myY > 400)
      myX = myY = 200;
  }
  void show() {
    stroke((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
    strokeWeight(2);
    line((float)myX, (float)myY, (float)(myX + myLength*Math.cos(myAngle)), (float)(myY + myLength*Math.sin(myAngle)));
  }
}

class infinity extends BigBang {
  int myColor[];
  infinity() {
    mySpeed = (Math.random() * 2) - 1;
    myColor = new int[5];
    for (int i = 0; i < myColor.length; i ++)
      myColor[i] = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
  }
  void show() {
    fill(myColor[0]);
    ellipse((float)myX, (float)myY, 15, 12);
  }
}
