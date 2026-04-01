import 'package:flutter/material.dart';

class CrearTarea extends StatefulWidget {
  @override
  _CrearTareaState createState() => _CrearTareaState();
}

class _CrearTareaState extends State<CrearTarea> {

  // 🔥 Lista de servicios
  List<String> servicios = [
    "Cambio de aceite",
    "Diagnóstico electrónico",
    "Alineación y balanceo"
  ];

  String? servicioSeleccionado;

  TextEditingController clienteController = TextEditingController();
  TextEditingController vehiculoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F4),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D6A4F),
        title: Text("Nueva tarea"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            // CLIENTE
            TextField(
              controller: clienteController,
              decoration: InputDecoration(
                labelText: "Cliente",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            // VEHÍCULO
            TextField(
              controller: vehiculoController,
              decoration: InputDecoration(
                labelText: "Vehículo",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            // 🔥 DROPDOWN SERVICIO
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Selecciona un servicio",
                border: OutlineInputBorder(),
              ),
              value: servicioSeleccionado,
              items: servicios.map((servicio) {
                return DropdownMenuItem(
                  value: servicio,
                  child: Text(servicio),
                );
              }).toList(),
              onChanged: (valor) {
                setState(() {
                  servicioSeleccionado = valor;
                });
              },
            ),

            SizedBox(height: 25),

            // BOTÓN GUARDAR
            ElevatedButton(
              onPressed: () {

                if (clienteController.text.isEmpty ||
                    vehiculoController.text.isEmpty ||
                    servicioSeleccionado == null) {
                  return;
                }

                Map<String, dynamic> nuevaTarea = {
                  "cliente": clienteController.text,
                  "vehiculo": vehiculoController.text,
                  "servicio": servicioSeleccionado,
                  "completado": false
                };

                Navigator.pop(context, nuevaTarea);
              },
              child: Text("Guardar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2D6A4F),
                minimumSize: Size(double.infinity, 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}