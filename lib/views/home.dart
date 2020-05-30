import 'package:flutter_travel_ui/data/data.dart';
import 'package:flutter_travel_ui/model/country_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


List<CountryModel> country = new List();
@override
  void initState(){
    country = getCountries();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
         padding: EdgeInsets.all(4),
         child: Image.asset("assets/menu.png",
         height: 20,
         width: 20,
        ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset("assets/logo.png",
          
          height: 30,
          ),
          Text(
            "Travel Anna`s App",
            style: 
              TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
          ))
        ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal:16),
          
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
              ),
          ),
        ],
        elevation: 0.0,
      ),
          body: Container(
            color: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                "Find the best tour",
                  style: 
                    TextStyle(
                      fontSize: 28,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 8,
                  
                ),
                Text(
                "Country",
                  style: 
                    TextStyle(
                      fontSize: 19,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                  ),
                ),
                  SizedBox(
                  height: 16, 
                ),
                Container(
                  height: 220,
                  child: ListView.builder(
                    itemCount: country.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return CountryListTitle(
                        label: country[index].label,
                        countryName: country[index].countryName,
                        noOfTours: country[index].noOfTours,
                        rating: country[index].rating,
                      );
                    }),
                ),
              ],
            ),
          ),
    );
  }
}

class CountryListTitle extends StatelessWidget {

  final String label;
  final String countryName;
  final int noOfTours;
  final double rating;
  CountryListTitle({@required this.countryName,@required this.label,@required this.noOfTours,@required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network("https://images.pexels.com/photos/2098427/pexels-photo-2098427.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            height: 200,
            width: 150,
            fit: BoxFit.cover),
          ),
          Container(
            height: 200,
            width: 150,
            child: Column(
              children: [
                Row(
                  children: [
                  Container(
                    margin: EdgeInsets.only(left: 8, top: 8),
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white38,
                      ),
                    child: Text(label ?? "New",
                    style: TextStyle(color: Colors.white),
                    )
                  )
                ],),
                Spacer(),
                Row(children: [
                  Container(
                  margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text("Thailand",
                        style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 3,),
                      Text("18 Tours",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  Spacer(),

                  Container(
                    margin: EdgeInsets.only(bottom: 10, right: 8),
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white38),
                      child: Column(
                        children: [
                          Text("4.5",
                          style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                          ),
                          SizedBox(height: 2,),
                          Icon(Icons.star, color: Colors.white,
                          size: 20,
                          )
                        ],
                      ))
                ],
              )
            ],)
          )
        ],
      ),
    );
  }
}