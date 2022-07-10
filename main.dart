import 'package:flutter/material.dart';

import 'level.dart';
void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tic Tac Toe",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home:  const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
   const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List myList=['','','','','','','','',''];
  List lastmove=[''];
  String winmsg=' ';

  int currentPos=10;
  int i=16;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 5,
        shadowColor: Colors.black,
        title: const Center(child: Text("Tic Tac Toe",style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),)),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 80,
              //width: MediaQuery.of(context).size.width,
              width: 400,
              decoration: const BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
              ),
              child: Center(
                child: Text(winmsg==' '?"Play...":winmsg , style:const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.55,
              //width: MediaQuery.of(context).size.width,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.only(top:20,right: 10,left: 15,bottom: 10),
                child: GridView.builder(
                 // physics: const NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 1),
                 itemBuilder: (context,index){
                  return GestureDetector(
                    onTap:(){
                      setState(() {
                        currentPos=index;
                        if(myList[currentPos]=='' && lastmove[0]==''){
                          myList[currentPos]='o';
                          lastmove[0]='o';
                        }else if(myList[currentPos]=='' && lastmove[0]=='o'){
                          myList[currentPos]='x';
                          lastmove[0]='x';
                        }else if(myList[currentPos]=='' && lastmove[0]=='x'){
                          myList[currentPos]='o';
                          lastmove[0]='o';
                        }
                         if(myList[0]=='' && myList[1]=='' && myList[2]=='' && myList[3]=='' && myList[4]=='' 
                        && myList[5]=='' && myList[6]=='' && myList[7]=='' && myList[8]==''){
                          winmsg='';
                        }else if(myList[0]=='o' && myList[1]=='o' && myList[2]=='o'
                        || myList[0]=='o' && myList[3]=='o' && myList[6]=='o'
                        || myList[3]=='o' && myList[4]=='o' && myList[5]=='o'
                        || myList[6]=='o' && myList[7]=='o' && myList[8]=='o'
                        || myList[1]=='o' && myList[4]=='o' && myList[7]=='o'
                        || myList[2]=='o' && myList[5]=='o' && myList[8]=='o'
                        || myList[0]=='o' && myList[4]=='o' && myList[8]=='o'
                        || myList[2]=='o' && myList[4]=='o' && myList[6]=='o'
                        ){
                          winmsg='Won!!!';
                        }else if(myList[0]=='x' && myList[1]=='x' && myList[2]=='x'
                        || myList[0]=='x' && myList[3]=='x' && myList[6]=='x'
                        || myList[3]=='x' && myList[4]=='x' && myList[5]=='x'
                        || myList[6]=='x' && myList[7]=='x' && myList[8]=='x'
                        || myList[1]=='x' && myList[4]=='x' && myList[7]=='x'
                        || myList[2]=='x' && myList[5]=='x' && myList[8]=='x'
                        || myList[0]=='x' && myList[4]=='x' && myList[8]=='x'
                        || myList[2]=='x' && myList[4]=='x' && myList[6]=='x'
                        ){
                          winmsg='Won!!!';
                        }

                      });
                    },
                    child: 
                    Padding(
                      padding: const EdgeInsets.only(top:10.0,right: 10),
                      child: Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)
                          ),
                          
                          child: Center(child: Text (myList[index].toString(),style:myList[index].toString()=='x'? const TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                             color: Colors.red,
                          ):const TextStyle(fontSize: 100,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                  );
                 }),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.17,
             // width: MediaQuery.of(context).size.width,
             width: 400,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10)
              ),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.black,
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            myList=['','','','','','','','',''];
                            winmsg=' ';
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 150,
                          color: Colors.lightBlue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Restart",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                               Icon(Icons.restart_alt,size: 20,color: Colors.white,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text("Play:"),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (contex)=> const LevelPage()),
                        );
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 40,
                      color: Colors.white,
                      child: const Center(child: Text("4X4",style: TextStyle(
                        fontWeight:FontWeight.bold,
                      ),)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
              //width: MediaQuery.of(context).size.width,
              width: 400,
              child: const Center(child: Text("by Pro Win")),
            )
          ],
        ),
      ),
    );
  }
}