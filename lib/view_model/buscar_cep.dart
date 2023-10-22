import 'package:desafio_dio_cep/repositories/cep_repository.dart';
import 'package:flutter/material.dart';

buscarCep(Map<String, dynamic> cep) async {
  var listaCep = await CEPRepository().obterCEPs();

  var buscaCEP =
      listaCep.where((cepArmazenado) => cepArmazenado.cep == cep["cep"]);

  if (buscaCEP.toString() == "()") {
    print("88888888888");
    return cep;
    //CEPRepository().cadastrarCEPs(cep);
  } else {
    return 'erro';
  }
}
