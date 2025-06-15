import 'package:flutter/material.dart';

class RecetaCardWidget extends StatelessWidget {
  String title;
  String preparation;
  String urlImage;
  Widget paginaDestino;

  RecetaCardWidget({
    required this.title,
    required this.preparation,
    required this.urlImage,
    required this.paginaDestino,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => paginaDestino),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.45),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(urlImage, height: 200, fit: BoxFit.cover),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Text(
              preparation,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
