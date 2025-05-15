import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
      ),
      home: const segurancaApp(),
    );
  }
}

class segurancaApp extends StatefulWidget {
  const segurancaApp({super.key});

  @override
  State<segurancaApp> createState() => _segurancaAppState();
}

class _segurancaAppState extends State<segurancaApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('📘 Segurança em Apps Flutter'),),
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email *',
              border: OutlineInputBorder(), // borda retangular
              prefixIcon: Icon(Icons.email)
            ),
            validator: (String? value) {
              return (value == null || !value.contains('@')) ? 'O campo deve conter o caractere @.' : null;
            },
          ),

          const SizedBox(height: 24),

          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Senha *',
              border: OutlineInputBorder(), // borda retangular
              prefixIcon: Icon(Icons.key)
            ),
            validator: (String? value) {
              return (value == null && value!.isNotEmpty) ? 'Senha inválida' : null;
            },
          )
        ],
      ),
      ),
    );
  }
}
