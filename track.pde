class Track{
  PVector center;
  float radius;
  ArrayList<Cog> cogs = new ArrayList<Cog>();
  
  Track(float x_pos, float y_pos, float rad){
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
    
    this.cogs.get(0).display();
  }
  
  void makeDrawing(int index){
    cog = cogs.get(index);
    cog.drawPath();
  }
  
  void addCog(Cog c){
    this.cogs.add(c);
  }
  
  float angle = 0;
  void spinCog(int index, float speed){
    cog = cogs.get(index);
    
    cog.center.x = this.center.x + (this.radius - cog.radius) * cos(angle);
    cog.center.y = this.center.y + (this.radius - cog.radius) * sin(angle);
    cog.spinPoint(1);
    
    angle += speed/25;
  }
  
}
