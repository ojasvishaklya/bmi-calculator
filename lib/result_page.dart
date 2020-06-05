import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget  {

  ResultsPage({this.bmiResult});
  final String bmiResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        
        title: Text('BMI CALCULATOR'),
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
          ),
            ),
          ),
          Expanded(
            flex: 5,
            child: reusableCard(
              colour: defaultColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'Normal',
                  style: TextStyle(

                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(

                        fontSize: 80,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){

              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              height: 75,
              color: Colors.pink,
              margin: EdgeInsets.only(top: 10),
            ),
          )

        ],
      ),
    );
  }
}
