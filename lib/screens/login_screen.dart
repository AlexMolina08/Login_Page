import 'package:flutter/material.dart';
import 'package:login_page/utilities/constantes.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  bool _recuerdame = false;

  /*
  * Metodo para construir el textfield del correo
  * */
  Widget _buildEmailTF(){
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
                hintText: 'Introduce tu correo',
                hintStyle: kHintTextStyle
            ),
          )
      )

      //Container(alignment: Alignment.centerLeft ,)

    ],);
  }

  Widget _buildPasswordTF(){
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Contraseña',
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),

      Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child:TextField(
            obscureText: true,
            style: TextStyle(color:Colors.white),
            decoration: InputDecoration(
                border:InputBorder.none,
                contentPadding: EdgeInsets.only(top:14.0),
                prefixIcon: Icon(Icons.lock , color: Colors.white),
                hintText: 'Introduce tu contraseña',
                hintStyle: kHintTextStyle
            ),
          )
      )

      //Container(alignment: Alignment.centerLeft ,)

    ]);
  }

  Widget _buildForgotPasswordTF(){
    return Container(
        alignment: Alignment.centerRight,
        child: FlatButton(
            onPressed: () => print("Pulsado boton olvide contraseña"),
            child: Text("¿Olvidó Contraseña?",
                style: kLabelStyle)
        )
    );
  }

  Widget _buildRememberMeCheckBox(){
    return Container(
        child: Row(
          children: [
            Theme(
                data:ThemeData(unselectedWidgetColor: Colors.white ),
                child: Checkbox(
                  value: _recuerdame,
                  checkColor: Colors.green,
                  activeColor: Colors.white,
                  onChanged: (value){
                    setState(() {
                      _recuerdame = value;
                    });
                  },
                )
            ),
            Text('Recuérdame' , style: kLabelStyle)
          ],
        )
    );
  }

  Widget _buildLoginButton(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        child: Text("LOGIN" , style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'
        )),
        onPressed: () => print ('boton login pulsado'),
      ),
    );
  }

  Widget _buildSignInWithText(){
    return Column(
      children: [
        Text("- O - " , style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        SizedBox(height:20.0),
        Text("Entra con" , style: kLabelStyle,)
      ],
    );
  }

  Widget _buildSocialButton(Function onTap , AssetImage logo){
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle ,
              color: Colors.white ,
              boxShadow: [BoxShadow(
                  color:Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0
              ),
              ],
              image: DecorationImage(image: logo)
          )
      ),
    );
  }


  Widget _buildSocialButtonRow(){
    return Padding(
      padding: EdgeInsets.symmetric(vertical:30.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildSocialButton(
                    () => print("logeado con facebook"),
                AssetImage("assets/images/facebook.jpg")
            ), //funcion que construye un Gesture detector de un icono de una red social

            _buildSocialButton(
                    () => print("logeado con Google"),
                AssetImage("assets/images/google.png")
            )

          ]
      ),
    );
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
                Text('Entrar',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                )),

                SizedBox(height: 30.0),
                //Llamamos al método para construir el textfield de email
                _buildEmailTF(),
                SizedBox(height: 20.0),
                _buildPasswordTF(),
                //SizedBox(height: 10.0,),
                _buildForgotPasswordTF(),
                //_buildRememberMeCheckBox(),
                _buildLoginButton(),
                _buildSignInWithText(),
                _buildSocialButtonRow()
              ],
            )
          )
        )

      ],)
    );
    return Container();
  }
}
