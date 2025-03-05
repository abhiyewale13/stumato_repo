import 'package:flutter/material.dart';
import 'package:stumato_march/CardDetails/view/cardDetailsScreen.dart';


class Firstscreen extends StatelessWidget {
  const Firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 10,
          left: 10
          ),
        child: Column(
          children: [
            Container(
              height: 70,
              padding: EdgeInsets.only(
                
                left: 10,
                right: 10
              ),
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                 color:Color(0x1A06C270),
                boxShadow: [
          BoxShadow(
            color: Color(0x1A06C270),
            spreadRadius: 7,
            blurRadius: 3,
            offset: Offset(0, 1)
          )
                ],
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  color: Color(0xFF06C270),
                  width: 1
                )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF06C270),
                          spreadRadius: 1,
                          blurRadius: 4
                        )
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("execellent",style: TextStyle(
                          fontSize: 8,
                          fontFamily: "Denton",
                          
                          color:  Color(0xFF3CE99E)
                        ),),
                         Text("100% TIMELY PAYMENTS",style: TextStyle(
                          fontSize: 2,
                          fontFamily: "Gilroy",
                          color:  Color(0xFF0D0D0D)
                        ),)
                      ],
                    ),
                  ),
               SizedBox(
                width: 5,
               ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width*0.4,
                  child: Text("Refresh your credit score to able to view your latest loan details",
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontSize: 12
                  ),
                  )),
                      SizedBox(
                width: 5,
               ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>CardDetailsScreen())
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.blue,
                            width: 2
                          )
                        )
                      ),
                      child: Text(
                       
                          "GET DETAILS ",
                          style: TextStyle(
                            fontSize: 10,
                            
                            decorationThickness: 3,
                            color: Colors.blue,
                            fontFamily: "Gilroy"
                          )
                        )
                      ),
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}