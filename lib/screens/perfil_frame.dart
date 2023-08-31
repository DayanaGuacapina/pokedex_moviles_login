import 'package:flutter/material.dart';
import 'package:pokedex_mobile/providers/login_provider.dart';
import 'package:provider/provider.dart';

class PerfilFrame extends StatelessWidget {
  const PerfilFrame({super.key});
  @override
  Widget build(BuildContext context) {
    LoginProvider auth = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  const MaterialStatePropertyAll(Color(0xFFE77B92))),
              onPressed: () async {
                await Provider.of<LoginProvider>(context, listen: false).logout();
              },
              child: const Text("Cerrar sesión")),
        ],
      )),
    );
  }
}
