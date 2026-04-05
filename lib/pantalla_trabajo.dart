import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PantallaTrabajo extends StatefulWidget {
  @override
  _PantallaTrabajoState createState() => _PantallaTrabajoState();
}

class _PantallaTrabajoState extends State<PantallaTrabajo> {

  String archivo = "Ningún archivo seleccionado";

  // 🔥 CONTROLLERS
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController cargoController = TextEditingController();
  final TextEditingController experienciaController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();

  InputDecoration estiloInput(String texto) {
    return InputDecoration(
      hintText: texto,
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Future<void> guardarSolicitud() async {
    if (archivo == "Ningún archivo seleccionado") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Debes adjuntar tu hoja de vida")),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();

    Map<String, String> solicitud = {
      "nombre": nombreController.text,
      "correo": correoController.text,
      "cargo": cargoController.text,
      "experiencia": experienciaController.text,
      "telefono": telefonoController.text,
      "archivo": archivo
    };

    List<String> solicitudes =
        prefs.getStringList("solicitudes") ?? [];

    solicitudes.add(jsonEncode(solicitud));

    await prefs.setStringList("solicitudes", solicitudes);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Solicitud enviada")),
    );

    // limpiar
    nombreController.clear();
    correoController.clear();
    cargoController.clear();
    experienciaController.clear();
    telefonoController.clear();

    setState(() {
      archivo = "Ningún archivo seleccionado";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F9),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(
                  child: Text(
                    "Trabaja con nosotros",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(height: 20),

                Text("Nombre completo:"),
                TextField(controller: nombreController, decoration: estiloInput("Nombre")),

                SizedBox(height: 15),

                Text("Correo:"),
                TextField(controller: correoController, decoration: estiloInput("Correo")),

                SizedBox(height: 15),

                Text("Cargo:"),
                TextField(controller: cargoController, decoration: estiloInput("Cargo")),

                SizedBox(height: 15),

                Text("Experiencia:"),
                TextField(
                  controller: experienciaController,
                  maxLines: 3,
                  decoration: estiloInput("Experiencia"),
                ),

                SizedBox(height: 15),

                Text("Teléfono:"),
                TextField(controller: telefonoController, decoration: estiloInput("Teléfono")),

                SizedBox(height: 20),

                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf'],
                    );

                    if (result != null) {
                      setState(() {
                        archivo = result.files.single.name;
                      });
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Adjuntar PDF")),
                  ),
                ),

                SizedBox(height: 10),
                Text(archivo),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: guardarSolicitud,
                  child: Text("Enviar solicitud"),
                ),

                SizedBox(height: 10),

                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text("Volver"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}