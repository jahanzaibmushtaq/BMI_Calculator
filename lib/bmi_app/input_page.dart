import 'package:boss_level_chellenge/bmi_app/icon_widget_custom.dart';
import 'package:boss_level_chellenge/bmi_app/reuseable_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


const containerColor = Color(0xFF1D1E33);
const tappedContainerColor = Color(0xFF111328);
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleContainerColor = containerColor;
  Color femaleContainerColor = containerColor;

  void updateColor(int gender){
    if(gender == 1){
      if(maleContainerColor == containerColor){
        maleContainerColor = tappedContainerColor;
        femaleContainerColor = containerColor;
      }else{
        maleContainerColor = containerColor;
      }
    } else {
      if(femaleContainerColor == containerColor){
        femaleContainerColor = tappedContainerColor;
        maleContainerColor = containerColor;
      }else{
        femaleContainerColor = containerColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          children: [
             Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReuseAbleContainer(color: maleContainerColor,
                    child: const IconWidget(
                      title: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(0);
                      });
                    },
                    child: ReuseAbleContainer(color: femaleContainerColor,
                      child: const IconWidget(
                        title: "FEMALE",
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(12.0),
                height: 180.0,
                width: 350,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
             const Expanded(
              child: Row(
                children: [
                  ReuseAbleContainer(color: containerColor,),
                  ReuseAbleContainer(color: containerColor,),
                ],
              ),
            ),
           Container(
             color: const Color(0xFFEB1555),
             margin: const EdgeInsets.only(top: 10.0),
             width: double.infinity,
             height: 70.0,
           ),
          ],
        ),
    );
  }
}
