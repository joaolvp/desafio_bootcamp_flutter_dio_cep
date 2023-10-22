import 'package:desafio_dio_cep/model/cep.dart';
import 'package:desafio_dio_cep/repositories/cep_repository.dart';
import 'package:flutter/material.dart';

class ListaCEPPage extends StatefulWidget {
  const ListaCEPPage({super.key});

  @override
  State<ListaCEPPage> createState() => _ListaCEPPageState();
}

class _ListaCEPPageState extends State<ListaCEPPage> {
  dynamic listaCep;
  dynamic listaComCep;

  obterCEPs() async {
    listaCep = await CEPRepository().obterCEPs();
    if (listaCep.runtimeType == List<ModelCEP>) {
        listaComCep = listaCep;
      
    } 
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: obterCEPs(), 
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return listaComCep.runtimeType == (List<ModelCEP>) ? Scaffold(
          appBar: AppBar(title: const Text('Lista')),
            body: ListView.builder(
              itemCount: listaComCep.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.green, width: 1)),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('CEP: ${listaComCep[index].cep},'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                      'Local: ${listaComCep[index].localidade}'),
                                ],
                              ),
                              Text('Bairro: ${listaComCep[index].bairro},'),
                              Text(
                                'Logradouro: ${listaComCep[index].logradouro}',
                                maxLines: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('UF: ${listaComCep[index].uf},'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text('DDD: ${listaComCep[index].ddd}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        : Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text('Não existe dados!'),
          ) 
        ); 
        }else{
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
            child: CircularProgressIndicator(),
          ),);
        }
        


      });
    
    
    
        
  }
}
