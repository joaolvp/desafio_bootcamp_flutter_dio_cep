import 'package:desafio_dio_cep/model/cep.dart';
import 'package:dio/dio.dart';

class CEPRepository{
  obterCEPs()async{
    var dio = Dio();
    List<ModelCEP> lista = [];
    dio.options.headers["X-Parse-Application-Id"] = "PP2rPFPy7GxNPdMMLqDbny16FHxefMs3m92zcJV1";
    dio.options.headers["X-Parse-REST-API-Key"] = "29E4IxZwJTsoi37qMjAGa7gzXqPnfT8dn8kQHxtO";
    dio.options.headers["content-type"] = "application/json";
    var result = await dio.get('https://parseapi.back4app.com/classes/cep');
    /* print("result data é: ${result.data}");
    print("result data é: ${result.data["results"]}"); */

    if(result.data["results"] != []){
      for( var x in result.data["results"]){
        lista.add(ModelCEP.fromMap(x));
      }
      return lista;
    }

    return "Sem CEP cadastrado.";
  }


  cadastrarCEPs(dynamic cepDados)async{
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] = "PP2rPFPy7GxNPdMMLqDbny16FHxefMs3m92zcJV1";
    dio.options.headers["X-Parse-REST-API-Key"] = "29E4IxZwJTsoi37qMjAGa7gzXqPnfT8dn8kQHxtO";
    dio.options.headers["content-type"] = "application/json";
    var result = await dio.post('https://parseapi.back4app.com/classes/cep', data: cepDados);
    print("staty=uasdna2312");
    print("result data é: ${result.statusCode}");

    return result.statusCode;
  }
}