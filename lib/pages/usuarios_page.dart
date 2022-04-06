import 'package:chat/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class UsuariosPage extends StatefulWidget {

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(uid: '1', email: 'ricardo@gmail.com', nombre: 'Ricardo', online: true),
    Usuario(uid: '2', email: 'diana@gmail.com', nombre: 'Diana', online: true),
    Usuario(uid: '3', email: 'Mariela@gmail.com', nombre: 'Mariela', online: true),
    Usuario(uid: '4', email: 'Javier@gmail.com', nombre: 'Javier', online: false),
    Usuario(uid: '5', email: 'rossy@gmail.com', nombre: 'Rossy', online: true),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi nombre',style: TextStyle(color: Colors.black87),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          color:  Colors.black87,
          onPressed: (){},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right:5),
            //child: Icon(Icons.radio_button_on_outlined,color: Colors.green, size: 20),
            child: Icon(Icons.highlight_remove,color: Colors.red,size: 20),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropHeader(
          complete: Icon(Icons.check,color: Colors.blue[400]),
        waterDropColor: Colors.blue
        ),
        onRefresh: _cargarUsuarios,
        child: _listViewUsuarios()
        )
   );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_,i) => _usuarioListTile( usuarios[i]),
      separatorBuilder: (_,i) => Divider(), 
      itemCount: usuarios.length);
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
           title: Text(usuario.nombre),
           subtitle: Text(usuario.email),
           leading: CircleAvatar(
             child: Text(usuario.nombre.substring(0,2)),
             backgroundColor: Colors.blue[100],
           ),
           trailing: Container(
             width: 10,
             height: 10,
             decoration: BoxDecoration(
               color: usuario.online ? Colors.green[300] : Colors.red,
               borderRadius: BorderRadius.circular(20)
             )
           )
         );
  }

  _cargarUsuarios() async{
// monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }


}