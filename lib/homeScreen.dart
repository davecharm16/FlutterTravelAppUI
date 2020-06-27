
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp/widgets/destination_carousel.dart';
import 'package:travelapp/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selected_index = 0;
  int selected_tab = 0;
  List _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.hotel,
    FontAwesomeIcons.personBooth,
    FontAwesomeIcons.biking,
  ];
  List<GestureDetector> getIcon(){
    List<GestureDetector> icon = [];
    for(int index = 0; index < _icons.length; index++){
      icon.add(
        GestureDetector(
          onTap: (){
            setState(() {
              selected_tab = index;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical:10.0,horizontal:15.0),
            height: 55.0,
            width: 55.0,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: index == selected_tab ? Colors.teal[100]:Colors.grey[200],
            ),
            child: Center(
              child: FaIcon(
                _icons[index], 
                color: index == selected_tab ? Colors.teal:Colors.grey,
                size: 25.0,
              ),
            ),
          ),
        )
      );
    }
    return icon;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal:10.0, vertical: 30.0,),
        children: <Widget>[
          Container(
            child: Text('What would you like to find?', 
              style:TextStyle(
                color: Colors.grey[900],
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: getIcon(),
          ),
          SizedBox(height: 20.0,),
          DestinationCarousel(),
          SizedBox(height: 20.0,),
          HotelCarousel(),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected_index,
        onTap: (int value){
          setState(() {
            _selected_index = value;
          });
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.search,), title: SizedBox.shrink()),
        BottomNavigationBarItem(icon: Icon(Icons.local_pizza),title: SizedBox.shrink()),
        BottomNavigationBarItem(icon: CircleAvatar(backgroundImage: AssetImage('assets/images/avatar/avatar.jpg'), radius: 12.0,),title: SizedBox.shrink()),
      ],
      selectedItemColor: Colors.teal,
      ),
    );
  }
}