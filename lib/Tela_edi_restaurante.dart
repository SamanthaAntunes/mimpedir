import 'package:flutter/material.dart';
import 'package:mimpedir/restaurante.dart';
import 'package:mimpedir/tipo.dart';
import 'package:mimpedir/banco/restaurante_DAO.dart';
import 'package:mimpedir/banco/tipo_DAO.dart';


class TelaEdiRestaurante extends StatefulWidget {
  const TelaEdiRestaurante({super.key});

  //restaurante que será exibido na tela
  static Restaurante restaurante = Restaurante();

  @override
  State<StatefulWidget> createState() {
    return TelaEdiRestauranteState();
  }
}

  class TelaEdiRestauranteState extends State<TelaEdiRestaurante> {

    final TextEditingController nomeController = TextEditingController();
    final TextEditingController latitudeController = TextEditingController();
    final TextEditingController longitudeController = TextEditingController();
    final TextEditingController cdController = TextEditingController();
    String? culinariaSelecionada;
    List<Tipo> tiposCulinaria = [];
    int? tipoCulinaria;
    int? codigo = TelaEdiRestaurante.restaurante.codigo as int;

    void initState() {
      super.initState();
      carregarTipos();
      cdController.text = TelaEdiRestaurante.restaurante.codigo.toString()!;
      nomeController.text = TelaEdiRestaurante.restaurante.nomeRestaurante!;
      latitudeController.text = TelaEdiRestaurante.restaurante.latitude.toString()!;
      longitudeController.text = TelaEdiRestaurante.restaurante.longitude.toString()!;
      tipoCulinaria = TelaEdiRestaurante.restaurante.tipoCulinaria?.codigo!;
      culinariaSelecionada = TelaEdiRestaurante.restaurante.tipoCulinaria?.nome!;
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
        appBar: AppBar(title: const Text("Editar Restaurante")),
        body: Padding(padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Informações de Restaurante: "),
              SizedBox(height: 40),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Código do Restaurante: '),
                validator: (String? value) {},
                controller: cdController,
                enabled: false,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Nome do Restaurante'),
                validator: (String? value) {},
              ),
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
                decoration: const InputDecoration(hintText: 'Longitude'),
                validator: (String? value) {},
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Latitude'),
                validator: (String? value) {},
              ),

              SizedBox(height: 50),
              ElevatedButton(onPressed: () {}, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.save),
                  Text("Salvar")
                ],
              ),
              ),
            ],
          ),
        ),
      );
    }
  }


