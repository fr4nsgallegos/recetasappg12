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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      appBar: AppBar(title: Text("Scroll Page")),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return buildContainer(index.toString());
                },
              ),
            ),

            buildContainer("1"),
            buildContainer("1"),
            ...List.generate(
              5,
              (index) => Padding(
                padding: EdgeInsets.all(16),
                child: ListTile(title: Text("HIJO")),
              ),
            ),
            buildContainer("1"),
            buildContainer("1"),
            buildContainer("1"),
            buildContainer("1"),
            buildContainer("1"),

            SizedBox(
              height: 210,
              child: ListView.separated(
                itemBuilder:
                    (context, index) => buildContainer("separeted $index"),
                separatorBuilder:
                    (context, index) =>
                        Container(height: 20, color: Colors.cyan),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),

      // ListView.builder(
      //   itemCount: numeros.length,
      //   itemBuilder: (context, index) {
      //     print(index);
      //     return buildContainer(numeros[index].toString());
      //   },
      // ),

      // SingleChildScrollView(
      //   // scrollDirection: Axis.horizontal,
      //   child: Column(
      //     children: [
      //       Text("CABECERA"),
      //       ...numeros.map((e) => buildContainer(e.toString())),
      //     ],
      //   ),
      // ),
    );
  }
}
