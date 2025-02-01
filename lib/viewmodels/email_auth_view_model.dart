import 'package:ecommerce/views/shop_view.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailAuthViewModel extends BaseViewModel {
  bool _isObscured = true;
  bool get isObscured => _isObscured;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();

  void togglePasswordVisibility() {
    _isObscured = !_isObscured;
    rebuildUi();
  }

  Future<void> login(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login successful!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ShopView()),
      );
    } on FirebaseAuthException catch (e) {
      String message;

      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided.';
      } else {
        message = 'Unexpected error: ${e.message}';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
      print('FirebaseAuthException: $e');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error: $e');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();
    super.dispose();
  }
}
