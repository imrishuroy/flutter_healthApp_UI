import 'package:flutter/material.dart';

class MyMoods extends StatefulWidget {
  @override
  _MyMoodsState createState() => _MyMoodsState();
}

class _MyMoodsState extends State<MyMoods> {
  List<bool> isSelected = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
        selectedBorderColor: Colors.purple,
        renderBorder: false,
        fillColor: Colors.transparent,
        children: [
          Icon(Icons.sentiment_very_dissatisfied, size: 36.0),
          Padding(
            padding: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(Icons.sentiment_dissatisfied, size: 36.0),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(Icons.sentiment_neutral, size: 36.0),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(Icons.sentiment_satisfied, size: 36.0),
          ),
          Icon(Icons.sentiment_very_satisfied, size: 36.0),
        ],
        isSelected: isSelected,
        onPressed: (int index) {
          print(index);
          setState(() {
            isSelected[index] = !isSelected[index];
          });
          // toggle button
        },
      ),
    );
  }
}
