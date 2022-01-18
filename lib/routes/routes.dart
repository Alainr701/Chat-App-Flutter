import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/loading_screen%20copy.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:chat_app/screens/usuario_screen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> appRoutes={ 
    'usuarios': (BuildContext context) => const  UsuariosScreen(),
    'chat': (BuildContext context) => const  ChatScreen(),
    'login': (BuildContext context) => const  LoginScreen(),
    'register': (BuildContext context) => const  RegisterScreen(),
    'loading': (BuildContext context) => const  LoadingScreen()
};