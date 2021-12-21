import java.util.Queue;
import java.util.LinkedList;
Elevator elevator1;
Elevator elevator2;
Outside_Button[] obutton = new Outside_Button[5];
Direction_button[] d = new Direction_button[10];
Inside_Button[] ibutton = new Inside_Button[10];
public double target1;
public double target2;

void setup() {
  size(1200, 1200);
  //create elevator object
  elevator1 = new Elevator(1);
  elevator2 = new Elevator(2);
  for (int i=0;i<5;i++){
    obutton[i] = new Outside_Button(width/3*1-200,height/6*(i+1)-60,15,35);
    d[i] = new Direction_button(width/3*1-20,height/6*(i+1)-80);
    d[i+5] =  new Direction_button(width/3*2-20,height/6*(i+1)-80);
  }
  for (int i=0;i<2;i++){
     for(int j=0;j<2;j++){
          ibutton[i*5+j]=new Inside_Button(width/3*(i+1)-120,1050+j*30,23,35);
          ibutton[i*5+j+2]=new Inside_Button(width/3*(i+1)-80,1050+j*30,23,35);
     }
     ibutton[i*5+4] = new Inside_Button(width/3*(i+1)-40,1050,23,35);
  }

}
void draw() {
  background(255);
  //draw five floors
  line(0,height/6,width,height/6);
  line(0,height/6*2,width,height/6*2);
  line(0,height/6*3,width,height/6*3);
  line(0,height/6*4,width,height/6*4);
  line(0,height/6*5,width,height/6*5);
  elevator1.draw();
  elevator2.draw();
  //Complete the inside_button
    fill(200);
    rect(width/3*1-140, 1020, 150, 100);
    rect(width/3*2-140, 1020, 150, 100);
        
  //draw buttons and arrows by iteration
  for(int i=0;i<5;i++){
      obutton[i].draw();
      d[i].draw();
      d[i+5].draw();
      ibutton[i].draw();
      ibutton[i+5].draw();
  }
  int floor1  = 5-(int)elevator1.high/200;
    int floor2  = 5-(int)elevator2.high/200;
    ibutton[floor1-1].on = false;
   ibutton[floor2+4].on = false;
  //define the state of buttons and arrows
    if(obutton[0].on==true){
      if(elevator1.high == height/6*1-150 || elevator2.high == height/6*1-150){
        obutton[0].on=false;
      }
    }
    if(obutton[1].on==true){
      if(elevator1.high == height/6*2-150 || elevator2.high == height/6*2-150){
        obutton[1].on=false;
      }
    }
    if(obutton[2].on==true){
      if(elevator1.high == height/6*3-150 || elevator2.high == height/6*3-150){
        obutton[2].on=false;
      }
    }
    if(obutton[3].on==true){
      if(elevator1.high == height/6*4-150 || elevator2.high == height/6*4-150){
        obutton[3].on=false;
      }
    }
    if(obutton[4].on==true){
      if(elevator1.high == height/6*5-150 || elevator2.high == height/6*5-150){
        obutton[4].on=false;
      }
    }
   
   
  if(elevator1.up == true){
    for(int i=0;i<5;i++){
         d[i].up = true;
      }
    }
    else if(elevator1.down == true){
      for(int i=0;i<5;i++){
         d[i].down = true;
      }
    }
    else{
      for(int i=0;i<5;i++){
        d[i].up = false;
         d[i].down = false;
      }
    }
    if(elevator2.up == true){
    for(int i=5;i<10;i++){
         d[i].up = true;
      }
    }
    else if(elevator2.down == true){
      for(int i=5;i<10;i++){
         d[i].down = true;
      }
    }
    else{
      for(int i=5;i<10;i++){
        d[i].up = false;
         d[i].down = false;
      }
    }
    fill(0);
    textSize(30);
    floor1  = 5-(int)elevator1.high/200;
    floor2  = 5-(int)elevator2.high/200;
    text("Floor: " + floor1, width/3*1-120, 1040);
    text("Floor: " + floor2, width/3*2-120, 1040);
    textSize(20);
    for (int i=0;i<2;i++){
     for(int j=0;j<2;j++){
       String ind = ""+(j+1);
       text(ind,width/3*(i+1)-95,1075+j*30);
       ind = ""+(j+3);
       text(ind,width/3*(i+1)-55,1075+j*30);
     }
     String ind = ""+5;
     text(ind,width/3*(i+1)-15,1075);
    
  }
    
}
void mousePressed(){
  //internal panel logic
  for (int i=0;i<5;i++){
    int target = height/6*(5-i)-150;
    if(ibutton[i].isClicked()&&elevator1.high != target){
        ibutton[i].on = true;
        elevator1.q.add(target);
     }
     if(ibutton[i+5].isClicked()&&elevator2.high != target){
        ibutton[i+5].on = true;
        elevator2.q.add(target);
     }
  }
 //external panel logic
 for(int i=0;i<5;i++){
   if(obutton[i].isClicked()){
       int tar = height/6*(i+1)-150;
       if(elevator1.high != tar && elevator2.high != tar ){
         obutton[i].on = true;
         if(elevator1.start == false&&elevator2.start == true){
             elevator1.q.add(tar);
         }
         else if(elevator2.start == false&&elevator1.start == true){
             elevator2.q.add(tar);
         }
         else if(elevator2.start == false&&elevator1.start == false){
             int high1 = (int)(abs((float)(elevator1.high-tar)));
             int high2 = (int)(abs((float)(elevator2.high-tar)));
             if(high1>high2){
               elevator2.q.add(tar);
             }
             else{
               elevator1.q.add(tar);
             }
         }
         else{
           elevator1.q.add(tar);
         }
   
         }
       
      }
 }
   
    
}
