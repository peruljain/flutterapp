import 'package:flutter/material.dart';

class DrinkDetail extends StatelessWidget{

  final drink;

  const DrinkDetail({Key key, @required this.drink}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text(drink['strDrink']),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: drink["idDrink"],
              child: CircleAvatar(
                radius: 100,

                backgroundImage: NetworkImage(
                  drink["strDrinkThumb"] ??
                      "http://www.4motiondarlington.org/wp-content/uploads/2013/06/No-image-found.jpg",
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "${drink["strDrink"]}",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),

          ],
        ),
      ),


    );
  }

}