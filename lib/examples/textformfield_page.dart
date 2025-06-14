import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class TextformfieldPage extends StatefulWidget {
  @override
  State<TextformfieldPage> createState() => _TextformfieldPageState();
}

class _TextformfieldPageState extends State<TextformfieldPage> {
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void mostrarSnackbarArriba(BuildContext context) {
    Flushbar(
      // flushbarPosition: FlushbarPosition.BOTTOM,//APAREZCA ABAJO
      flushbarPosition: FlushbarPosition.TOP, //APAREZCA ARRIBA
      title: "Error",
      message: "Revisa el formulario",
      duration: Duration(seconds: 3),
      backgroundColor: Colors.redAccent,
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(24),
      icon: Icon(Icons.error),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Textform field page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          // TEXTFORMFIELD version mejorada del textfield, se integra con un widget llamado Form, permite la validación y mejor manejo de estados, sepuede usar la propiedad validator para el manejor de errores o validación de datos.
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _correoController,
                  decoration: InputDecoration(
                    hintText: "Ingresa tu correo",
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor Ingresa tu correo";
                    } else if (value.length < 6) {
                      return "debe tener al menor 7 cracteres";
                    } else if (!RegExp(
                      '[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}',
                    ).hasMatch(value)) {
                      return "Ingrese un correo válido";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _contrasenaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Ingresa tu conttraseña",
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor Ingresa tu Contraseña";
                    } else if (value.length < 7) {
                      return "Debe tener al menos 8 caracteres";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    // validando form
                    if (_formKey.currentState!.validate()) {
                      print(_formKey.currentState!.validate());

                      //  SNACKBAR EN LA PARTE DE ABAJO
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Formulario validado"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      mostrarSnackbarArriba(context);
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text("Revisa las alertas"),
                      //     backgroundColor: Colors.red,
                      //   ),
                      // );
                    }
                  },
                  child: Text("Enviar form"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
