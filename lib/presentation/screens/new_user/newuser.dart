import 'package:flutter/material.dart';
import 'package:prueba/presentation/widgets/widgets.dart';

class NewUserScreen extends StatelessWidget {
  static String routeName = 'new_user';
  const NewUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Usuario'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              TextFieldWidget(
                label: 'Nombre',
                placeholder: 'Nombre',
                icon: Icons.person,
              ),
              SizedBox(height: 10.0),
              TextFieldWidget(
                label: 'Correo',
                placeholder: 'Correo',
                icon: Icons.mail,
              ),
            ],
          )),
    );
  }
}
