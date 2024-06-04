import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String email = '';
  String senha = '';
  bool aceitoTermos = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Página de Cadastro'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Insira seus dados',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.only(),
                  ),
                ),
                onChanged: (text) {
                  email = text;
                  if (text.contains('@')) {
                    print('E-mail valido');
                  } else {
                    print('E-mail inválido');
                  }
                },
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(borderRadius: BorderRadius.only()),
                ),
                onChanged: (value) {
                  senha = value;
                },
              ),
              Row(
                children: [
                  Checkbox(
                    value: aceitoTermos,
                    onChanged: (checked) {
                      print(checked);
                      setState(() {
                        aceitoTermos = !aceitoTermos;
                      });
                    },
                  ),
                  Text('Concordo com os termos de uso do app.'),
                ],
              ),
              Text('Esqueceu sua senha?'),
              ElevatedButton(
                onPressed: () {
                  print('Entrar');
                  print('E-mail: $email');
                  print('Senha: $senha');

                  if (!aceitoTermos) {
                    print('Não aceitou os termos');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
