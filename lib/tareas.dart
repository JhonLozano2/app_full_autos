import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'crear_tarea.dart';

class Tareas extends StatefulWidget {
  @override
  _TareasState createState() => _TareasState();
}

class _TareasState extends State<Tareas> {

  List<Map<String, dynamic>> listaTareas = [];

  @override
  void initState() {
    super.initState();
    cargarTareas();
  }

  // 🟢 GUARDAR SOLO DATOS (SIN ESTADO)
  Future<void> guardarTareas() async {
    final prefs = await SharedPreferences.getInstance();

    // eliminamos estado antes de guardar
    List tareasSinEstado = listaTareas.map((t) {
      return {
        "cliente": t["cliente"],
        "vehiculo": t["vehiculo"],
        "servicio": t["servicio"],
      };
    }).toList();

    await prefs.setString('tareas', jsonEncode(tareasSinEstado));
  }

  // 🟢 CARGAR Y REINICIAR ESTADO
  Future<void> cargarTareas() async {
    final prefs = await SharedPreferences.getInstance();
    String? tareasGuardadas = prefs.getString('tareas');

    if (tareasGuardadas != null) {
      List decoded = jsonDecode(tareasGuardadas);

      setState(() {
        listaTareas = decoded.map<Map<String, dynamic>>((t) {
          return {
            "cliente": t["cliente"],
            "vehiculo": t["vehiculo"],
            "servicio": t["servicio"],
            "completado": false, // SIEMPRE inicia pendiente
          };
        }).toList();
      });
    } else {
      // datos iniciales
      listaTareas = [
        {
          "cliente": "Juan Pérez",
          "vehiculo": "Toyota Corolla 2020",
          "servicio": "Cambio de aceite y filtros",
          "completado": false
        },
      ];
    }
  }

  // 🟢 CAMBIAR ESTADO (NO SE GUARDA)
  void marcarComoCompletado(int index) {
    setState(() {
      listaTareas[index]["completado"] =
      !listaTareas[index]["completado"];
    });
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
                  nuevaTarea["completado"] = false;
                  listaTareas.add(nuevaTarea);
                });

                guardarTareas(); // SOLO guarda datos
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

                  Text(
                    listaTareas[index]["cliente"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text("Vehículo: ${listaTareas[index]["vehiculo"]}"),
                  Text("Servicio: ${listaTareas[index]["servicio"]}"),

                  SizedBox(height: 12),

                  Text(
                    "Estado: ${estaCompletado ? "Completado" : "Pendiente"}",
                    style: TextStyle(
                      color: estaCompletado ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => marcarComoCompletado(index),
                      icon: Icon(Icons.check),
                      label: Text(
                        estaCompletado
                            ? "Marcar como pendiente"
                            : "Marcar como completado",
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: estaCompletado
                            ? Colors.orange
                            : Color(0xFF40916C),
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