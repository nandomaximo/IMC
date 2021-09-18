import 'package:calculadora_imc/Core/login_repository.dart';
import 'package:calculadora_imc/Telas/Cadastro.dart';
import 'package:calculadora_imc/Telas/reset-password.page.dart';
import 'package:flutter/material.dart';
import 'home.dart';


class Login extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}


 class LoginPageState extends State<Login> {
  final loginRepository = LoginRepository();

  final ctrlEmail = new TextEditingController();
  final ctrlPass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.black,

        body: Stack(
          children: <Widget>[
            Container(color:Colors.white,height: MediaQuery.of(context).size.height,),
            SingleChildScrollView(
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.only(
                  top: 60,
                  left: 40,
                  right: 40,
                ),
                height: MediaQuery.of(context).size.height/1.2,
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      width: 128,
                      height: 128,
                      child: Image.asset("assets/imc.png"),
                    ),
                    //espaçamento entre logo e usuario
                    SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Usuário",
                          labelStyle: TextStyle(
                              color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20
                          )
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                      ),
                      controller: ctrlEmail,
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //senha
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(
                              color: Colors.black38
                          )
                      ),
                      textAlign:
                          TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      controller: ctrlPass,
                    ),
                    //recupera senha
                    Container(
                        height: 40,
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        child: Text(
                          "Recuperar Senha",
                          textAlign: TextAlign.right,
                        ),
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)  => ResetPasswordPage(),
                            ),
                          );
                        }
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Positioned(
                        bottom: MediaQuery.of(context).size.height/8.5,
                        left:MediaQuery.of(context).size.width/6  ,
                        right:MediaQuery.of(context).size.width/6  ,
                        child: GestureDetector(
                            onTap:(){
                              login(ctrlEmail.text,ctrlPass.text);
                            },
                            child:Container(
                                width:MediaQuery.of(context).size.width,
                                height: 80,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    stops: [0.3, 1],
                                    colors: [
                                      Color(0xFFF58524),
                                      Color(0XFFF92B7F),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5)
                                  )
                                ),
                                child: SizedBox.expand(
                                  child: FlatButton(
                                    child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Entrar",
                                          style: TextStyle(
                                            fontWeight:  FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Container(
                                          child: SizedBox(
                                            child: Image.asset("assets/imc2.png"),
                                            height: 28,
                                            width: 28,
                                          ),
                                        )
                                      ],
                                  ),
                                  ),
                                )
                            )
                        )
                    ),
                    Container(
                        margin:  EdgeInsets.only(
                            left:35.0,
                            right: 35.0,
                            top:20,
                            bottom: 10
                        ),

                        padding:
                        EdgeInsets.all(
                            20.0
                        ),
                        child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Cadastro()),
                              );
                            },
                            child:Text('Cadastro',
                              textAlign: TextAlign.center,
                              style:
                              TextStyle(color:
                              Colors.black38),))
                    )

                  ],
                ),


              ),

            ),
          ],
        )

    );
  }
  login(String email, String senha) async {
    int result = await loginRepository.login(email, senha);

    if(result == 200){
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }else{
      print('aconteceu um erro: '+result.toString());
    }
  }
}