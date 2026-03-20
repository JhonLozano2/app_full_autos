import 'package:flutter/material.dart';

class PantallaServicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F5F4),

      body: Column(
        children: [

          //  ENCABEZADO VERDE
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 25),
            color: Color(0xFF2D6A4F),
            child: Text(
              'Nuestros Servicios',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 15),

          //  LISTA DE SERVICIOS
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              children: [

                servicioCard(
                  Icons.build,
                  'Mantenimiento preventivo integral',
                  'Optimización completa del vehículo para mejorar su rendimiento y prolongar su vida útil.',
                ),

                servicioCard(
                  Icons.oil_barrel,
                  'Cambio de aceite y filtros',
                  'Uso de aceites de alta calidad y filtros certificados para garantizar el buen funcionamiento del motor.',
                ),

                servicioCard(
                  Icons.computer,
                  'Diagnóstico electrónico avanzado',
                  'Análisis computarizado del sistema del vehículo para detectar fallas con precisión.',
                ),

                servicioCard(
                  Icons.car_repair,
                  'Revisión y ajuste de frenos',
                  'Inspección completa del sistema de frenos para garantizar seguridad en la conducción.',
                ),

                servicioCard(
                  Icons.settings,
                  'Alineación y balanceo digital',
                  'Corrección de la dirección y estabilidad del vehículo con equipos de última tecnología.',
                ),

                SizedBox(height: 25),

                //  BOTÓN VOLVER
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2D6A4F),
                      minimumSize: Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Volver al inicio',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // TARJETA PERSONALIZADA
  Widget servicioCard(IconData icono, String titulo, String descripcion) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          )
        ],
      ),
      child: Row(
        children: [

          //  CÍRCULO CON ICONO
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF2D6A4F),
              shape: BoxShape.circle,
            ),
            child: Icon(icono, color: Colors.white),
          ),

          SizedBox(width: 15),

          // TEXTO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  descripcion,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}