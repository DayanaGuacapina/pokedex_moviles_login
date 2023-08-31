import 'package:flutter/material.dart';
import 'package:pokedex_mobile/services/snackbar_service.dart';
import 'package:pokedex_mobile/widgets/form_login_password.dart';

class RegistroFrame extends StatefulWidget {
  const RegistroFrame({super.key});
  static const routeName = "/register";
  @override
  State<RegistroFrame> createState() => _RegistroFrameState();
}

class _RegistroFrameState extends State<RegistroFrame> {
  double deviceHt = 0;
  double deviceWh = 0;
  @override
  Widget build(BuildContext context) {
    SnackBarService.instance.buildContext = context;
    deviceHt = MediaQuery.of(context).size.height;
    deviceWh = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFFFCED4),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: deviceHt,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                encabezado(),
                const Formulario_Password(mode: "register"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget encabezado() {
    return Column(
      children: [
        Center(
          child: Image.asset(
            "assets/poquedex.png",
            height: deviceWh * 0.60,
          ),
        ),
        const SizedBox(
          height: 17,
        ),
        const Text(
          "POKÉMON",
          style: TextStyle(
              color: Colors(0xFFE78093), fontSize: 55, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 78,
        ),
        const Text(
          "REGISTRO",
          style: TextStyle(
              color: Colors(0xFFE78093), fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
