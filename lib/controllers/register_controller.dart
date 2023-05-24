import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_bloc/register_blocs.dart';
import '../utils/flutter_toast.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can't be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can't be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can't be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Please confirm your password");
      return;
    }
    if (password != rePassword) {
      toastInfo(msg: "Password and Confirm Password don't match");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        await FirebaseFirestore.instance.collection("users").doc(credential.user!.uid).set({
          'name': userName,
          'email': email,
        });
        debugPrint('${credential.user!.uid}');
        toastInfo(
            msg:
            "An email has been sent to your registered email. To activate it, please check your email inbox and click on the link.");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The email is already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "The email is invalid");
      }
    }
  }
}
