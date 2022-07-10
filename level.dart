import 'package:flutter/material.dart';

import 'main.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({Key? key}) : super(key: key);

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  List myList=['','','','','','','','','','','','','','','',''];
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
                  itemCount: 16,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
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
                        && myList[5]=='' && myList[6]=='' && myList[7]=='' && myList[8]==''&& myList[9]==''
                        && myList[10]==''&& myList[11]=='' && myList[12]==''
                        && myList[13]==''&& myList[14]=='' && myList[15]==''){
                          winmsg='';
                        }else if(myList[0]=='o' && myList[1]=='o' && myList[2]=='o' && myList[3]=='o'
                        || myList[0]=='o' && myList[4]=='o' && myList[8]=='o' && myList[12]=='o'
                        || myList[4]=='o' && myList[5]=='o' && myList[6]=='o' && myList[7]=='o'
                        || myList[8]=='o' && myList[9]=='o' && myList[10]=='o' && myList[11]=='o'
                        || myList[12]=='o' && myList[13]=='o' && myList[14]=='o' && myList[15]=='o'
                        || myList[1]=='o' && myList[5]=='o' && myList[9]=='o' && myList[13]=='o'
                        || myList[2]=='o' && myList[6]=='o' && myList[10]=='o' && myList[14]=='o'
                        || myList[3]=='o' && myList[7]=='o' && myList[11]=='o' && myList[15]=='o'
                        || myList[0]=='o' && myList[5]=='o' && myList[10]=='o' && myList[15]=='o'
                        || myList[3]=='o' && myList[6]=='o' && myList[9]=='o' && myList[12]=='o'
                        ){
                          winmsg='Won!!!';
                        }else if(myList[0]=='x' && myList[1]=='x' && myList[2]=='x' && myList[3]=='x'
                        || myList[0]=='x' && myList[4]=='x' && myList[8]=='x' && myList[12]=='x'
                        || myList[4]=='x' && myList[5]=='x' && myList[6]=='x' && myList[7]=='x'
                        || myList[8]=='x' && myList[9]=='x' && myList[10]=='x' && myList[11]=='x'
                        || myList[12]=='x' && myList[13]=='x' && myList[14]=='x' && myList[15]=='x'
                        || myList[1]=='x' && myList[5]=='x' && myList[9]=='x' && myList[13]=='x'
                        || myList[2]=='x' && myList[6]=='x' && myList[10]=='x' && myList[14]=='x'
                        || myList[3]=='x' && myList[7]=='x' && myList[11]=='x' && myList[15]=='x'
                        || myList[0]=='x' && myList[5]=='x' && myList[10]=='x' && myList[15]=='x'
                        || myList[3]=='x' && myList[6]=='x' && myList[9]=='x' && myList[12]=='x'
                        ){
                          winmsg='Won!!!';
                        }

                      });
                    },
                    child: 
                    Padding(
                      padding: const EdgeInsets.only(top:5.0,right: 5),
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 100,
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
              //width: MediaQuery.of(context).size.width,
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
                            myList=['','','','','','','','','','','','','','','',''];
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
                          MaterialPageRoute(builder: (contex)=>const MyHome()),
                        );
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 40,
                      color: Colors.white,
                      child: const Center(child: Text("3X3",style: TextStyle(
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