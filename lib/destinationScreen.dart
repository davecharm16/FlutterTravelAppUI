import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp/models/activities.dart';
import 'package:travelapp/models/destinations.dart';


class DestinationScreen extends StatefulWidget{
  final Destination destination;
  DestinationScreen(this.destination);
  @override
  State<StatefulWidget> createState(){
    return DestinationScreenState(destination);
  }
}

class DestinationScreenState extends State<DestinationScreen>{
  Destination destination;
  DestinationScreenState(this.destination);
  List<Icon> getRating(int rating){
    List<Icon> ratings = [];
    for(int i = 0; i < 5; i++){
      ratings.add(
        Icon(Icons.star, color: i<rating?Colors.orange:Colors.grey, size: 15.0,)
      );
    }
    return ratings;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children:<Widget>[
            Container(         
              height: 270,
              child:ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25.0), bottomRight:Radius.circular(25.0)),
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Image(image: AssetImage(destination.imageUrl),
                      height:270,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0, vertical:20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context,true);
                            },
                            child: Icon(
                              Icons.arrow_back, color: Colors.white, size: 30.0,
                              )
                            ),
                          // FaIcon(FontAwesomeIcons.return, size: 30, color:Colors.white),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.search, color: Colors.white, size: 30.0,),
                              SizedBox(width:10.0),
                              Icon(Icons.menu, color: Colors.white, size: 30.0,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ),
            Container(
              padding: EdgeInsets.only(top:15,left:10,right:10),
              decoration: BoxDecoration(
              ),
              height: 345,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: destination.activities.length,
                itemBuilder: (context, int index){
                  Activities activity = destination.activities[index];
                  return Container(
                    padding: EdgeInsets.only(right: 3.0),
                    margin: EdgeInsets.only(bottom:10.0,  top: 1.0),
                    height: 140,
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children:<Widget>[
                        Container(
                          padding: EdgeInsets.only(right:2.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:BorderRadius.only(topLeft: Radius.circular(20.0), bottomLeft: Radius.circular(20.0), topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                            // boxShadow: [BoxShadow(offset:Offset.zero,blurRadius: 0.01)],
                          ),
                          width: 320.0,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 4,
                                  child: SizedBox(
                                ),
                              ),
                              Expanded(
                                  flex: 7,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(activity.activity, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    Row(
                                      children:getRating(activity.rate),
                                      ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                      Container(
                                        height: 25,
                                        width: 70,
                                          decoration: BoxDecoration(
                                          color: Colors.lightBlue[700],
                                          borderRadius:BorderRadius.circular(15),
                                        ),
                                        child:Center(child:Text(activity.time[0],style: TextStyle(color: Colors.grey[100]),)),
                                      ),
                                      Container(
                                        height: 25,
                                        width: 70,
                                          decoration: BoxDecoration(
                                          color: Colors.lightBlue[700],
                                          borderRadius:BorderRadius.circular(15),
                                        ),
                                        child:Center(child:Text(activity.time[1],style: TextStyle(color: Colors.grey[50]),)),
                                      ),
                                    ],)
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                  child: Padding(
                                    padding: EdgeInsets.only(top:10),
                                    child: Column(
                                    children: <Widget>[
                                      Text('₱'+activity.price.toString(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),),
                                      Text('per pass', style: TextStyle(color: Colors.grey),)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            left: 0,
                            top: 10,
                            child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(image: AssetImage(activity.imageUrl),
                              height: 120,
                              width: 100,
                              fit: BoxFit.cover,
                              ),
                            ),
                        )
                      ]
                    )
                  );
                }
              ),
            )
          ],
        )
      ),
    );
  }
}

