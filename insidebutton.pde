class Inside_Button{
  float wid;
  float heigh;
  float row;
  float col;
  boolean on = false;
  
  Inside_Button(float wid, float heigh, float row, float col){
    this.wid = wid;
    this.heigh = heigh;
    this.row = row;
    this.col = col;
  }
  
  boolean isClicked(){
    return (mouseX > wid && mouseY > heigh && mouseX < wid + row &&
    mouseY < heigh + col);
  }
    
  
  void draw(){
    if(on == true){
    fill(150);
    circle(wid+row/2,heigh+col/2,row-5);
      
    } else {
    fill(255);
    circle(wid+row/2,heigh+col/2,row-5); 
    
  }
}
}
