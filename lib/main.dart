import 'package:flutter/material.dart';
import 'package:mimpedir/tela_login.dart';
import 'usuario.dart';
import 'tipo.dart';
import 'restaurante.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
  //Criando objetos
    Usuario usuario = Usuario(
      codigo: 1,
        senha: "ify",
        login: 'SamAntunes',
        nome: 'Samantha'
    );
    Tipo tipo = Tipo(
        codigo: 1,
        nome: "Italiano"
    );
    Restaurante restaurante = Restaurante(
      codigo: 1,
      nomeRestaurante: "La Bella Massa",
      latitude: 45,
      longitude: 15,
      proprietario: Usuario(),
      tipoCulinaria: Tipo()
    );


    return MaterialApp(
       debugShowCheckedModeBanner: false,
          home: TelaLogin(),
     //   home: Scaffold(
    //      appBar: AppBar(
     //         title: const Text("Restaurante"),
    //     ),
    //      body: Center(
     //      child: Padding(padding: const EdgeInsets.all(18.0),
      //       child: Column(
      //         children: [
        //          Text("Nome Restaurante: ${restaurante.nomeRestaurante}"),
        //          Text("Código: ${restaurante.codigo}"),
       //           Text("Localização: ${restaurante.latitude} ${restaurante.longitude}"),
       //          Text("Nome do proprietário: ${restaurante.proprietario.nome}"),
       //         Text("Tipo de Culinária: ${restaurante.tipoCulinaria.nome}"),
       //          Text(""),
       //        ],
      //        ),
      //      ),
    //     ),

   //   ),
    );

  }
}

