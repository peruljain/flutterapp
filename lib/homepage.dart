import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'DrinkDetail.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var Api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res,drinks;


  @override
  void initState() {
    super.initState();
    fetchData();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title : Text("Cocktail App")
        ),
          body: Center(
            child: res != null ?
                ListView.builder(
                    itemCount: drinks.length,

                    itemBuilder: (context,index){
                     var drink = drinks[index];

                     return ListTile(

                       leading: Hero(
                         tag: drink["idDrink"],
                         child: CircleAvatar(
                           backgroundImage: NetworkImage(
                             drink["strDrinkThumb"] ??
                                 "http://www.4motiondarlington.org/wp-content/uploads/2013/06/No-image-found.jpg",
                           ),
                         ),
                       ),
                       title: Text(
                         "${drink["strDrink"]}",
                         style: TextStyle(
                           fontSize: 22,
                           color: Colors.white,
                         ),
                       ),
                       subtitle: Text(
                         "${drink["idDrink"]}",
                         style: TextStyle(
                           color: Colors.white,
                         ),
                       ),
                       onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => DrinkDetail(drink: drink),
                           ),
                         );
                       },
                     );
                    },
                )
                : CircularProgressIndicator(backgroundColor: Colors.white),



        ),

    );

  }

  void fetchData() async{
    res = await http.get(Api);
    drinks = jsonDecode(res.body)['drinks'];
    setState(() {

    });
  }
}