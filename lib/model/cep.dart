class ModelCEP {
  String? cep;
  String? logradouro;
  //String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  //String? ibge;
  //String? gia;
  String? ddd;
  //String? siafi;

  ModelCEP(
      {this.cep,
      this.logradouro,
      //this.complemento,
      this.bairro,
      this.localidade,
      this.uf,
      //this.ibge,
      //this.gia,
      this.ddd,
      //this.siafi
      });

  factory ModelCEP.fromMap(Map<String, dynamic> json){
    return ModelCEP(
      cep: json['cep'],
      logradouro: json['logradouro'],
      //complemento: json['complemento'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf'],
      //ibge: json['ibge'],
      //gia: json['gia'],
      ddd: json['ddd'],
      //siafi: json['siafi'],
      
    );
  }
}