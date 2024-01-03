import 'package:boss_level_chellenge/bmi_app/icon_widget_custom.dart';
import 'package:boss_level_chellenge/bmi_app/results_page.dart';
import 'package:boss_level_chellenge/const/const.dart';
import 'package:boss_level_chellenge/custom_widgets/reuseable_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:boss_level_chellenge/controller/bmi_culculate.dart';

const containerColor = Color(0xFF1D1E33);
const tappedContainerColor = Color(0xFF111328);

enum Gender { female, male }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //function is replaced with this single line of code -> selectedGender == Gender.female.toString() ? tappedContainerColor : containerColor,
  /*Color maleContainerColor = containerColor;
  Color femaleContainerColor = containerColor;

  void updateColor(int gender) {
    if (gender == 1) {
      if (maleContainerColor == containerColor) {
        maleContainerColor = tappedContainerColor;
        femaleContainerColor = containerColor;
      } else {
        maleContainerColor = containerColor;
      }
    } else {
      if (femaleContainerColor == containerColor) {
        femaleContainerColor = tappedContainerColor;
        maleContainerColor = containerColor;
      } else {
        femaleContainerColor = containerColor;
      }
    }
  }*/
  String? selectedGender;
  int weight = 60;
  int age = 20;
  int height = 180;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male.toString();
                    });
                  },
                  child: ReuseAbleContainer(
                    color: selectedGender == Gender.male.toString()
                        ? tappedContainerColor
                        : containerColor,
                    child: const IconWidget(
                      title: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female.toString();
                    });
                  },
                  child: ReuseAbleContainer(
                    color: selectedGender == Gender.female.toString()
                        ? tappedContainerColor
                        : containerColor,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: labelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: const Color(0xFFEB1555),
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0xFFEB1555),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReuseAbleContainer(
                  color: containerColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "WEIGHT",
                        style: labelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: numberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            onPress: () {
                              setState(() {
                                weight--;
                                print(weight);
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundedIconButton(
                            onPress: () {
                              setState(() {
                                weight++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ReuseAbleContainer(
                  color: containerColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "AGE",
                        style: labelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: numberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundedIconButton(
                            onPress: () {
                              setState(() {
                                age++;
                                print(age);
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              BMICalculate bmiCalculate = BMICalculate(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ResultsPage(
                  bmiResult: bmiCalculate.calculateBMI(),
                  resultText: bmiCalculate.getResult(),
                  interpretation: bmiCalculate.getInterpretation(),
                )),
              );
            },
            child: Container(
              color: const Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 70.0,
              child: const Center(child: Text("CALCULATE", style: largeLabelTextStyle,)),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({super.key, this.icon, required this.onPress});
  final IconData? icon;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
