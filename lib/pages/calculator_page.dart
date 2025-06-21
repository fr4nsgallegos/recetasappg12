import 'package:flutter/material.dart';
import 'package:recetasappg12/widgets/calculator_widgets/build_button_widget.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff222222),
        body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.bottomRight,
                width: double.infinity,
                height: screenHeigth / 3,
                decoration: BoxDecoration(
                  color: Color(0xff2F3832),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Text(
                  "9999",
                  style: TextStyle(color: Colors.white, fontSize: 65),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          BuildButtonWidget(
                            texto: "7",
                            bgColor: Color(0xff272B27),
                            function: () {},
                          ),
                          BuildButtonWidget(
                            texto: "8",
                            bgColor: Color(0xff272B27),
                            function: () {},
                          ),
                          BuildButtonWidget(
                            texto: "9",
                            bgColor: Color(0xff272B27),
                            function: () {},
                          ),
                          BuildButtonWidget(
                            texto: "/",
                            bgColor: Color(0xff404B43),
                            function: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          BuildButtonWidget(
                            texto: "4",
                            bgColor: Color(0xff272B27),
                            function: () {},
                          ),
                          BuildButtonWidget(
                            texto: "5",
                            bgColor: Color(0xff272B27),
                            function: () {},
                          ),
                          BuildButtonWidget(
                            texto: "6",
                            bgColor: Color(0xff272B27),
                            function: () {},
                          ),
                          BuildButtonWidget(
                            texto: "x",
                            bgColor: Color(0xff404B43),
                            function: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          BuildButtonWidget(
                            texto: "1",
                            bgColor: Color(0xff272B27),
                            function: () {},
                          ),
                          BuildButtonWidget(
                            texto: "2",
                            bgColor: Color(0xff272B27),
                            function: () {},
                          ),
                          BuildButtonWidget(
                            texto: "3",
                            bgColor: Color(0xff272B27),
                            function: () {},
                          ),
                          BuildButtonWidget(
                            texto: "-",
                            bgColor: Color(0xff404B43),
                            function: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          BuildButtonWidget(
                            texto: "0",
                            bgColor: Color(0xff272B27),
                            function: () {},
                          ),
                          BuildButtonWidget(
                            texto: ".",
                            bgColor: Color(0xff272B27),
                            function: () {},
                          ),
                          BuildButtonWidget(
                            texto: "<-",
                            bgColor: Color(0xff404B43),
                            function: () {},
                          ),
                          BuildButtonWidget(
                            texto: "+",
                            bgColor: Color(0xff404B43),
                            function: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          BuildButtonWidget(
                            texto: "AC",
                            bgColor: Color(0xff334C57),
                            function: () {},
                          ),
                          BuildButtonWidget(
                            texto: "=",
                            bgColor: Color(0xff2A5139),
                            function: () {},
                          ),
                        ],
                      ),
                    ],
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
