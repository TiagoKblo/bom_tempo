/*
import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Previsão do Tempo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Previsão do Tempo'),
          backgroundColor: Colors.blueGrey[700], // Cor de fundo da AppBar


          actions: <Widget>[
            Row(
              children: [
                // Espaçamento entre o título e a imagem
                SizedBox(width: 8),
                // Imagem à direita da AppBar
                Image.asset(
                  'assets/img/Bom_Tempo_icone.png', // Caminho da imagem
                  width: 60, // Largura da imagem
                  height: 60, // Altura da imagem
                  fit: BoxFit.contain, // Ajuste da imagem dentro do espaço disponível
                ),
                // Outros ícones ou elementos aqui, se necessário
              ],
            ),
          ],
        ),
        body: HomePage(),
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Importe o arquivo da HomePage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Previsão do Tempo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: SplashScreen(), // Inicia com a tela de abertura
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Temporizador para aguardar 10 segundos antes de navegar para HomePage
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900], // Cor de fundo da tela de abertura
      body: Center(
        child: Image.asset(
          'assets/img/Bom_Tempo_icone.png', // Caminho da imagem da tela de abertura
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
