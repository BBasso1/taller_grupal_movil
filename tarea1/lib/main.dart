import 'package:flutter/material.dart';

void main() {
  runApp(LetterCounterApp());
}

class LetterCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Letras',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LetterCounterScreen(),
    );
  }
}

class LetterCounterScreen extends StatefulWidget {
  @override
  _LetterCounterScreenState createState() => _LetterCounterScreenState();
}

class _LetterCounterScreenState extends State<LetterCounterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _texto_procesado = '';

  // Función para procesar el texto ingresado
  void _countLetters() {
    // Convertir a minúsculas y eliminar caracteres que no sean letras
    String inputText = _controller.text.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');

    Map<String, int> letterCount = {};

    // Contar ocurrencias de cada letra
    for (var char in inputText.split('')) {
      letterCount[char] = (letterCount[char] ?? 0) + 1;
    }
 
    // Crear el texto formateado, e.g., "w4a2b1z1x1"
    String resultado = '';
    letterCount.forEach((key, value) {
      resultado += '$key$value';
    });

    // Actualizar el estado con el resultado procesado
    setState(() {
      _texto_procesado = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Letras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Ingrese texto aquí',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _countLetters,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2DD69C),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Contar Letras'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Texto Procesado:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _texto_procesado,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}