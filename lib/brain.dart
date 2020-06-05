

class Brain{

  Brain({this.height,this.weight});

  final int height;
  final int weight;
  double _bmi;
  String calculateBMI()
  {
    _bmi=(weight/(height*height))*10000;
    return _bmi.toStringAsFixed(1);
  }

}