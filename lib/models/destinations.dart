import 'activities.dart';

class Destination{
  String city;
  String country;
  List activities;
  String description;
  String imageUrl;
  Destination(this.city,this.country,this.activities,this.description,this.imageUrl);
}
List<Activities> activities1= [
  Activities('assets/images/activities/image1.jpg', 'Sunset Cruise', ['4:00 PM','6:00PM'], 5,800),
  Activities('assets/images/activities/image2.jpg', 'Groud Island Hopping', ['11:00 AM','3:00PM'], 5,2200),
  Activities('assets/images/activities/image3.jpg', 'ParaSailing', ['10:00 AM','4:00PM'], 4,2500),
  Activities('assets/images/activities/image4.jpg', 'Paraw Sailing', ['2:00 PM','6:00PM'],4 ,3200),
];
List<Activities> activities2= [
  Activities('assets/images/activities/image5.jpg', 'Cloud9 Surfing', ['8:00 AM','3:00PM'],5 ,1850),
  Activities('assets/images/activities/image6.jpg', 'Maasin Village palm tree swing', ['11:00 AM','3:00PM'], 4,150),
  Activities('assets/images/activities/image7.jpg', 'Sugba Lagoon day trip', ['10:00 AM','4:00PM'],5,1500),
];
List<Activities> activities3= [
  Activities('assets/images/activities/image8.jpg', 'Sabtang Island Tour', ['4:00 PM','6:00PM'],5 ,900),
  Activities('assets/images/activities/image9.jpg', 'Trek Mt. Iraya', ['11:00 AM','3:00PM'],5 ,700),
  Activities('assets/images/activities/image10.jpg', 'Nakabuang Beach', ['10:00 AM','4:00PM'], 5,800),
  Activities('assets/images/activities/image11.jpg', 'Sugba Lagoon day trip', ['2:00 PM','6:00PM'],5 ,350),
];
List<Activities> activities4= [
  Activities('assets/images/activities/image12.jpg', 'WWII Japanese Shipwrecks', ['4:00 PM','6:PM'], 5,1200),
  Activities('assets/images/activities/image13.jpg', 'Coral Gardens', ['11:00 AM','3:00PM'],5 ,1300),
  Activities('assets/images/activities/image14.jpg', 'Calauit Safari Park', ['11:00 AM','3:00PM'],4 ,750),

];

List<Destination> destinations = [
  Destination('Boracay', 'Philippines', activities1, "This is the Famous White Sand Beach of Boracay", 'assets/images/destination/image1.jpg'),
  Destination('Surigao', 'Philippines', activities2, "Siargao Islands, known for Surfingand Island Hopings", 'assets/images/destination/image2.jpg'),
  Destination('Batanes', 'Philippines', activities3, "This is the Heaven of the North Philippines", 'assets/images/destination/image3.jpg'),
  Destination('Palawan', 'Philippines', activities4, " best known for world-class WWII-era wreck diving, though the area also offers limestone karst landscapes, crystal-clear freshwater lakes and shallow-water coral reefs.", 'assets/images/destination/image5.jpg'),
];