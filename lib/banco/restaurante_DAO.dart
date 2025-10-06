import 'package:mimpedir/banco/database_helper.dart';

import '../restaurante.dart';

class RestauranteDAO{
  static Future<List<Restaurante>> listarTodos() async{
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante');

    return resultado.map((mapa){
       return Restaurante(
          codigo: mapa['cd_restaurante'] as int,
          nomeRestaurante: mapa['nm_restaurante'] as String
       );
    }).toList();
  }
}