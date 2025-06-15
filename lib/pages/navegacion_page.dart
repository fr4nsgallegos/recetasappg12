import 'package:flutter/material.dart';
import 'package:recetasappg12/pages/home_page.dart';

class NavegacionPage extends StatelessWidget {
  const NavegacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(Colors.red)),
                );
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(result)));
                print(result);
              },
              child: Text("Ir a pantalla de recetas"),
            ),
          ],
        ),
      ),
    );
  }
}
