import 'package:flutter/material.dart';

class PantallaTrabajo extends StatefulWidget {
  @override
  _PantallaTrabajoState createState() => _PantallaTrabajoState();
}

class _PantallaTrabajoState extends State<PantallaTrabajo> {

  String archivo = "Ningún archivo seleccionado";

  //
  InputDecoration estiloInput(String texto) {
    return InputDecoration(
      hintText: texto,
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
    );
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

                // TÍTULO
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Trabaja con nosotros",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Únete a nuestro equipo y crece profesionalmente con Full Autos S.A.S",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                //  NOMBRE
                Text("Nombre completo:"),
                SizedBox(height: 5),
                TextField(decoration: estiloInput("Ingresa tu nombre completo")),

                SizedBox(height: 15),

                // CORREO
                Text("Correo electrónico:"),
                SizedBox(height: 5),
                TextField(decoration: estiloInput("tucorreo@ejemplo.com")),

                SizedBox(height: 15),

                //  CARGO
                Text("Cargo al que aspira:"),
                SizedBox(height: 5),
                TextField(decoration: estiloInput("Ej: Mecánico, Técnico, Administrativo")),

                SizedBox(height: 15),

                // EXPERIENCIA
                Text("Experiencia laboral:"),
                SizedBox(height: 5),
                TextField(
                  maxLines: 3,
                  decoration: estiloInput("Describe tu experiencia profesional, logros y habilidades relevantes"),
                ),

                SizedBox(height: 15),

                //  TELÉFONO
                Text("Número de contacto:"),
                SizedBox(height: 5),
                TextField(decoration: estiloInput("+57 321 123 4567")),

                SizedBox(height: 20),

                //  BOTÓN ADJUNTAR PDF
                GestureDetector(
                  onTap: () {
                    setState(() {
                      archivo = "hoja_de_vida.pdf";
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF3B82F6)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.attach_file, color: Color(0xFF3B82F6)),
                        SizedBox(width: 10),
                        Text(
                          "Adjuntar hoja de vida (PDF)",
                          style: TextStyle(color: Color(0xFF3B82F6)),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 8),

                // NOMBRE ARCHIVO
                Text(
                  archivo,
                  style: TextStyle(color: Colors.grey),
                ),

                SizedBox(height: 20),

                // BOTÓN ENVIAR
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFF2563EB),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.send, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Enviar solicitud",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                // VOLVER
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Volver al inicio",
                      style: TextStyle(color: Colors.blue),
                    ),
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