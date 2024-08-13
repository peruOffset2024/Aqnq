import 'package:flutter/material.dart';
import 'package:geo_loc/views/Pruebas/providers/Auth_provider.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(label: Text('Username')),
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(label: Text('Password')),
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () async{
              final username = _usernameController.text;
              final password = _passwordController.text;
              await context.read<AuthProvider>().authenticate(username,password);

            }, child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
