import 'package:flutter/material.dart';

class AgendarCita extends StatefulWidget {
  @override
  _AgendarCitaState createState() => _AgendarCitaState();
}

class _AgendarCitaState extends State<AgendarCita> {

  String? servicioSeleccionado;
  String? tecnicoSeleccionado;
  DateTime? fechaSeleccionada;
  TimeOfDay? horaSeleccionada;

  List<String> servicios = [
    "Cambio de aceite",
    "Diagnóstico electrónico",
    "Alineación y balanceo"
  ];

  List<String> tecnicos = [
    "Jhon Lozano",
    "Carlos Mora",
    "Juan Martínez",
    "Ronald Pereira"
  ];

  Future<void> seleccionarFecha() async {
    DateTime? fecha = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (fecha != null) {
      setState(() {
        fechaSeleccionada = fecha;
      });
    }
  }

  Future<void> seleccionarHora() async {
    TimeOfDay? hora = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (hora != null) {
      setState(() {
        horaSeleccionada = hora;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F4),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D6A4F),
        title: Text("Agendar Cita"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            // Dropdown Servicio
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

            SizedBox(height: 15),

            // Dropdown Técnico
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Selecciona un técnico",
                border: OutlineInputBorder(),
              ),
              value: tecnicoSeleccionado,
              items: tecnicos.map((tecnico) {
                return DropdownMenuItem(
                  value: tecnico,
                  child: Text(tecnico),
                );
              }).toList(),
              onChanged: (valor) {
                setState(() {
                  tecnicoSeleccionado = valor;
                });
              },
            ),

            SizedBox(height: 15),

            // Fecha
            ElevatedButton(
              onPressed: seleccionarFecha,
              child: Text(
                fechaSeleccionada == null
                    ? "Seleccionar fecha"
                    : "Fecha: ${fechaSeleccionada!.day}/${fechaSeleccionada!.month}/${fechaSeleccionada!.year}",
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF40916C),
                minimumSize: Size(double.infinity, 50),
              ),
            ),

            SizedBox(height: 15),

            // Hora
            ElevatedButton(
              onPressed: seleccionarHora,
              child: Text(
                horaSeleccionada == null
                    ? "Seleccionar hora"
                    : "Hora: ${horaSeleccionada!.format(context)}",
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF40916C),
                minimumSize: Size(double.infinity, 50),
              ),
            ),

            SizedBox(height: 25),

            // Botón Confirmar
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Cita confirmada correctamente")),
                );
              },
              child: Text("Confirmar Cita"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2D6A4F),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}