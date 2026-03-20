import 'package:flutter/material.dart';
import 'pantalla_servicios.dart';
import 'pantalla_trabajo.dart';
import 'agendar_cita.dart';
import 'tecnicos.dart';
import 'tareas.dart';
import 'informacion_institucional.dart';

class PantallaInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF3F1),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // IMAGEN SUPERIOR
            Container(
              width: double.infinity,
              height: 220,
              child: Image.asset(
                'assets/images/Autos.png',
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Full Autos S.A.S',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B4332),
              ),
            ),

            SizedBox(height: 5),

            Text(
              'Expertos en soluciones automotrices',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),

            SizedBox(height: 20),

            // TARJETA DESCRIPCIÓN
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Text(
                  'Somos una serviteca especializada en mantenimiento y diagnóstico automotriz, comprometida con la calidad y la satisfacción de nuestros clientes.',
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            SizedBox(height: 30),

            // BOTÓN PRINCIPAL - SERVICIOS
            botonPrincipal(
              context,
              'Ver servicios',
              Icons.build,
              PantallaServicios(),
              Color(0xFF40916C),
            ),

            SizedBox(height: 15),

            // BOTÓN PRINCIPAL - TRABAJO
            botonPrincipal(
              context,
              'Trabaja con nosotros',
              Icons.work,
              PantallaTrabajo(),
              Color(0xFF1B4332),
            ),

            SizedBox(height: 30),

            // SECCIÓN ACCESOS RÁPIDOS
            Text(
              "Accesos rápidos",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B4332),
              ),
            ),

            SizedBox(height: 15),

            // FILA 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                botonPequeno(context, "Agendar", Icons.calendar_today, AgendarCita()),
                botonPequeno(context, "Técnicos", Icons.engineering, TecnicosColaboradores()),
              ],
            ),

            SizedBox(height: 15),

            // FILA 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                botonPequeno(context, "Tareas", Icons.check_circle, Tareas()),
                botonPequeno(context, "Información", Icons.info, InformacionInstitucional()),
              ],
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // BOTÓN GRANDE
  Widget botonPrincipal(BuildContext context, String texto, IconData icono, Widget pantalla, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton.icon(
        icon: Icon(icono),
        label: Text(texto, style: TextStyle(fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pantalla),
          );
        },
      ),
    );
  }

  // BOTÓN PEQUEÑO CUADRADO
  Widget botonPequeno(BuildContext context, String texto, IconData icono, Widget pantalla) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pantalla),
        );
      },
      child: Container(
        width: 150,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icono, color: Color(0xFF2D6A4F), size: 28),
            SizedBox(height: 5),
            Text(texto),
          ],
        ),
      ),
    );
  }
}