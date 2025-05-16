import 'dart:convert';
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
      title: 'Flutter login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 179, 255),
        ),
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
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _storage = const FlutterSecureStorage();
  String? _storedToken;

  final _mockUsers = {
    'usuario@email.com': '123456',
    'admin@weg.net': 'admin123',
  };

  Future<void> _simulateLogin() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailCtrl.text.trim();
      final password = _passwordCtrl.text;

      if (_mockUsers[email] == password) {
        const seed = 'SEGURA';
        final raw = '$email:$password:$seed';
        final token = base64.encode(utf8.encode(raw));

        await _storage.write(key: 'token', value: token);
        setState(() => _storedToken = token);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login realizado com sucesso!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email ou senha inválidos')),
        );
      }
    }
  }

  Future<void> _loadToken() async {
    final token = await _storage.read(key: 'token');
    setState(() => _storedToken = token);
  }

  Future<void> _logout() async {
    await _storage.delete(key: 'token');
    setState(() => _storedToken = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('📘 Login com Segurança'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child:
              _storedToken != null
                  ? Column(
                    children: [
                      const Icon(
                        Icons.lock_open,
                        size: 64,
                        color: Color.fromARGB(255, 0, 179, 255),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        'Token armazenado:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),

                      SelectableText(_storedToken!),

                      const SizedBox(height: 20),

                      ElevatedButton.icon(
                        onPressed: _logout,
                        icon: const Icon(Icons.logout),
                        label: const Text('Logout'),
                      ),
                    ],
                  )
                  : Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Email *',
                            border: OutlineInputBorder(), // borda retangular
                            prefixIcon: Icon(Icons.email),
                          ),
                          validator: (String? value) {
                            return (value == null || !value.contains('@'))
                                ? 'O campo deve conter o caractere @.'
                                : null;
                          },
                        ),

                        const SizedBox(height: 24),

                        TextFormField(
                          controller: _passwordCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Senha *',
                            border: OutlineInputBorder(), // borda retangular
                            prefixIcon: Icon(Icons.key),
                          ),
                          validator: (String? value) {
                            return (value == null && value!.isNotEmpty)
                                ? 'Senha inválida'
                                : null;
                          },
                        ),

                        const SizedBox(height: 24),

                        ElevatedButton.icon(
                          onPressed: _simulateLogin,
                          icon: const Icon(Icons.login),
                          label: const Text('Entrar'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
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
