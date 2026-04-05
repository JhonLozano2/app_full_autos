import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TecnicosColaboradores extends StatefulWidget {
  @override
  _TecnicosColaboradoresState createState() => _TecnicosColaboradoresState();
}

class _TecnicosColaboradoresState extends State<TecnicosColaboradores>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  List<Map<String, String>> solicitudes = [];
  List<dynamic> aceptados = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    cargarDatos();
  }

  Future<void> cargarDatos() async {
    final prefs = await SharedPreferences.getInstance();

    List<String> data = prefs.getStringList("solicitudes") ?? [];
    solicitudes = data
        .map((e) => Map<String, String>.from(jsonDecode(e)))
        .toList();

    final aceptadosString = prefs.getString('aceptados');
    if (aceptadosString != null) {
      aceptados = jsonDecode(aceptadosString);
    }

    setState(() {});
  }

  Future<void> eliminarSolicitud(int index) async {
    final prefs = await SharedPreferences.getInstance();

    solicitudes.removeAt(index);

    await prefs.setStringList(
      "solicitudes",
      solicitudes.map((e) => jsonEncode(e)).toList(),
    );

    setState(() {});
  }

  Future<void> aceptarSolicitud(int index) async {
    final prefs = await SharedPreferences.getInstance();

    aceptados.add(solicitudes[index]);
    solicitudes.removeAt(index);

    await prefs.setStringList(
      "solicitudes",
      solicitudes.map((e) => jsonEncode(e)).toList(),
    );

    await prefs.setString("aceptados", jsonEncode(aceptados));

    setState(() {});
  }

  Widget vistaSolicitudes() {
    if (solicitudes.isEmpty) {
      return Center(child: Text("No hay solicitudes"));
    }

    return ListView.builder(
      itemCount: solicitudes.length,
      itemBuilder: (context, index) {
        final s = solicitudes[index];

        return ListTile(
          title: Text(s["nombre"] ?? ""),
          subtitle: Text(s["archivo"] ?? ""),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.check, color: Colors.green),
                onPressed: () => aceptarSolicitud(index),
              ),
              IconButton(
                icon: Icon(Icons.close, color: Colors.red),
                onPressed: () => eliminarSolicitud(index),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget vistaTecnicos() {
    if (aceptados.isEmpty) {
      return Center(child: Text("No hay técnicos"));
    }

    return ListView.builder(
      itemCount: aceptados.length,
      itemBuilder: (context, index) {
        final t = aceptados[index];

        return ListTile(
          title: Text(t["nombre"] ?? ""),
          subtitle: Text("Aceptado"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Técnicos"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Solicitudes"),
            Tab(text: "Técnicos"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          vistaSolicitudes(),
          vistaTecnicos(),
        ],
      ),
    );
  }
}