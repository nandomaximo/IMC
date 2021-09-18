import 'package:calculadora_imc/Core/cadastro_repository.dart';
import 'package:calculadora_imc/Telas/login.dart';
import 'package:flutter/material.dart';



class Cadastro extends StatefulWidget {
  @override
  CadastroPageState createState() => CadastroPageState();
}

class CadastroPageState extends State<Cadastro> {
  final cadastroRepository = CadastroRepository();

  final ctrlEmail = new TextEditingController();
  final ctrlPass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 10, left: 40, right: 40),

          child: ListView(
          children: <Widget>[
            Container(
            width: 200,
            height: 200,
            alignment: Alignment(0.0, 1.15),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage("assets/imc.png"),
                fit: BoxFit.fitHeight,
              ),
            ),

            child: Container(
                color: Colors.green,

                height: MediaQuery.of(context).size.height/1.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Usuario",
                          labelStyle: TextStyle(color: Colors.black)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                      controller: ctrlEmail,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.black)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                      controller: ctrlPass,
                    ),


                  ],
                ),
              ),
            ),

            Positioned(
                bottom: MediaQuery.of(context).size.height/8.5,
                left:MediaQuery.of(context).size.width/6  ,
                right:MediaQuery.of(context).size.width/6  ,
                child: GestureDetector(
                    onTap:(){
                      cadastro(ctrlEmail.text, ctrlPass.text);
                    },
                    child:Container(
                        width:MediaQuery.of(context).size.width,
                        height: 80,
                        color: Colors.white,
                        child:Center(
                          child: Text('Cadastrar',style: TextStyle(color: Colors.black,fontSize: 17),) ,
                        )
                    )
                ))
          ],
        )

    )
    );
  }


  cadastro(String email, String senha) async{
    int result = await cadastroRepository.cadastro(email, senha);

    if(result == 200){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }

  }
}