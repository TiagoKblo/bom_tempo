import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../utils/componentes.dart';
import '../models/clima.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txtCidade = TextEditingController();
  GlobalKey<FormState> cForm = GlobalKey<FormState>();

  String temperatura = "0";
  String descricao = "";
  String cidade = "Pesquise uma cidade";
  String data = "";
  String umidade = "";
  String velVento = "";
  String nascerSol = "";
  String porSol = "";
  String tempMin = "";
  String tempMax = "";
  String hora = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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


      backgroundColor: Colors.blueGrey[900],
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(

            /*gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0XFF00BFFF), Color(0XFF1565C0)],
            ),*/

          ),
          child: Column(
            children: [
              Form(
                key: cForm,
                child: Container(
                  alignment: Alignment.topCenter,
                  height: 60,
                  width: 350,
                  padding: EdgeInsets.only(top: 15),
                  child: Componentes.barraPesquisa(
                    "Buscar Cidade",
                    txtCidade,
                    buscaCidade,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Componentes.resultado(cidade),
              ),
              Container(
                padding: EdgeInsets.only(top: 75, left: 26),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Componentes.temperatura(temperatura),
                    Text(
                      "°C",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 100),
                child: Componentes.resultado(descricao),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  //color: Colors.white38,
                  color: Colors.blueGrey[700],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 35, left: 30),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/img/tempMin.png",
                                    height: 18,
                                    width: 18,
                                  ),
                                  Componentes.rotulo(" Temp. mínima"),
                                ],
                              ),
                              Componentes.resultado(tempMin),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 35, left: 15),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/img/tempMax.png",
                                    height: 18,
                                    width: 18,
                                  ),
                                  Componentes.rotulo(" Temp. máxima"),
                                ],
                              ),
                              Componentes.resultado(tempMax),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 45, left: 30),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/img/humidity.png",
                                    height: 18,
                                    width: 18,
                                  ),
                                  Componentes.rotulo(" umidade"),
                                ],
                              ),
                              Componentes.resultado(umidade),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 45, left: 15),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/img/wind.png",
                                    height: 18,
                                    width: 18,
                                  ),
                                  Componentes.rotulo(" Vel. do vento"),
                                ],
                              ),
                              Componentes.resultado(velVento),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 45, left: 30),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/img/sunrise.png",
                                    height: 18,
                                    width: 18,
                                  ),
                                  Componentes.rotulo(" Nascer do Sol"),
                                ],
                              ),
                              Componentes.resultado(nascerSol),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 45, left: 15),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/img/sunset.png",
                                    height: 18,
                                    width: 18,
                                  ),
                                  Componentes.rotulo(" Pôr do Sol"),
                                ],
                              ),
                              Componentes.resultado(porSol),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        hora,
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buscaCidade() async {
    String url =
        "https://api.hgbrasil.com/weather?format=json-cors&key=8b919156&city_name=${txtCidade.text}";
    try {
      Response resposta = await get(Uri.parse(url));
      if (resposta.statusCode == 200) {
        Map clima = json.decode(resposta.body);
        Weather weather = Weather.fromJson(clima);
        setState(() {
          temperatura = weather.temperatura;
          descricao = weather.descricao;
          cidade = weather.cidade;
          data = weather.data;
          umidade = weather.umidade;
          velVento = weather.velVento;
          nascerSol = weather.nascerSol;
          porSol = weather.porSol;
          tempMin = weather.tempMin;
          tempMax = weather.tempMax;
          hora = weather.hora;
        });
      } else {
        print(
            "Erro ao buscar dados de clima. Código de status: ${resposta.statusCode}");
      }
    } catch (e) {
      print("Erro ao buscar dados de clima: $e");
    }
  }
}