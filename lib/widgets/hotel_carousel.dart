import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/models/hotel.dart';

class HotelCarousel extends StatefulWidget {
  @override
  _HotelCarouselState createState() => _HotelCarouselState();
}

class _HotelCarouselState extends State<HotelCarousel> {


  List<GestureDetector> getHotels(List<Hotel> hotels){

    List<GestureDetector> des = [];

    for(int index = 0; index < hotels.length; index++){
      Hotel hotel = hotels[index];
      String url = hotel.imageUrl;
      des.add(
        GestureDetector(
          onTap:(){
            
          },
          child: Container(
            margin: EdgeInsets.only(right: 10.0),
            width:250,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                  Positioned(
                  left: 0,
                  bottom: 20,
                    child: Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [BoxShadow(color: Colors.grey,offset:Offset(1.0,4.0,), blurRadius:6.0)],
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(left: 10, top: 30, bottom: 10),
                      width: 250,
                      height: 120,
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(hotel.hotelName, style: TextStyle(fontSize:18, fontWeight:FontWeight.w300, color: Colors.black),),
                        Text('₱' + hotel.price.toString() + '/Night',style: TextStyle(fontSize:20, fontWeight:FontWeight.w600, color: Colors.black),),
                        Container(
                          width: 160.0,
                          child: Text(hotel.address, style: TextStyle(color: Colors.grey[800],fontSize: 13.0, fontWeight: FontWeight.w100),))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 180,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [BoxShadow(color: Colors.grey,offset: Offset(1.0, 4.0), blurRadius: 6.0)]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image(
                    height: 180,
                    width: 220,
                    image: AssetImage('$url'),
                    fit: BoxFit.cover,
                    ),
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
              Text('Exclusive Hotels',
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
                getHotels(hotels),
            ),
          )
        ]
      ),
    );
  }
}