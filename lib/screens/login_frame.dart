import 'package:flutter/material.dart';
import 'package:pokedex_mobile/screens/registro_frame.dart';
import 'package:pokedex_mobile/widgets/login_datos.dart';

class LoginFrame extends StatefulWidget {
  const LoginFrame({super.key});
  static const routeName = "/login";
  @override
  State<LoginFrame> createState() => _LoginFrameState();
}

class _LoginFrameState extends State<LoginFrame> {
  double deviceHt = 0;
  double deviceWh = 0;
  @override
  Widget build(BuildContext context) {
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
                const Formulario_Password(mode: "login"),
                registroBtm(context),
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
        )
      ],
    );
  }

  Widget registroBtm(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Jugador nuevo?',
            style: TextStyle(color: Colors(0xFFE08290), fontSize: 15)),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RegistroFrame.routeName);
          },
          child: const Text(
            'Crear Cuenta',
            style: TextStyle( color: Color(0xFFED2B2A), fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
