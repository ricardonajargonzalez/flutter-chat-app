import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:chat/widgets/chat_message.dart';

class ChatPage extends StatefulWidget {

  @override
  State<ChatPage> createState() => _ChatPageState();
}

//TickerProviderStateMixin es necesario para la animacion
class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();
  bool _estaEscribiendo = false;

  List<ChatMessage> _messages = [
    //ChatMessage(texto: "Hola sdf sdf sdf sdf sdf sdf sdfsdfs dfsdf sdf sdfsdf sdf sdfsdf dd", uid: "123"),

 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              child: Text("RI", style: TextStyle(fontSize: 12)),
              backgroundColor: Colors.blue[100],
              maxRadius: 12,
            ),
            SizedBox(
              height: 3,
            ),
            Text("Ricardo Najar", style: TextStyle(color: Colors.black87,fontSize: 12))
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i]
                ) 
              ),
              Divider(height: 2),
              //caja de texto
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: _inputchat(),
              )
          ],
        ),
      ),
   );
  }

  Widget _inputchat(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String text){
                  setState(() {
                      if (text.trim().length > 0){
                        _estaEscribiendo = true;
                      }else{
                         _estaEscribiendo = false;
                      }
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none, //con el InputDecoration.collapsed ya no necesitamos esconder el border
                  hintText: 'Enviar Mensaje'
                ),
                focusNode: _focusNode,
              )
              ),
              Container(
                //margin: EdgeInsets.symmetric(horizontal: 2.0),
                child: Platform.isAndroid 
                ? IconTheme(
                  data: IconThemeData(
                          color: Colors.blue[400]
                  ),
                  child: IconButton(
                    highlightColor: Colors.transparent, //esconer el efecto que sale por detras del botton
                    splashColor: Colors.transparent,
                    onPressed:  _estaEscribiendo 
                    ? () => _handleSubmit(_textController.text)
                    : null,
                    icon: Icon(Icons.send)),
                )
                : CupertinoButton(
                  onPressed: _estaEscribiendo 
                    ? () => _handleSubmit(_textController.text)
                    : null,
                  child: Text('Enviar'))
              )
          ],
        ),
      )
      );
  }

  _handleSubmit(String texto){
    
    if (texto.length == 0 ) return; //condicion para que no entre mensajes vacios

    print(texto);
    _textController.clear();
    _focusNode.requestFocus();
    final ChatMessage newMessage = new ChatMessage(
      texto: texto, 
      uid: "123",
      animationController: AnimationController(vsync: this, duration: Duration(milliseconds: 500)), //necesario animation
      );

    _messages.insert(0,newMessage);
    newMessage.animationController.forward(); //para iniciar animacion

    setState(() {
       _estaEscribiendo = false;
    });
  }

  @override  //cuando se utiliza una animacion se tiene que cerrar con dispose
  void dispose() {
    // TODO: off del socket
    
    //limpieza de oontroladores para que no se haga basura
    for(ChatMessage message in _messages){
      message.animationController.dispose();
    }


    super.dispose();
  }
}