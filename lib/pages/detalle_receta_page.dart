import 'package:flutter/material.dart';
import 'package:recetasappg12/models/receta_model.dart';

class DetalleRecetaPage extends StatelessWidget {
  RecetaModel recetaModel;
  DetalleRecetaPage(this.recetaModel);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff003049),
        body: Column(
          children: [
            Image.network(
              recetaModel.urlImage,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              recetaModel.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.35),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                recetaModel.preparation,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
