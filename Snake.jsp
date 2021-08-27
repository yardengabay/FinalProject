<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 < title > greedy snake
 <style>
  #map{
   width: 400px;
   height: 400px;
   border: 1px solid black;
  }
  /*Map color*/
  .divMap{
   width: 18px;
   height: 18px;
   margin: 1px;
   background-color: yellow;
   float: left;
  }
  /*Snake color*/
  .divSnake{
    width: 18px;
    height: 18px;
    margin: 1px;
    background-color: red;
    float: left;
   }
  /*Food color*/
  .divFood{
   width: 18px;
   height: 18px;
   margin: 1px;
   background-color: green;
   float: left;
  }
 </style>
 <script>
  var mapX=20;
  Var MAPY = 20; // map boundaries, horizontal and vertical div cells
  Var arramap = new array(); // map array
  Var snackex = [4,5,6,7], snackey = [2,2,2,2]; // snake body initialization coordinate value
  Var foodx, Foody; // create food coordinates
  Var keycode = 39; // the snake moves in the right direction by default

  //Create a map
  function createMap() {
   //Get map outline div
   var map=document.getElementById("map");
   //Map creation div small grid, 20 horizontal and vertical
   for(y=0;y<mapY;y++)
   {
    arrMap[y]= new Array();
    for(x=0;x<mapX;x++)
    {
     //Div lattice
     var div =document.createElement("div");
     div.className= "Divmap"; // initialization style
     Arrmap [y] [x] = div; // put div cells into the map array
     map.appendChild (DIV); // page drawing
    }
   }
  }

  //Create snake body
  function createSnack(){
   //Changing a series of continuous div background colors in the map
   for(i=0;i<snackeX.length;i++)
   {
    arrMap[snackeY[i]][snackeX[i]].className ="divSnake";
   }
  }
  //Remove snake body
  function clearSnack() {
   for(i=0;i<snackeX.length;i++)
   {
    arrMap[snackeY[i]][snackeX[i]].className="divMap";
   }
  }
  //Create food
  function createFood()
  {
   //arrMap[foodY][foodX].className="divFood";
   Var result; // determine whether to regenerate food
   do {
    Result = false; // no overlap by default
    //Random food coordinates
    foodX=parseInt(Math.random()*mapX);
    foodY=parseInt(Math.random()*mapY);

    //Judge that food should not be present in snakes
    for(i=0;i>snackeX.length;i++) {
     if(snackeX[1]==foodX&&snackeY[1]==foodY)
     {
      Result = true; // need to rebuild
      break;
     }
    }

   }while(result);
   arrMap[foodY][foodX].className="divFood";
  }
  //Snake sport
  //1. Remove the snake
  //2. Move the coordinates of the snake body, add the head of the snake and clear the tail
  function snackMove() {
   //Remove snake body
   clearSnack();
   for (i = 0; i < snackeX.length - 1; i++) {
    snackeX[i] = snackeX[i + 1];
    snackeY[i] = snackeY[i + 1];
   }
   //Each time the snake head moves, the snake head increases one space, and the keycode matches the keyboard direction
   switch (keyCode) {
    Case 37 // left
     snackeX[snackeX.length - 1]--;
     break;
    Case 38 // up
     snackeY[snackeY.length - 1]--;
     break;
    Case 39 // right
     snackeX[snackeX.length - 1]++;
     break;
    Case 40 // down
     snackeY[snackeY.length - 1]++;
     break;

   }
   //Eating food
   if (snackeX[snackeX.length - 1] == foodX && snackeY[snackeY.length - 1] == foodY)
   {
    //Eating food
    snackeX[snackeX.length]=snackeX[snackeX.length-1];
    snackeY[snackeY.length]=snackeY[snackeY.length-1];
    //Rearranging the snake
    for(i=snackeX.length-1;i>0;i--)
    {
     snackeX[i]=snackeX[i-1];
     snackeY[i]=snackeY[i-1];
    }
    Createfood(); // regenerates the next food
   }
   //Beyond game borders
   if(snackeX[snackeX.length-1]<0
    || snackeX[snackeX.length-1]>mapX-1
    || snackeY[snackeY.length-1]<0
    || snackeY[snackeY.length-1]>mapY-1)
   {
    Clearinterval (move); // stop moving
    Alert ("end of game");
    return ;
   }

   Createsnack(); // recreate snake body
  }
  //Keyboard events
  function keyDown(){
   var newKey =  event.keyCode// Keyboard keys
   if(keyCode == 37 && newKey == 39||
    keyCode == 39 && newKey == 37||
    keyCode == 38 && newKey == 40||
    keyCode == 40 && newKey == 38
   ) {
    //No turning around
    return ;
   } else if(newKey>=37&&newKey<=40){
    //The user pressed a direction key
    keyCode=newKey;
    }
    else{
     //Other buttons
   }
  }
  //Operation
  window.onload =function () {
   createMap(); //Create a map
   createSnack();//Create snake body
   createFood();//Create food

   Move = setinterval ("snackmove()", 200) // Snake moves
   document.onkeydown  =Keydown; // get the direction key
  }
 </script>
</head>
<body>
<div></div>
</body>
</html>