import 'package:flutter/material.dart';
import 'package:recetasappg12/widgets/calculator_widgets/build_button_widget.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String input = ""; //lo que voy ingresando
  String output = ""; //resultado
  String operator = "";
  double num1 = 0.0, num2 = 0.0;
  void buttonNumberPressed(String number) {
    //validamos que el ingreso sea punto
    if (number == ".") {
      if (input.contains("."))
        return; //si ya hay un punto en el input ya no ingresa otro
    }

    if (input != "0") {
      input +=
          number; //validamos que input sea diferente de 0, si es asi hace el join con el nuevo número
    } else {
      //cuando el input es 0
      if (number == ".") {
        input += number; // valida si despues se va ingresar un . (0.)
      } else {
        input = number; //caso contrario, reemplaza el 0 con el nuevo número
      }
    }
    setState(() {});
  }

  void acButton() {
    input = output = "0";
    operator = "";
    num1 = num2 = 0.0;
  }

  void deleteDigito() {
    output.length != 0 ? input = input.substring(0, input.length - 1) : "0";
  }

  void igualFunction() {
    switch (operator) {
      case "+":
        output = (num1 + num2).toString();
      case "-":
        output = (num1 - num2).toString();
      case "x":
        output = (num1 * num2).toString();
      case "/":
        output = (num1 / num2).toString();
      default:
        break;
    }
  }

  void buttonPressed(String textButton) {
    if (textButton == "AC") {
      acButton();
    } else if (textButton == "<-") {
      deleteDigito();
    } else if (textButton == "x" ||
        textButton == "-" ||
        textButton == "+" ||
        textButton == "/") {
      if (operator == "" && !input.isEmpty) {
        operator = textButton;
        num1 = double.parse(input);
        input = "0";
      }
    } else if (textButton == "=") {
      num2 = double.parse(input);
      igualFunction();
      num1 = num2 = 0.0;
      operator = "";
      input = output; //ver el resultado en pantalla
    } else {
      buttonNumberPressed(textButton);
    }

    output = input;
    setState(() {});
  }

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
                  output,
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
                            function: () => buttonPressed("7"),
                          ),
                          BuildButtonWidget(
                            texto: "8",
                            bgColor: Color(0xff272B27),
                            function: () => buttonPressed("8"),
                          ),
                          BuildButtonWidget(
                            texto: "9",
                            bgColor: Color(0xff272B27),
                            function: () => buttonPressed("9"),
                          ),
                          BuildButtonWidget(
                            texto: "/",
                            bgColor: Color(0xff404B43),
                            function: () => buttonPressed("/"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          BuildButtonWidget(
                            texto: "4",
                            bgColor: Color(0xff272B27),
                            function: () => buttonPressed("4"),
                          ),
                          BuildButtonWidget(
                            texto: "5",
                            bgColor: Color(0xff272B27),
                            function: () => buttonPressed("5"),
                          ),
                          BuildButtonWidget(
                            texto: "6",
                            bgColor: Color(0xff272B27),
                            function: () => buttonPressed("6"),
                          ),
                          BuildButtonWidget(
                            texto: "x",
                            bgColor: Color(0xff404B43),
                            function: () => buttonPressed("x"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          BuildButtonWidget(
                            texto: "1",
                            bgColor: Color(0xff272B27),
                            function: () => buttonPressed("1"),
                          ),
                          BuildButtonWidget(
                            texto: "2",
                            bgColor: Color(0xff272B27),
                            function: () => buttonPressed("2"),
                          ),
                          BuildButtonWidget(
                            texto: "3",
                            bgColor: Color(0xff272B27),
                            function: () => buttonPressed("3"),
                          ),
                          BuildButtonWidget(
                            texto: "-",
                            bgColor: Color(0xff404B43),
                            function: () => buttonPressed("-"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          BuildButtonWidget(
                            texto: "0",
                            bgColor: Color(0xff272B27),
                            function: () => buttonPressed("0"),
                          ),
                          BuildButtonWidget(
                            texto: ".",
                            bgColor: Color(0xff272B27),
                            function: () => buttonPressed("."),
                          ),
                          BuildButtonWidget(
                            texto: "<-",
                            bgColor: Color(0xff404B43),
                            function: () => buttonPressed("<-"),
                          ),
                          BuildButtonWidget(
                            texto: "+",
                            bgColor: Color(0xff404B43),
                            function: () => buttonPressed("+"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          BuildButtonWidget(
                            texto: "AC",
                            bgColor: Color(0xff334C57),
                            function: () => buttonPressed("AC"),
                          ),
                          BuildButtonWidget(
                            texto: "=",
                            bgColor: Color(0xff2A5139),
                            function: () => buttonPressed("="),
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
