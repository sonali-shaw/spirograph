Cog cog;
Track track;

void setup(){
  size(800,800); //window size
  //fullScreen();
  this.cog = new Cog(400, 400, 50);
  this.track = new Track(400, 400, 200);
  this.track.addCog(cog);
}

void draw(){
  background(200, 0, 0); //background color
  
  this.track.display();
  this.track.spinCog(0, 1);
  this.track.makeDrawing(0);
  
  //this.cog.display();
  //this.cog.move(1);
}
