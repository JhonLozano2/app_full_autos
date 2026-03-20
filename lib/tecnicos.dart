import 'package:flutter/material.dart';

class TecnicosColaboradores extends StatelessWidget {

  final List<Map<String, String>> tecnicos = [
    {
      "nombre": "Jhon Lozano",
      "especialidad": "Transmisión y embrague",
      "experiencia": "8 años"
    },
    {
      "nombre": "Carlos Mora",
      "especialidad": "Diagnóstico electrónico",
      "experiencia": "5 años"
    },
    {
      "nombre": "Juan Martínez",
      "especialidad": "Reparación de motores",
      "experiencia": "7 años"
    },
    {
      "nombre": "Ronald Pereira",
      "especialidad": "Alineación y suspensión",
      "experiencia": "7 años"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F4),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D6A4F),
        title: Text("Técnicos Colaboradores"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: tecnicos.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.only(bottom: 15),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tecnicos[index]["nombre"]!,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text("Especialidad: ${tecnicos[index]["especialidad"]}"),
                  Text("Experiencia: ${tecnicos[index]["experiencia"]}"),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Seleccionaste a ${tecnicos[index]["nombre"]}"),
                        ),
                      );
                    },
                    child: Text("Seleccionar técnico"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF40916C),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}