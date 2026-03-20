import 'package:flutter/material.dart';

class InformacionInstitucional extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F4),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D6A4F),
        title: Text("Información Institucional"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HISTORIA
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.business),
                        SizedBox(width: 8),
                        Text(
                          "Nuestra Historia",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Full Autos S.A.S. fue creada en 2015 con la intención de brindar los mejores servicios automotrices de la región. "
                          "Cuenta con un equipo de ingenieros mecánicos con más de 15 años de experiencia en el sector.",
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15),

            // RECONOCIMIENTOS
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reconocimientos",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.verified),
                      title: Text("Certificación ISO 9001:2015"),
                      subtitle: Text("Sistema de gestión de calidad certificado"),
                    ),
                    ListTile(
                      leading: Icon(Icons.emoji_events),
                      title: Text("Mejor Serviteca 2025"),
                      subtitle: Text("Reconocimiento del concurso 2025"),
                    ),
                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text("Excelencia en Servicio"),
                      subtitle: Text("Otorgado por asociación de consumidores"),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15),

            // ALIANZAS
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nuestras Alianzas",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.directions_car),
                      title: Text("Toyota Colombia"),
                      subtitle: Text("Centro de servicio autorizado"),
                    ),
                    ListTile(
                      leading: Icon(Icons.directions_car),
                      title: Text("Chevrolet"),
                      subtitle: Text("Taller certificado"),
                    ),
                    ListTile(
                      leading: Icon(Icons.directions_car),
                      title: Text("Renault"),
                      subtitle: Text("Centro autorizado"),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15),

            // CONTACTO
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contacto",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text("Calle 345 #12-34 Cali"),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("+57 321 456 7891"),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text("fullautos@gmail.com"),
                    ),
                    ListTile(
                      leading: Icon(Icons.access_time),
                      title: Text("Lunes a Viernes 8:00 AM - 6:00 PM"),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // BOTÓN VOLVER
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Volver al inicio"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2D6A4F),
                  minimumSize: Size(200, 45),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}