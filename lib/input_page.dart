import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_page.dart';
import 'brain.dart';


const labelText= TextStyle(
  fontSize: 18,
  color: Color(0xff8d8e98),
);

const numberText= TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);

const defaultColor=Color(0xFF1E1E33);
enum Gender {
  male,female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}



class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height =150;
  int weight=20;
  int age=0;
  int ans=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusableCard(
                    onPress : (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                    colour:selectedGender==Gender.male ? Colors.green :defaultColor,
                    cardChild: FaceCard(name : 'Male',icon: FontAwesomeIcons.mars),
                  ),
                ),Expanded(
                  child: reusableCard(
                    onPress : (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    colour:selectedGender==Gender.female ? Colors.redAccent :defaultColor,
                    cardChild: FaceCard(name : 'Female',icon: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child:reusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text('Height',
                    style: labelText),
                  Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                     height.toString() ,
                      style:numberText,
                    ),
                    Text('cm',
                    style: labelText)
                  ],
                  ),
                  Slider(
                      value:height.roundToDouble(),
                      min: 100,
                    max : 220,
                     activeColor: defaultColor,
                     inactiveColor: Color(0xff8d8e98),
                     onChanged:(double newValue){
                        setState(() {
                          height=newValue.toInt();
                        });
                     } ,)
                ],

              ),
              colour:Colors.blue,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: labelText,
                        ),
                        Text(
                          weight.toString(),
                          style: numberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon : FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  weight--;
                                });
                              } ,
                            ),
                            RoundIconButton(
                              icon : FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  weight++;
                                });
                              } ,),
                          ],
                        ),
                      ],
                    ),
                    colour:defaultColor,
                  ),
                ),Expanded(
                  child: reusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: labelText,
                        ),
                        Text(
                          age.toString(),
                          style: numberText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon : FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  age--;
                                });
                              } ,
                            ),
                            RoundIconButton(
                              icon : FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  age++;
                                });
                              } ,),
                          ],
                        ),
                      ],
                    ),
                    colour:defaultColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Brain calc=Brain(height: height,weight :weight);

              Navigator.push(context,
                  MaterialPageRoute(
               builder: (context) =>ResultsPage(bmiResult: calc.calculateBMI(),)
                  ),
              );
            },
            child: Container(
              width: double.infinity,
              child: Center(
                child: Text(
                    'CALCULATE',
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

class FaceCard extends StatelessWidget {

  FaceCard( {this.name,this.icon});

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
         icon,
          size : 80,
        ),
        SizedBox(
          height:15,
        ),

        Text(name,style:labelText),
      ],
    );
  }
}

class reusableCard extends StatelessWidget {

  reusableCard({@required this.colour,this.cardChild,this.onPress});

 final Color colour;
 final Widget cardChild;
 final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child:cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon,this.onPress});

  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        child: Icon(icon),
        constraints: BoxConstraints.tightFor(
          width:45,
        height : 45,
      ),
        onPressed:onPress,
        elevation: 6.0,
        shape: CircleBorder(),
        fillColor: Color(0xff4c4f5e),

      ),
    );
  }
}
