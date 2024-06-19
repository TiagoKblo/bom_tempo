// lib/models/clima.dart
class Weather {
  final String temperatura;
  final String descricao;
  final String cidade;
  final String data;
  final String umidade;
  final String velVento;
  final String nascerSol;
  final String porSol;
  final String tempMin;
  final String tempMax;
  final String hora;

  Weather({
    required this.temperatura,
    required this.descricao,
    required this.cidade,
    required this.data,
    required this.umidade,
    required this.velVento,
    required this.nascerSol,
    required this.porSol,
    required this.tempMin,
    required this.tempMax,
    required this.hora,
  });

  factory Weather.fromJson(Map<dynamic, dynamic> json) {
    return Weather(
      temperatura: json['results']['temp'].toString(),
      descricao: json['results']['description'].toString(),
      cidade: json['results']['city_name'].toString(),
      data: json['results']['date'].toString(),
      umidade: json['results']['humidity'].toString() + '%',
      velVento: json['results']['wind_speedy'].toString(),
      nascerSol: json['results']['sunrise'].toString(),
      porSol: json['results']['sunset'].toString(),
      tempMin: json['results']['forecast'][0]['min'].toString() + '°C',
      tempMax: json['results']['forecast'][0]['max'].toString() + '°C',
      hora: 'Atualizado às ' + json['results']['time'].toString(),
    );
  }
}