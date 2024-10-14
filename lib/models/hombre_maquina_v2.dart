import 'package:flutter/material.dart';
import 'package:dio/dio.dart'; // Usaremos Dio para la petición HTTP

class Pantalla extends StatefulWidget {
  const Pantalla({super.key});

  @override
  _PantallaState createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {
  final TextEditingController textController = TextEditingController();
  String imagenUrl = "https://pamipe.com/wp-content/uploads/2022/09/Chihuahua.png"; // URL por defecto
  String? errorMessage;

  // Instancia de Dio
  final Dio _dio = Dio();

  // Función para obtener la URL de la bandera de "Spain" desde la API
  Future<void> _fetchCountryFlag() async {
    final apiUrl = 'https://restcountries.com/v3.1/name/spain';

    try {
      // Realizamos la solicitud GET con Dio
      final response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        // Convertimos la respuesta a JSON y obtenemos la URL de la bandera
        final List<dynamic> data = response.data;
        final String flagUrl = data[0]['flags']['png'];

        // Actualizamos el estado con la nueva URL de la imagen
        setState(() {
          imagenUrl = flagUrl;
          errorMessage = null;
        });
      } else {
        // En caso de error con la solicitud
        setState(() {
          imagenUrl = "https://pamipe.com/wp-content/uploads/2022/09/Chihuahua.png"; // Imagen de error o default
          errorMessage = 'Error al obtener la bandera.';
        });
      }
    } catch (e) {
      // Manejo de errores en la solicitud
      setState(() {
        imagenUrl = "https://pamipe.com/wp-content/uploads/2022/09/Chihuahua.png";
        errorMessage = 'Error al realizar la solicitud.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ESPAÑA"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de texto
            TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Introduce el nombre del país',
              ),
            ),
            const SizedBox(height: 20),

            // Botón para buscar la bandera
            ElevatedButton(
              onPressed: () {
                if (textController.text.toLowerCase() == "spain") {
                  _fetchCountryFlag(); // Realizamos la petición a la API
                }
              },
              child: const Text("Dime la bandera"),
            ),

            const SizedBox(height: 20),

            // Mostrar imagen
            Image.network(
              imagenUrl,
              height: 200,
              width: 300,
            ),

            // Mostrar mensaje de error si existe
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}