import 'package:chat_app/models/usuarios.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
class UsuariosScreen extends StatefulWidget {
  const UsuariosScreen({Key? key}) : super(key: key);

  @override
  State<UsuariosScreen> createState() => _UsuariosScreenState();
}

class _UsuariosScreenState extends State<UsuariosScreen> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final users =  [
    Usuario(uid: '1', nombre: 'Alain', email: 'ASDFD@GMAIL.COM', online: true),
    Usuario(uid: '2', nombre: 'Bianca', email: 'love@GMAIL.COM', online: true),
    Usuario(uid: '3', nombre: 'Lesly', email: 'love2@GMAIL.COM', online: false),
    Usuario(uid: '4', nombre: 'Abril', email: 'love2@GMAIL.COM', online: true),
  ];
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar:AppBar(
        title: const Text('Usuarios'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.power_settings_new),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const  Icon(Icons.check),
            onPressed: (){},
          ),
        ],

      ) ,
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        header: const WaterDropHeader(
          complete:  Text('Listo',style: TextStyle(color: Colors.green,fontSize: 20)),
          failed:  Text('Error',style: TextStyle(color: Colors.red,fontSize: 20)),
        ),
        child: _listViewUsuarios())
    );
  }
  ListView _listViewUsuarios (){
    return ListView.separated(
         itemCount: users.length,
        itemBuilder:(context,index)=> _usuarioListTitle(users[index]) , 
        separatorBuilder: (context,index)=>const Divider(),
         );
  }

  ListTile _usuarioListTitle(Usuario user) {
    return ListTile(
        leading: CircleAvatar(
          child: Text(user.nombre.substring(0,2)),
        ),
        title: Text(user.nombre),
        subtitle: Text(user.email),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: user.online ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(100)
          ),
        ),
      );
  }

  void _cargarUsuarios()async {
    await Future.delayed(const Duration(seconds: 2));
    _refreshController.refreshCompleted();
  }
}