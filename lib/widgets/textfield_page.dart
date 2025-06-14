import 'package:flutter/material.dart';

class TextfieldPage extends StatefulWidget {
  @override
  State<TextfieldPage> createState() => _TextfieldPageState();
}

class _TextfieldPageState extends State<TextfieldPage> {
  final TextEditingController _correoController = TextEditingController();

  bool _hasError = false;

  void _validarCorreo() {
    String correo = _correoController.text;
    _hasError = !correo.contains("@");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Field example")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _correoController,
                keyboardType: TextInputType.name, // tipo de teclado
                // obscureText: true, //para ocultar textos como en cntraseñas
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: Colors.red, //color del cursor
                cursorWidth: 4, //ancho del cursor
                cursorHeight: 8, //alto del cursor
                cursorRadius: Radius.circular(20), //radio del cursor
                maxLines: 1, //máximo de lineas en el textfield
                onChanged: (value) => _validarCorreo(),
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  errorText: _hasError ? "Formato inválido" : null,

                  filled: true,
                  fillColor: Colors.grey.shade300,
                  labelText: "Correo",
                  labelStyle: TextStyle(color: Colors.green), //estilo del label
                  hintText: "ejemplo@gmail.com", //texto sugerido
                  hintStyle: TextStyle(color: Colors.grey),
                  helperText: "Ingresa un correo válido",
                  helperStyle: TextStyle(color: Colors.orange),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.purple,
                  ), //icono a inicio
                  suffixIcon:
                      _hasError
                          ? Icon(Icons.cancel)
                          : Icon(Icons.check_circle), //icono al final
                  suffixIconColor: _hasError ? Colors.red : Colors.green,
                  // border: UnderlineInputBorder(), //linea inferior
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.red),
                  ), //dibuja la caja completa
                  // border: InputBorder.none, //sin bordes

                  // borde con el form habilitado
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    // borderSide: BorderSide(color: Colors.blueAccent, width: 4),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  //borde con el form seleccionado
                  focusedBorder: OutlineInputBorder(
                    // borderSide: BorderSide(color: Colors.green, width: 6),
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  _validarCorreo();
                  print(_correoController.text);
                },
                child: Text("Validar "),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
