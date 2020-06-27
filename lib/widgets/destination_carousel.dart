import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp/models/destinations.dart';

import '../destinationScreen.dart';

class DestinationCarousel extends StatefulWidget {
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {


  List<GestureDetector> getDestinations(List<Destination> destinations){

    List<GestureDetector> des = [];

    for(int index = 0; index < destinations.length; index++){
      Destination destination = destinations[index];
      String url = destination.imageUrl;
      String city = destination.city;
      des.add(
        GestureDetector(
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DestinationScreen(destination)));
          },
          child: Container(
            margin: EdgeInsets.only(right: 10.0),
            width:200,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                  Positioned(
                  left: 0,
                  bottom: 50,
                    child: Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [BoxShadow(color: Colors.grey,offset:Offset(1.0,4.0,), blurRadius:6.0)],
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(left: 10, top: 30, right: 10, bottom: 10),
                      width: 200,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(destination.activities.length.toString()+ ' activities', style: TextStyle(fontSize:20, fontWeight:FontWeight.w600, color: Colors.black),),
                        Container(
                          width: 160.0,
                          child: Text(destination.description, style: TextStyle(color: Colors.grey[800],fontSize: 13.0, fontWeight: FontWeight.w100),))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(1.0, 4.0), blurRadius: 6.0)]
                  ),
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image(
                        height: 180,
                        width: 180,
                        image: AssetImage('$url'),
                        fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('$city', style:TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children:<Widget>[
                                FaIcon(FontAwesomeIcons.locationArrow, color: Colors.white, size: 10.0,),
                                SizedBox(width: 10.0,),
                                Text(destination.country, style: TextStyle(color:Colors.white, fontSize:16.0),)
                              ],
                            )
                          ]
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      
    }
    return des;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      child: Column(
        children : <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Top Destinations',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize : 22.0,
                ),
              ),
              GestureDetector(
                child: Text('See All',
                  style: TextStyle(
                    color: Colors.teal[200],
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Container(
              height: 300.0,
              child: ListView(
              scrollDirection: Axis.horizontal,
              children: 
                getDestinations(destinations),
            ),
          )
        ]
      ),
    );
  }
}