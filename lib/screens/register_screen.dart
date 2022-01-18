import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: const [_Logo(), _Form(), _Labels()],
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  const _Form({
    Key? key,
  }) : super(key: key);

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.person_outline,
            placeholder: 'Nombre de usuario',
            keyboardType: TextInputType.name,
            textController: nameController,
          ),
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Correo Electronico',
            keyboardType: TextInputType.emailAddress,
            textController: emailController,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Correo Electronico',
            keyboardType: TextInputType.visiblePassword,
            textController: passwordController,
            isPassword: true,
          ),
          const SizedBox(height: 20),
          CustomButton(
              onPressed: () {
                
                print(nameController.text);
                print(emailController.text);
                print(passwordController.text);
              },
              text: 'Ingresar')
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 25),
        width: 170,
        child: Column(
          children: const [
            Image(
              image: AssetImage('assets/logo.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Registrate',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class _Labels extends StatelessWidget {
  const _Labels({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿Ya tienes cuenta?',
          style: TextStyle(color: Colors.black54),
        ),
        TextButton(
          child: const Text('Ingresa'),
          onPressed: () => Navigator.of(context).pushNamed('login'),
        ),
      ],
    );
  }
}
