import 'package:mimpedir/usuario.dart';
import 'package:mimpedir/tipo.dart';

class Restaurante {
  int? _codigo;
  String? _nomeRestaurante;
  double? _latitude;
  double? _longitude;
  Usuario? _proprietario;
  Tipo? _tipoCulinaria;

  Restaurante({String? nomeRestaurante, int? codigo, double? latitude, double? longitude, Usuario? proprietario, Tipo? tipoCulinaria}){
    _codigo = codigo;
    _nomeRestaurante = nomeRestaurante;
    _latitude = latitude;
    _longitude = longitude;
    _proprietario = proprietario;
    _tipoCulinaria = tipoCulinaria;
  }

   //getters
  String? get nomeRestaurante => _nomeRestaurante;
  int? get codigo => _codigo;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  Usuario? get proprietario => _proprietario;
  Tipo? get tipoCulinaria => _tipoCulinaria;

  set nomeRestaurante(String? nomeRestaurante) => _nomeRestaurante = nomeRestaurante;
  set codigo(int? codigo) => _codigo = codigo;
  set latitude(double? latitude) => _latitude = latitude;
  set longitude(double? longitude) => _longitude = longitude;
  set proprietario(Usuario? proprietario) => _proprietario = proprietario;
  set tipoCulinaria(Tipo? tipoCulinaria) => _tipoCulinaria = tipoCulinaria;

}