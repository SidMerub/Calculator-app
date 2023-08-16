import 'package:flutter/material.dart';
import 'package:chapter_8/components/my_button.dart';
import 'package:math_expressions/math_expressions.dart';

class HOMESCREEN extends StatefulWidget {
  const HOMESCREEN({Key? key}) : super(key: key);

  @override
  State<HOMESCREEN> createState() => _HOMESCREENState();
}

class _HOMESCREENState extends State<HOMESCREEN> {
  var userinput ='';
  var answer ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator',style: TextStyle(color: Colors.black),),
        backgroundColor: const Color(0xFFE7E7E7),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 50.0),
              child: Column(
                children: [
                  Text(userinput.toString(),style: const TextStyle(color: Colors.black,fontSize: 20),),
                  Text(answer.toString(),style: const TextStyle(color: Colors.black,fontSize: 20),),
                ],
              ),
            ),
          ),

          Expanded(
           flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFE7E7E7)
              ),
              child: Column(
                  children: [
                  const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(title: 'AC',color:const Color(0xFF247EAA),onPress:(){
                      userinput='';
                      answer='';
                      setState(() {

                      });
                  },),
                  const SizedBox(width: 10),
                  MyButton(title: '+/-',color:const Color(0xFF69C7C6), onPress: (){
                    userinput += '+/-';
                    setState(() {

                    });
                  },),
                  const SizedBox(width: 10),
                  MyButton(title: '%',color:const Color(0xFF69C7C6),onPress: (){
                    userinput += '%';
                    setState(() {

                    });
                  },),
                  const SizedBox(width: 10),
                  MyButton(title: '/',color:const Color(0xFF69C7C6),onPress: (){
                    userinput += '/';
                    setState(() {

                    });

                  },),
                ],
              ),
              const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyButton(title: '7',onPress: (){
                          userinput += '7';
                         setState(() {

                         });
                        },),
                        const SizedBox(width: 10),
                        MyButton(title: '8',onPress: (){
                          userinput +='8';
                          setState(() {

                          });

                        },),
                        const SizedBox(width: 10),
                        MyButton(title: '9',onPress: (){
                          userinput += '9';
                          setState(() {

                          });

                        },),
                        const SizedBox(width: 10),
                        MyButton(title: '*',color:const Color(0xFF69C7C6),onPress: (){
                          userinput += '*';
                          setState(() {

                          });

                        },),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyButton(title: '4',onPress: (){
                          userinput += '4';
                          setState(() {

                          });

                        },),
                        const SizedBox(width: 10),
                        MyButton(title: '5',onPress: (){
                          userinput += '5';
                          setState(() {

                          });

                        },),
                        const SizedBox(width: 10),
                        MyButton(title: '6',onPress: (){
                          userinput += '6';
                          setState(() {

                          });

                        },),
                        const SizedBox(width: 10),
                        MyButton(title: '-',color:const Color(0xFF69C7C6),onPress: (){
                          userinput += '-';
                          setState(() {

                          });

                        },),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyButton(title: '3',onPress: (){
                          userinput += '3';
                          setState(() {

                          });

                        },),
                        const SizedBox(width: 10),
                        MyButton(title: '2',onPress: (){
                          userinput+='2';
                          setState(() {

                          });

                        },),
                        const SizedBox(width: 10),
                        MyButton(title: '1',onPress: (){
                          userinput += '1';
                          setState(() {

                          });

                        },),
                        const SizedBox(width: 10),
                        MyButton(title: '+',color:const Color(0xFF69C7C6),onPress: (){
                          userinput += '+';
                          setState(() {

                          });

                        },),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyButton(title: '0',onPress: (){
                          userinput += '0';
                          setState(() {

                          });

                        },),
                        const SizedBox(width: 10),
                        MyButton(title: '.',onPress: (){
                          userinput += '.';
                          setState(() {

                          });

                        },),
                        const SizedBox(width: 10),
                        MyButton(title: 'DEL',color:const Color(0xFF247EAA),onPress: (){
                          userinput=userinput.substring(0,userinput.length -1);
                          setState(() {

                          });

                        },),
                        const SizedBox(width: 10),
                        MyButton(title: '=',color:const Color(0xFF247EAA),onPress: (){
                          equalPress();
                          setState(() {

                          });

                        },),
                      ],
                    ),
          ]),
            ),
          ),
        ],
      ));
  }
  void equalPress(){
    Parser p=Parser();
    String modifiedInput = userinput.replaceAll('%', '*0.01');
    Expression expression= p.parse(modifiedInput);

    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer= eval.toString();

    if (answer.contains('-')) {
      // If the answer contains a negative sign, parse it to a double
      double negativeValue = double.parse(answer);
      answer = negativeValue.toString();
    }
  }
}

