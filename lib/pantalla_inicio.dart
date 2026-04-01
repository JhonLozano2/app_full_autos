import 'package:flutter/material.dart';
import 'pantalla_servicios.dart';
import 'pantalla_trabajo.dart';
import 'agendar_cita.dart';
import 'tecnicos.dart';
import 'tareas.dart';
import 'informacion_institucional.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  static const Color primaryGreen = Color(0xFF1B4332);
  static const Color accentGreen = Color(0xFF40916C);
  static const Color backgroundColor = Color(0xFFEFF3F1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _HeaderImage(),
            const SizedBox(height: 20),
            const _TitleSection(),
            const SizedBox(height: 20),
            const _DescriptionCard(),
            const SizedBox(height: 30),

            // BOTONES PRINCIPALES
            _BotonPrincipal(
              texto: 'Ver servicios',
              icono: Icons.build,
              color: accentGreen,
              onTap: () => _navegar(context, PantallaServicios()),
            ),
            const SizedBox(height: 15),
            _BotonPrincipal(
              texto: 'Trabaja con nosotros',
              icono: Icons.work,
              color: primaryGreen,
              onTap: () => _navegar(context, PantallaTrabajo()),
            ),

            const SizedBox(height: 30),
            const _SeccionTitulo(titulo: "Accesos rápidos"),
            const SizedBox(height: 15),

            // ACCESOS RÁPIDOS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                alignment: WrapAlignment.center,
                children: [
                  _BotonPequeno(
                    texto: "Agendar",
                    icono: Icons.calendar_today,
                    onTap: () => _navegar(context, AgendarCita()),
                  ),
                  _BotonPequeno(
                    texto: "Técnicos",
                    icono: Icons.engineering,
                    onTap: () => _navegar(context, TecnicosColaboradores()),
                  ),
                  _BotonPequeno(
                    texto: "Tareas",
                    icono: Icons.check_circle,
                    onTap: () => _navegar(context, Tareas()),
                  ),
                  _BotonPequeno(
                    texto: "Información",
                    icono: Icons.info,
                    onTap: () => _navegar(context, InformacionInstitucional()),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _navegar(BuildContext context, Widget pantalla) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pantalla),
    );
  }
}

// ---------------- SUB-WIDGETS ----------------

class _HeaderImage extends StatelessWidget {
  const _HeaderImage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 220,
      child: Image.asset(
        'assets/images/Autos.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Full Autos S.A.S',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: PantallaInicio.primaryGreen,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Expertos en soluciones automotrices',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}

class _DescriptionCard extends StatelessWidget {
  const _DescriptionCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
      ),
      child: const Text(
        'Somos una serviteca especializada en mantenimiento y diagnóstico automotriz, comprometida con la calidad y la satisfacción de nuestros clientes.',
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _SeccionTitulo extends StatelessWidget {
  final String titulo;

  const _SeccionTitulo({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: PantallaInicio.primaryGreen,
      ),
    );
  }
}

class _BotonPrincipal extends StatelessWidget {
  final String texto;
  final IconData icono;
  final Color color;
  final VoidCallback onTap;

  const _BotonPrincipal({
    required this.texto,
    required this.icono,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton.icon(
        icon: Icon(icono, color: Colors.white),
        label: Text(
          texto,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}

class _BotonPequeno extends StatelessWidget {
  final String texto;
  final IconData icono;
  final VoidCallback onTap;

  const _BotonPequeno({
    required this.texto,
    required this.icono,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 150,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 5),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icono, color: const Color(0xFF2D6A4F), size: 28),
            const SizedBox(height: 5),
            Text(
              texto,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
