
// weight = mass x surface gravity

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }

}

class HomeState extends State<Home> {

  TextEditingController _weightController = new TextEditingController();

  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      print(radioValue);
      _formattedText = radioValue.toString();

      switch(radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text.toString(), 0.58);
          _formattedText = "Your weight on pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text.toString(), 3.71);
          _formattedText = "Your weight on mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text.toString(), 8.87);
          _formattedText = "Your weight on venus is ${_finalResult.toStringAsFixed(1)}";
          break;
      }

//      Rank	Name	Surface Gravity (meter pr. square second)
//      1	Sun	274
//      2	Jupiter	24.92
//      3	Neptune	11.15
//      4	Saturn	10.44
//      5	Earth	9.798
//      6	Uranus	8.87
//      7	Venus	8.87
//      8	Mars	3.71
//      9	Mercury	3.7
//      10	Moon	1.62
//      11	Pluto	0.58

    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        backgroundColor: Colors.black38,
        title: new Text("Weight PlanetX",
          textDirection: TextDirection.ltr,
          style: new TextStyle(fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),

      body: new Container(
        alignment: Alignment.topCenter,
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Padding(padding: new EdgeInsets.all(10.0)),

              new Image.asset(
                "assets/images/planet.png",
                width: 200,
                height: 133.3,
              ),

              new Padding(padding: const EdgeInsets.all(20.0)),

              new TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                    labelText: "You are on earth now!",
                    hintText: "In kg",
                    icon: new Icon(Icons.person)
                ),
              ),

              const Padding(padding: const EdgeInsets.all(10.0)),

              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                      activeColor: Colors.brown,
                      value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),

                  new Text("Pluto", textDirection: TextDirection.ltr,
                    style: new TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w400, color: Colors.white30),
                  ),

                  new Radio(
                      activeColor: Colors.redAccent,
                      value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),

                  new Text("Mars", textDirection: TextDirection.ltr,
                    style: new TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w400, color: Colors.white30),
                  ),

                  new Radio(
                      activeColor: Colors.orangeAccent,
                      value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),

                  new Text("Venus", textDirection: TextDirection.ltr,
                    style: new TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w400, color: Colors.white30),
                  ),
                ],
              ),

              const Padding(padding: const EdgeInsets.all(10.0)),

              new Text(_formattedText,
                textDirection: TextDirection.ltr,
                style: new TextStyle(fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white70),)
            ],
          ),
        ),
      ),

    );
  }

  double calculateWeight(String weight, double surfaceGravity) {
    if(weight.toString().isNotEmpty && double.parse(weight) > 0.0) {
      _finalResult = 2 * double.parse(weight) * surfaceGravity;
      return _finalResult;
    } else {
      print("Wrong");
      return double.parse(weight) * 0.38;
    }
  }

}