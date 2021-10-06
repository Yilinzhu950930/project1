Person[] persons;
float infectionRate = 0.03;
float immuneRate = 0.0005;
float deathRate = 0.0005;
float infectionDistance = 100;
int intialInfections = 5;

void setup() {
  size(800, 600, P2D);
  textSize(15);
  fill(0, 408, 612);

  persons = new Person[100];
  for(int i=0;i<persons.length;i++) {
    persons[i] = new Person();
  }
  for(int i=0;i<intialInfections;i++) {
    persons[i].status = 1;
  }
  
}

void infect() {
  for(int i=0;i<persons.length;i++) {
    if(persons[i].status==1) {
      for(int j=0;j<persons.length;j++) {
        if(persons[j].status ==0 && persons[i].distance(persons[j])<30) {
          if(random(0,1)<infectionRate) {
            persons[j].status = 1;
          }
        }
      }
      if(random(0,1)<immuneRate) {
        persons[i].status = 2;
      }
      if(random(0,1)<deathRate) {
        persons[i].status = 3;
      }
    }
  }  
}

void draw() {
  background(255);
  for(int i=0;i<persons.length;i++) {
    persons[i].move();
    persons[i].drawSelf();
  }
  infect();
  
  int immuneCount = 0;
  int infectedCount = 0;
  int deathCount = 0;
  int normalCount = 0;
  for(int i=0;i<persons.length;i++) {
    if(persons[i].status==0) normalCount++;
    if(persons[i].status==1) infectedCount++;
    if(persons[i].status==2) immuneCount++;
    if(persons[i].status==3) deathCount++;
  }
  
  text("Nornal: "+normalCount, 10,10);
  text("Immune: "+immuneCount, 10,40);
  text("Infected: "+infectedCount, 10,70);
  text("Death: "+deathCount, 10,100);
  
  
}
