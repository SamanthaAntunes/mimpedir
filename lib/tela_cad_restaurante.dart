import 'package:flutter/material.dart';
import 'package:mimpedir/banco/restaurante_DAO.dart';
import 'package:mimpedir/restaurante.dart';
import 'package:mimpedir/tela_home.dart';
import 'package:mimpedir/tipo.dart';
import 'package:mimpedir/banco/tipo_DAO.dart';


class TelaCadRestaurante extends StatefulWidget {
 const TelaCadRestaurante({super.key});

 static Restaurante restaurante = Restaurante();

  @override
  State<StatefulWidget> createState() {
    return TelaCadRestauranteState();
  }
}
class TelaCadRestauranteState extends State<TelaCadRestaurante>{

  String? culinariaSelecionada;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  List<Tipo> tiposCulinaria = [];
  int? tipoCulinaria;

  void initState() {
    super.initState();
    carregarTipos();

    tipoCulinaria = TelaCadRestaurante.restaurante.tipoCulinaria?.codigo!;
    culinariaSelecionada = TelaCadRestaurante.restaurante.tipoCulinaria?.nome!;
  }

  Future<void> carregarTipos() async {
    final lista = await TipoDAO.listarTipos();
    setState(() {
      tiposCulinaria = lista;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de Restaurante")),
      body: Padding(padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Informações de Restaurante: "),
            SizedBox(height: 40),
            Text("Tipo de comida: "),
            DropdownButtonFormField<String>(value: culinariaSelecionada, items: tiposCulinaria.map((tipo) {
                return DropdownMenuItem<String>(value: tipo.nome, child: Text("${tipo.nome}"),
                );
              }).toList(),

                onChanged: (String? novaCulinaria){
                setState(() {
                  culinariaSelecionada = novaCulinaria;
                  Tipo tipoSelecionado = tiposCulinaria.firstWhere(
                      (tipo) => tipo.nome == novaCulinaria,
                  );
                  tipoCulinaria = tipoSelecionado.codigo;
                });
                },
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Nome do Restaurante'),
              validator: (String? value) {},
              controller: nomeController,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Latitude'),
              validator: (String? value) {},
              controller: latitudeController,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Longitude'),
              validator: (String? value) {},
              controller: longitudeController,
            ),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: ()async{

                  final sucesso = await RestauranteDAO.cadastrarRestaurante(nomeController.text,
                      latitudeController.text, longitudeController.text, tipoCulinaria);

                  String mensagem;
                  Color corFundo;

                  if(sucesso > 0){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaHome())
                    );
                    // Sucesso: ID retornado é maior que 0
                    mensagem = '"${nomeController.text}" cadastrado com sucesso! ID: $sucesso';
                    corFundo = Colors.green;
                  }
                  else{
                    mensagem = 'ERRO: Não foi possível cadastrar o restaurante. Verifique os dados.';
                    corFundo = Colors.red;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(mensagem),
                        backgroundColor: corFundo,
                        duration: const Duration(seconds: 4),
                      ),
                  );
                },
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.save),
                Text("Cadastrar")
              ],
            ))
          ],
        ),
      ),
    );
  }
}