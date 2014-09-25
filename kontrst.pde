//KONTRST by © Nithin Davis N.
//Measures contrast ratios for help with analysing colors for 
//accessibility standards in ui design.
PImage img ;
int res ;
color px ;

void setup ( ) {
  size ( 800 , 533 ) ;
  img = loadImage ( "sample.jpg" ) ;
  noStroke ( ) ;
  res = 1 ;
  noLoop ( ) ;
}

void draw ( ) {
  
  image ( img , 0 , 0 ) ;
  loadPixels ( ) ;
  background(0);
  
  for ( int x = 0 ; x < width ; x += res ) {
    for ( int y = 0 ; y < height ; y += res ) {
      px = pixels [ y * width + x ] ;
      fill ( px ) ;
      rect ( x , y , res , res ) ;
      float b1 = ( ( red ( px ) * 299 ) + ( green ( px ) * 587 ) + ( blue ( px ) * 114 ) ) / 1000 ;
      if ( x < width - 2 ) {
        px = pixels [ y * width + ( x + 2 ) ] ;
      }
      float  b2 = ( red ( px ) * 299 + green ( px ) * 587 + blue ( px ) * 114 ) / 1000 ;
      
      float diff = abs ( b1 - b2 ) ;
      
      if(diff < 10) {
        //they are probably the same color...ignore such things
      }
      
      else if ( diff < 100 ) {
        fill ( #ff0000 ) ;
        rect ( x , y , 100 , 10 ) ;
      }
      
      else {
        fill ( #00ff00 ) ;
        rect ( x , y , 100 , 10 ) ;
        
      }
        
      
    }
    
  }
     
  
}
