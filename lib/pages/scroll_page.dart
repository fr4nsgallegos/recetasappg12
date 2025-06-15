import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  Widget buildContainer(String number) {
    return Container(
      width: 300,
      height: 200,
      color: Colors.red,
      margin: EdgeInsets.all(16),
      child: Center(
        child: Text(
          number,
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }

  List<int> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int x = numeros.length;
          numeros.add(x + 1);
          setState(() {});
        },
      ),
      appBar: AppBar(title: Text("Scroll Page")),
      body: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Text("CABECERA"),
            ...numeros.map((e) => buildContainer(e.toString())),
          ],
        ),
      ),
    );
  }
}
