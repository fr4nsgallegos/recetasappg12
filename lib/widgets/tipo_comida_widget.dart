import 'package:flutter/material.dart';

class TipoComidaWidget extends StatelessWidget {
  List<String> options;
  Color colorFondo;
  Function(String?) funcionOnChanged;

  TipoComidaWidget({
    required this.options,
    required this.colorFondo,
    required this.funcionOnChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField(
        items:
            options
                .map(
                  (option) =>
                      DropdownMenuItem(child: Text(option), value: option),
                )
                .toList(),
        //DECORACIÓN
        decoration: InputDecoration(
          labelText: "Selecciona el tipo de plato",
          labelStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.black.withOpacity(0.35),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        dropdownColor: colorFondo,
        style: TextStyle(color: Colors.white),
        icon: Icon(Icons.arrow_drop_down_circle),
        menuMaxHeight:
            200, //define la altura del desplegable y lo vuelve en scrolleadble si fuese necesario
        onChanged: funcionOnChanged,
      ),
    );
  }
}
