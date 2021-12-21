class Elevator {
 private int num;
 private int speed = 5;
 public double target_height = height/6*5-150;
 private double high = height/6*5-150;
 public boolean start = false;
 boolean up = false;
 boolean down = false;
 Queue<Integer> q = new LinkedList<Integer>();
 
 
 Elevator(int num){
   this.num = num;
 
 }
 
 void draw(){
   
   
   if (q.peek() != null) {
      target_height = q.element(); 
      
      if (target_height < high){
        up = true;
        start = true;
        high = high - speed;
        
        
      } else if (target_height > high) {
        down = true;
        start = true;
        high = high + speed;
        
      } else{
          down = false;
          up = false;
          start = false;
          q.remove();
          
        }
   }
 
   

      
    fill(200);
    rect(width/3*num+0,(float)high, 60, 150);
    rect(width/3*num+60,(float)high, 60, 150);
    
 }
 
}
      
   
