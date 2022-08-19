// ignore_for_file: deprecated_member_use

import 'package:anas201/UI/currency_exchange.dart';
import 'package:anas201/UI/unit_conversion.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  bool isPressed = false;
  bool index0 = true;
  bool index1 = true;
  bool index2 = true;
  bool index3 = true;

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

  final List<String> bottons = ["Unit", "Currency", "test", "test"];
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
        child: Builder(
          builder: (context) => Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 30, right: 30, top: 40),
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xff9ebfe2),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text(
                          'Select Conversion',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      )),
                  const Spacer(flex: 2),
                  btn(0, index0 ? const Color(0xfff2f2f2) : const Color(0xff9ebfe2), index0 ? [] : shadow),
                  const Spacer(),
                  btn(1, index1 ? const Color(0xfff2f2f2) : const Color(0xff9ebfe2), index1 ? [] : shadow),
                  const Spacer(),
                  btn(2, index2 ? const Color(0xfff2f2f2) : const Color(0xff9ebfe2), index2 ? [] : shadow,),
                  const Spacer(),
                  btn(3, index3 ? const Color(0xfff2f2f2) : const Color(0xff9ebfe2), index3 ? [] : shadow,
                  ),
                  const Spacer(flex: 2),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 40),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (index0 == false) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const UnitConversion()));
                          }
                          if (index1 == false) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CurrencyExchange()));
                          }
                          if (index2 == false) {
                            showActionSnackBar(context);
                          }
                          if (index3 == false) {
                            showActionSnackBar(context);
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
                              'Next',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showActionSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    content: const Text(
      'Try another bottom ',
      style: TextStyle(fontSize: 16),
    ),
    action: SnackBarAction(
      label: 'OK',
      // ignore: avoid_print
      onPressed: () => print('Clicked on SnackBar Action!'),
    ),
  );

  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}
