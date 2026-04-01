import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'crear_tarea.dart';

class Tareas extends StatefulWidget {
  @override
  _TareasState createState() => _TareasState();
}

class _TareasState extends State<Tareas> {

  List<Map<String, dynamic>> listaTareas = [
    {
      "cliente": "Juan Pérez",
      "vehiculo": "Toyota Corolla 2020",
      "servicio": "Cambio de acei te y filtros",
      "completado": false
    },
    {
      "cliente": "María García",
      "vehiculo": "Chevrolet Spark 2019",
      "servicio": "Revisión de frenos",
      "completado": false
    },
    {
      "cliente": "Pedro Martínez",
      "vehiculo": "Mazda 3 2021",
      "servicio": "Diagnóstico electronico",
      "completado": false
    },
    {
      "cliente": "Ana López",
      "vehiculo": "Renault Logan 2018",
      "servicio": "Alineación y balanceo",
      "completado": false
    },
  ];

  Future<void > guardarTareas() async {
    final prefs = await SharedPreferences.getInstance();
    String tareasJson = jsonEncode(listaTareas);
    await prefs.setString('tareas', tareasJson);
  }

   Future<void> cargarTareas() async {
    final prefs = await SharedPreferences.getInstance();
    String? tareasGuardadas = prefs.getString('tareas');

    if (tareasGuardadas != null) {
      setState(() {
        listaTareas = List<Map<String, dynamic>>.from(
          jsonDecode(tareasGuardadas),
        );
      });
    }
  }

  void initState() {
    super.initState();
    cargarTareas();
  }

  void marcarComoCompletado(int index) {
    setState(() {
      listaTareas[index]["completado"] = true;
    });
    guardarTareas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F4),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D6A4F),
        title: Text("Tareas"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final nuevaTarea = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CrearTarea(),
                ),
              );

              if (nuevaTarea != null) {
                setState(() {
                  listaTareas.add(nuevaTarea);
                });

                guardarTareas(); // 🔥 guarda en memoria
              }
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: listaTareas.length,
        itemBuilder: (context, index) {

          bool estaCompletado = listaTareas[index]["completado"];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.only(bottom: 15),
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // CLIENTE
                  Text(
                    listaTareas[index]["cliente"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6),

                  // VEHÍCULO
                  Text(
                    "Vehículo: ${listaTareas[index]["vehiculo"]}",
                  ),

                  SizedBox(height: 4),

                  // SERVICIO
                  Text(
                    "Servicio: ${listaTareas[index]["servicio"]}",
                  ),

                  SizedBox(height: 12),

                  // ESTADO
                  Text(
                    "Estado: ${estaCompletado ? "Completado" : "Pendiente"}",
                    style: TextStyle(
                      color:
                      estaCompletado ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  // BOTÓN SEPARADO
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: estaCompletado
                          ? null
                          : () => marcarComoCompletado(index),
                      icon: Icon(Icons.check),
                      label: Text(
                        estaCompletado
                            ? "Completado"
                            : "Marcar como completado",
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: estaCompletado
                            ? Colors.green
                            : Color(0xFF40916C),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}