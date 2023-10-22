import 'package:dio/dio.dart';

class ViaCEPRepository{
  obterViaCEP(String cep)async{
    var dio = Dio();
    String cepTratado = cep.replaceAll(RegExp(r'[.-]'), '');
    try{
    dio.options.headers["content-type"] = "application/json";
    var result = await dio.get('https://viacep.com.br/ws/$cepTratado/json/');
    
    if(result.statusCode == 200 && result.data["erro"] != true){
      return result.data;
    }
    return 'Erro ao buscar CEP no ViaCEP';
    }catch(error){
      return "Erro ao buscar CEP no ViaCEP ${error.runtimeType}";
    }
    
  }
}