import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PruebasN extends StatelessWidget {
  const PruebasN({super.key});

  @override
  Widget build(BuildContext context) {
  
    return  ChangeNotifierProvider(
      create: (_) => EmailProvider(),
      child: const Scaffold(
        body: Padding(padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          _emailTextFiel(),
          SizedBox(height: 20,),
          _SendButton(),
          _emailText()
        ],),
        ),
      ),
    );
  }
}

class _emailText extends StatelessWidget {
  const _emailText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final email = context.watch<EmailProvider>().email;
    return Text('El email introducido es: $email');
  }
}

class EmailProvider extends ChangeNotifier{
  String _email = '';

  String get email => _email;

  set email(String value){
    _email = value;
    notifyListeners();
  }
}

class _emailTextFiel extends StatelessWidget {
  const _emailTextFiel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => context.read<EmailProvider>().email = value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: 'Email'
      ),
    );
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {  }, child: const Text('Enviar'),);
  }
}

