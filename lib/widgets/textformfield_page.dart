import 'package:flutter/material.dart';

class TextformfieldPage extends StatefulWidget {
  @override
  State<TextformfieldPage> createState() => _TextformfieldPageState();
}

class _TextformfieldPageState extends State<TextformfieldPage> {
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Formulario validado"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Revisa las alertas"),
                          backgroundColor: Colors.red,
                        ),
                      );
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
