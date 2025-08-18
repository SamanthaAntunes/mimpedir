class Tipo{
  int? _codigo;
  String? _nome;

  Tipo({
     String? nome, int? codigo}){
    _codigo = codigo;
    _nome = nome;
  }

    //getters
   String? get nome => _nome;
   int? get codigo => _codigo;

   //setters
   set nome(String? nome) => _nome = nome;
   set codigo(int? codigo) => _codigo = codigo;
}