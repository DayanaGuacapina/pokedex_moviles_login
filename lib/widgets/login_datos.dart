import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../providers/login_provider.dart';

class FormularioPassword extends StatefulWidget {
  final String mode;
  const Formulario_Password({super.key, required this.mode});
  @override
  State<Formulario_Password> createState() => _FormularioPasswordState();
}

class _Formulario_PasswordState extends State<Formulario_Password> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailControlador = TextEditingController();
  final TextEditingController _passwordControlador = TextEditingController();
  double deviceHt = 0;
  double deviceWh = 0;
  @override
  Widget build(BuildContext context) {
    deviceHt = MediaQuery.of(context).size.height;
    deviceWh = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      height: deviceHt * 0.5,
      child: Form(
        key: _formKey,
        onChanged: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: deviceHt * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  emailTxt(),
                  passwordTxt(),
                ],
              ),
            ),
            loginBtm(context),
          ],
        ),
      ),
    );
  }

  Widget emailTxt() {
    return Center(
      child: SizedBox(
        width: deviceWh * 0.8,
        child: TextFormField(
          autocorrect: false,
          style: const TextStyle(color: Colors.white),
          controller: _emailControlador,
          onSaved: (input) {
            setState(() {});
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            contentPadding: const EdgeInsets.all(1),
            hintText: "E-mail",
            hintStyle: const TextStyle(color: Color(0xFFF2B4C3)),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget passwordTxt() {
    return Center(
      child: SizedBox(
        width: deviceWh * 0.8,
        child: TextFormField(
          obscureText: true,
          autocorrect: false,
          controller: _passwordControlador,
          style: const TextStyle(color: Colors(0xFFF2B4C3)),
          onSaved: (input) {
            setState(() {});
          }, 
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            contentPadding: const EdgeInsets.all(1),
            hintText: "Password",
            hintStyle: const TextStyle(color: Color(0xFFF2B4C3)),
            filled: true,
            fillColor: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget loginBtm(BuildContext context) {
    LoginProvider? auth;
    auth = Provider.of<LoginProvider>(context);
    return SizedBox(
      width: deviceWh * 0.91,
      height: deviceHt * 0.05,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  const MaterialStatePropertyAll(Color(0xFFE47D90)),
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)))),
          onPressed: widget.mode == "login"
              ? auth.status == AutenticarStatus.autenticando
                  ? null
                  : () async {
                      if (_formKey.currentState!.validate()) {
                        await Provider.of<LoginProvider>(context, listen: false)
                            .loginEmailPassword(
                                context, _emailControlador.text, _passwordControlador.text);
                      }
                    }
                  : () async {
                  if (_formKey.currentState!.validate()) {
                    await Provider.of<LoginProvider>(context, listen: false)
                        .registroEmailPassword(context,
                            _emailControlador.text, _passwordControlador.text);
                  }
                },
          child: auth.status == AutenticarStatus.autenticando
              : widget.mode == "login"
                  ? const Text(
                      'Ingresar',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    )
                  : const Text(
                      'Registrarse',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    )),
    );
  }
}
