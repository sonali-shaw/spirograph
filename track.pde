class Track{
  PVector center;
  int radius;
  ArrayList<Cog> cogs = new ArrayList<Cog>();
  ArrayList<Float> cogAngles = new ArrayList<Float>();
  ArrayList<Integer> cogRevs = new ArrayList<Integer>();
  
  Track(float x_pos, float y_pos, int rad){
    this.center = new PVector(x_pos, y_pos);
    this.radius = rad;
  }
  
  void display(){
    //outer track
    noFill();
    circle(this.center.x, this.center.y, 2 * this.radius);
    
    //center
    fill(0);
    circle(this.center.x, this.center.y, 5);
    
    for (int i = 0; i < this.cogs.size(); i++){
      this.cogs.get(i).display();
    }
  
  }
  
  void makeDrawing(int index){
    Cog cog = cogs.get(index);
    cog.drawPath();
  }
  
  
  void addCog(Cog c){
    this.cogs.add(c);
  }
  
  float angle = 0;
  int revs = 0;
  void spinCog(int index, float speed){
    Cog cog = cogs.get(index);
    
    cog.center.x = this.center.x + (this.radius - cog.radius) * cos(angle);
    cog.center.y = this.center.y + (this.radius - cog.radius) * sin(angle);
    
    cog.spinPoint(0.2);
        
    // Keep angle within [0, 2π] and track revolutions
    if (angle >= TWO_PI) {
        angle -= TWO_PI;
        revs++;  
    }
    
    angle += speed/25;  // Increment angle (speed)

  }
  
  //multi-cog functionality functions
    void addCogs(ArrayList<Cog> newCogs){
      this.cogs.addAll(newCogs);
    }
    
    void drawAllConcurrently(){
      for (int i = 0; i < this.cogs.size(); i++){
         makeDrawing(i);
      }
    }
    
    void spinAllCogs(float speed){
      for (int i = 0; i < this.cogs.size(); i++){
        this.spinCog(i, speed);
      }
    }
    
    void spinAllCogs(float[] speeds){
      
      if (this.cogs.size() != speeds.length){
        throw new Error("speeds and cogs dimension mismatch");
      }
      
      for (int i = 0; i < this.cogs.size(); i++){
          this.cogAngles.add(0.0);
          this.cogRevs.add(0);
          
          this.spinCog(i, speeds[i]);
        }
      }
    
  
}
