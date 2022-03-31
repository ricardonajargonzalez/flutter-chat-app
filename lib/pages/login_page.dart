import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  logo(titulo: "Messenger"),
                  _Form(),
                  Labels(text1: "¿No tienes cuenta?", text2: "Crea una ahora!", ruta: 'register'),
                  Text(
                    "Terminos y condiciones de uso",
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    final ctlemail = TextEditingController();
    final ctlpass = TextEditingController();

    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.white,
      primary: Colors.blue[300],
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(vertical: 20),
      // shape: const RoundedRectangleBorder( //border rectangular
      //   borderRadius: BorderRadius.all(Radius.circular(2)),
      // ),
      shape: StadiumBorder() //border redondos
    );

    return Container(
      //contenemos de los TextField
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomInput(
              icon: Icons.email_outlined,
              placeholder: "Correo electronico",
              textInputType: TextInputType.emailAddress,
              isPassword: false,
              textController: ctlemail),
          CustomInput(
              icon: Icons.lock_outline,
              placeholder: "Contraseña",
              textInputType: TextInputType.emailAddress,
              isPassword: true,
              textController: ctlpass),
              BottonAzul(raisedButtonStyle: raisedButtonStyle, text: "ENTER", onPress: (){
                  print("ctlemail " + ctlemail.text);
                  print("ctlpass " + ctlpass.text);
              },)
        ],
      ),
    );
  }
}
