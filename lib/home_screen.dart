import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = true; // Estado del tema
  String userName = ""; // Estado del nombre de usuario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF1E1E2C) : Colors.white,
      appBar: AppBar(
        title: Text(
          "Mi App UI Marx",
          style: GoogleFonts.poppins(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              setState(() {
                isDarkMode = !isDarkMode; // Cambiar tema
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bienvenido 👋",
                style: GoogleFonts.montserrat(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ).animate().fadeIn(duration: 500.ms),
              SizedBox(height: 20),

              // Botón para abrir el modal con efecto de pulsación
              Center(
                child:
                    ElevatedButton(
                      onPressed: () {
                        _showModal(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadowColor: Colors.purple.withOpacity(0.5),
                        elevation: 8,
                      ),
                      child: Text(
                        "Empezar",
                        style: GoogleFonts.poppins(fontSize: 18),
                      ),
                    ).animate().scale(delay: 300.ms).shake(),
              ),
              SizedBox(height: 30),

              // Sección informativa sobre mí
              Text(
                "Sobre mí",
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Ingeniero de Software con experiencia en desarrollo web y aplicaciones móviles. Apasionado por la tecnología y siempre en busca de nuevos retos.",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),

              SizedBox(height: 30),

              Text(
                "Habilidades Técnicas",
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "- Desarrollo en Flutter, Dart, JavaScript, y PHP\n- Frameworks: Laravel, React, Angular\n- Bases de datos: MySQL y MongoDB",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showModal(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            "¡Hola! 🚀",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Introduce tu nombre para personalizar la experiencia:",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              TextField(
                controller: nameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Tu nombre...",
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.deepPurple[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cerrar",
                style: GoogleFonts.poppins(color: Colors.purpleAccent),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName = nameController.text;
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "¡Bienvenido, $userName! 🎉",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    backgroundColor: Colors.purpleAccent,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
              ),
              child: Text(
                "Guardar",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
