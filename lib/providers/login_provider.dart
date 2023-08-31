import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokedex_mobile/main.dart';
import 'package:pokedex_mobile/screens/login_screen.dart';
import 'package:pokedex_mobile/services/navigation_service.dart';
import 'package:pokedex_mobile/services/snackbar_service.dart';

enum AutenticarStatus {
  noAutenticado, autenticando, yaAutenticado, usuarioNoExistente,
}

class LoginProvider extends ChangeNotifier {
  User? user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AutenticarStatus? status;
  LoginProvider() {
    checkLogin();
  }
2  Future<void> authLogin() async {
    if (user != null) {
        NavigationService.instance.navigateToReplacementName(MainWidget.routeName);
    }
  }

  void checkLogin() async {
    user = await _auth.currentUser;
    if (user != null) {
      status = AutenticarStatus.yaAutenticado;
      notifyListeners();
      await authLogin();
    }
  }

  Future<void> loginEmailPassword(
      BuildContext context, String email, String password) async {
    status = AutenticarStatus.autenticando;
    notifyListeners();
      await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((result) {
        user = result.user;
        status = AutenticarStatus.yaAutenticado;
        notifyListeners();
        Navigator.pushReplacementNamed(context, MainWidget.routeName);
      });
  }

  Future<void> registroEmailPassword(
      BuildContext context, String email, String password) async {
    status = AutenticarStatus.autenticando;
    notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) {
        user = result.user;
        status = AutenticarStatus.yaAutenticado;
        notifyListeners();
        Navigator.pop(context);
      });
  }

  Future<void> logout() async {
      await _auth.signOut().then((_) {
        status = AutenticarStatus.noAutenticado;
        user = null;
        NavigationService.instance
            .navigateToReplacementName(LoginFrame.routeName);
      });
    notifyListeners();
  }
}
