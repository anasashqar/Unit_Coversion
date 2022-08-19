import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnitConversion extends StatefulWidget {
  const UnitConversion({Key? key}) : super(key: key);

  @override
  State<UnitConversion> createState() => _UnitConversionState();
}

class _UnitConversionState extends State<UnitConversion> {

  final _Controller = TextEditingController();
  String _textController = '';
  double _multiplicationValue = 1 ;
  String _typeUnit = '';
  String _answer = '';

  bool isPressed = false;
  bool index0 = true;
  bool index1 = true;
  bool index2 = true;
  bool index3 = true;
  bool index4 = true;

  final shadow = [
    const BoxShadow(
      color: Color(0xffffffff),
      offset: Offset(16.7, -16.7),
      blurRadius: 39,
      spreadRadius: 0.0,
    ),
    const BoxShadow(
      color: Color(0xffd2d1d1),
      offset: Offset(-16.7, 16.7),
      blurRadius: 20,
      spreadRadius: 2.0,
    ),
  ];

  final List<String> bottons = ["Dcm", "Cm", "Km", "M", "Mm"];

  Widget btn(int index, Color backgroundcolor, List<BoxShadow> boxShadow) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: InkWell(
        onTap: () {
          setState(() {
            if (index == 0) {
              index0 = false;
            } else {
              index0 = true;
            }
            if (index == 1) {
              index1 = false;
            } else {
              index1 = true;
            }
            if (index == 2) {
              index2 = false;
            } else {
              index2 = true;
            }
            if (index == 3) {
              index3 = false;
            } else {
              index3 = true;
            }if (index == 4) {
              index4 = false;
            } else {
              index4 = true;
            }
          });
        },
        child: Container(
            height: 53,
            decoration: BoxDecoration(
                boxShadow: boxShadow,
                color: backgroundcolor,
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                bottons[index],
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            )),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      const Text("")
                    ],
                  ),
                  Container(
                      margin:
                          const EdgeInsets.only(left: 30, right: 30, top: 10),
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xff9ebfe2),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text(
                          'Unit Conversion',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:   [
                  const Text('Meters',style: TextStyle(fontSize: 27,color: Colors.black),),
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 25,),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: _Controller,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xfff2f2f2),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: "input num : ",
                            hintStyle: const TextStyle(
                                color: Color(0xff818181),
                                fontSize: 13
                            ),
                        ),),
                      ),
                    ],
                  ),

                ],
              ),
              const Spacer(flex: 1),
              Text("$_answer $_typeUnit" ,style: const TextStyle(fontSize: 35,fontWeight: FontWeight.w800),),
              const Spacer(flex: 2),
              btn(0, index0 ? const Color(0xfff2f2f2) : const Color(0xff9ebfe2), index0 ? [] : shadow),
              const Spacer(),
              btn(1, index1 ? const Color(0xfff2f2f2) : const Color(0xff9ebfe2), index1 ? [] : shadow),
              const Spacer(),
              btn(2, index2 ? const Color(0xfff2f2f2) : const Color(0xff9ebfe2), index2 ? [] : shadow,),
              const Spacer(),
              btn(3, index3 ? const Color(0xfff2f2f2) : const Color(0xff9ebfe2), index3 ? [] : shadow,),
              const Spacer(),
              btn(4, index4 ? const Color(0xfff2f2f2) : const Color(0xff9ebfe2), index4 ? [] : shadow,),
              const Spacer(flex: 2),
              Container(
                margin:
                const EdgeInsets.only(left: 30, right: 30, bottom: 15),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _textController = _Controller.text ;
                      var _value = int.parse(_textController);
                      double _afterConversion = _value * _multiplicationValue ;
                      _answer = ('$_afterConversion') ;

                      if (index0 == false) { // Dcm
                        _multiplicationValue = 10  ;
                        _typeUnit = "Dcm" ;
                      }
                      if (index1 == false) { // Cm
                        _multiplicationValue = 100  ;
                        _typeUnit = "Cm" ;
                      }
                      if (index2 == false) { // Km
                        _multiplicationValue = .001  ;
                        _typeUnit = "Km" ;
                      }
                      if (index3 == false) { // M
                        _multiplicationValue = 1  ;
                        _typeUnit = "M" ;
                      }
                      if (index4 == false) { // Mm
                        _multiplicationValue = 1000  ;
                        _typeUnit = "Mm" ;
                      }


                    });
                  },
                  child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xff0e3ca6),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text(
                          'Convert',
                          style:
                          TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
