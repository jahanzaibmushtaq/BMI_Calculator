import 'package:boss_level_chellenge/custom_widgets/reuseable_container.dart';
import 'package:boss_level_chellenge/screens/input_page.dart';
import 'package:flutter/material.dart';

import '../const/const.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultsPage({super.key, required this.bmiResult, required this.interpretation, required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI CALCULATOR"),centerTitle: true,automaticallyImplyLeading: false,),
    body:  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text("Your Result", style: extraLargeLabelTextStyle,))),
         Expanded(
            flex: 5,
            child: ReuseAbleContainer(color: containerColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                   Text(resultText.toUpperCase(), style: resultTextStyle,),
                Text(bmiResult, style: resultNumberTextStyle,),
                const Text("Normal BMI Range: \n 18.5 - 25 Kg/m2", style: bmiDefine,),
                Text(interpretation, style: resultDescTextStyle,textAlign: TextAlign.center,),
              ],
            ),
            )),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InputPage()),
            );
          },
          child: Container(
            color: const Color(0xFFEB1555),
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 70.0,
            child: const Center(child: Text("RE-CALCULATE", style: largeLabelTextStyle,)),
          ),
        ),
      ],
    ),
    );

  }
}
