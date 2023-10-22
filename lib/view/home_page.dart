import 'package:brasil_fields/brasil_fields.dart';
import 'package:desafio_dio_cep/repositories/cep_repository.dart';
import 'package:desafio_dio_cep/repositories/viacep_repository.dart';
import 'package:desafio_dio_cep/view_model/buscar_cep.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

mostrarDialog(context, String texto) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
      title: Center(
        child: Text(texto),
      ),
      actions: [
        Center(child: ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Text('Fechar')),)
      ],
    );
      });
}

class _HomePageState extends State<HomePage> {
  dynamic listaCep;
  dynamic listaComCep;
  bool listaConstruida = false;
  TextEditingController cepController = TextEditingController();
  Text confirmaTexto = const Text('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          child: Column(
            children: [
              TextFormField(
                controller: cepController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
              ),
              ElevatedButton(
                  onPressed: () async {
                    var viaCep = await ViaCEPRepository()
                        .obterViaCEP(cepController.text);

                    var verificaCEP = await buscarCep(viaCep);

                    if (verificaCEP == "erro") {
                      setState(() {
                        mostrarDialog(context, "Esse CEP já existe!");
                      });
                    }else{
                      var criar = await CEPRepository().cadastrarCEPs(verificaCEP);
                      if(criar == 201){
                        setState(() {
                          mostrarDialog(context, "Criado com Sucesso!");
                          //confirmaTexto = const Text('Criado!!!', style: TextStyle(color: Colors.green),);
                        });
                      }else{
                        mostrarDialog(context, "Erro no Cadastro!");
                      }
                        

                      }
                  },
                  child: const Text('OK')),

                  /* const SizedBox(height: 10),

                  Center(child: confirmaTexto,)  */

                  
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/lista_cep');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
