import java.util.Arrays;

Cog cog1, cog2;
Track track;

void setup(){
  size(800,800); //window size
  //fullScreen();
  Cog cog1 = new Cog(400, 400, 100, 75, new Rgb(200, 0, 0));
  Cog cog2 = new Cog(400, 400, 75, 0, new Rgb(230, 200, 0));
  ArrayList<Cog> cogs = new ArrayList<Cog>(Arrays.asList(cog1, cog2));
  
  this.track = new Track(400, 400, 300);
  this.track.addCogs(cogs);
}

void draw(){
  background(0, 0, 200); //background color
  
  //this.track.display();
  float[] speeds = {1.0, 0.5};
  this.track.spinAllCogs(speeds);
  this.track.drawAllConcurrently();
}
