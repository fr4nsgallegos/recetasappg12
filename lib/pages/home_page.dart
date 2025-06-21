import 'package:flutter/material.dart';
import 'package:recetasappg12/models/receta_model.dart';
import 'package:recetasappg12/pages/detalle_receta_page.dart';
import 'package:recetasappg12/pages/navegacion_page.dart';
import 'package:recetasappg12/widgets/form_item_widget.dart';
import 'package:recetasappg12/widgets/receta_card_widget.dart';
import 'package:recetasappg12/widgets/tipo_comida_widget.dart';

class HomePage extends StatefulWidget {
  Color colorDeFondo;

  HomePage(this.colorDeFondo);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _preparationController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  String? selectedTipoPlato;

  List<String> tipoComidaOpions = ["Entrada", "Plato de fondo", "Postre"];

  RecetaModel receta1 = RecetaModel(
    title: "Wafles",
    preparation:
        """ Primero agregamos la leche, huevos, azúcar, sal y esencia de vainilla en nuestra licuadora y mezclamos bien durante 2 minutos.
                        Luego con un colador tamizamos la harina y el polvo de hornear. Luego los incluimos en la mezcla anterior y mezclamos hasta formar una pasta lisa y uniforme.
                        Calentamos la waflera a la temperatura deseada y rociamos aceite en spray. Luego, colocamos la mezcla dentro y dejamos cocinar.
                        Una vez listo, retirar el waffle, disponer sobre un plato y decorar con crema chantilly, frutillas, arándanos, hojas de menta y un generoso chorro de miel.
                        ¡A disfrutar!""",
    urlImage:
        "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    tipoPlato: "Postre",
  );
  List<RecetaModel> recetasList = [];
  @override
  void initState() {
    recetasList = [receta1];
    recetasList.add(receta1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Container(
                padding: EdgeInsets.all(32),
                width: double.infinity,
                child: FlutterLogo(),
              ),
            ),
            ListTile(
              title: Text("Scroll Page"),
              leading: Icon(Icons.insert_page_break_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavegacionPage()),
                );
              },
            ),
          ],
        ),
      ), //menú a la izquierda
      // endDrawer: Drawer(), //menú a la derecha
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, "Hola como estas");
        },
      ),
      backgroundColor: widget.colorDeFondo,
      appBar: AppBar(
        title: Text("App de recetas"),
        backgroundColor: widget.colorDeFondo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
          child: Column(
            children: [
              FormItemWidget(
                controller: _titleController,
                hint: "Ingresa el título",
                iconData: Icons.title,
                maxLines: 1,
              ),
              FormItemWidget(
                controller: _preparationController,
                hint: "Ingresa la preparación ",
                iconData: Icons.list,
                maxLines: 3,
              ),
              FormItemWidget(
                controller: _imageController,
                hint: "Ingresa la url de la imagen",
                iconData: Icons.image,
                maxLines: 1,
              ),

              TipoComidaWidget(
                options: tipoComidaOpions,
                colorFondo: widget.colorDeFondo,
                funcionOnChanged: (value) {
                  // print(value);
                  selectedTipoPlato = value;
                },
              ),

              ElevatedButton(
                onPressed: () {
                  RecetaModel recetaAux = RecetaModel(
                    title: _titleController.text,
                    preparation: _preparationController.text,
                    urlImage: _imageController.text,
                    tipoPlato: selectedTipoPlato!,
                  );

                  recetasList.add(recetaAux);
                  _titleController.clear();
                  _preparationController.clear();
                  _imageController.clear();
                  setState(() {});
                },
                child: Text("Registrar receta"),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...recetasList.map(
                        (e) => RecetaCardWidget(
                          title: e.title,
                          preparation: e.preparation,
                          urlImage: e.urlImage,
                          paginaDestino: DetalleRecetaPage(e),
                        ),
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
