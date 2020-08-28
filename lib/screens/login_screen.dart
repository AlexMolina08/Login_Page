import 'package:flutter/material.dart';
import 'package:login_page/utilities/constantes.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  _buildEmailTF(){
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Correo',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),

      Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child:TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color:Colors.white),
            decoration: InputDecoration(
                border:InputBorder.none,
                contentPadding: EdgeInsets.only(top:14.0),
                prefixIcon: Icon(Icons.email , color: Colors.white),
                hintText: 'Introduce tu e-mail',
                hintStyle: kHintTextStyle
            ),
          )
      )

      //Container(alignment: Alignment.centerLeft ,)

    ],);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(height: double.infinity,width: double.infinity,decoration:
        BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors :[
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                //El atributo stops especifica la fraccion del vector desde 0.0 a 1.0 de cada color
                stops: [0.1,0.4,0.7,0.9]
            ),
          ),
        ),

        Container(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 40.0 , vertical: 120.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Registro',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                )),

                SizedBox(height: 30.0),
                //Llamamos al método para construir el textfield de email
                _buildEmailTF()

              ],
            )
          )
        )

      ],)
    );
    return Container();
  }
}
