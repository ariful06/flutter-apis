
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_api_learning/home/chat/controller/auth_controller.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<AuthController> {

  RegisterPage({Key? key}) : super(key: key);

  FocusNode? _focusNode = FocusNode();
  bool _registering = false;
  TextEditingController? _passwordController  = TextEditingController(text: '');
  TextEditingController? _usernameController  = TextEditingController(text: '');
  TextEditingController? _firstNameController  = TextEditingController(text: '');
  TextEditingController? _lastNameController  = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
          child: Column(
            children: [
              TextField(
                autocorrect: false,
                autofillHints: _registering ? null : [AutofillHints.email],
                autofocus: true,
                controller: _usernameController,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                readOnly: _registering,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
                  autocorrect: false,
                  autofillHints: _registering ? null : [AutofillHints.password],
                  controller: _passwordController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    labelText: 'Password',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
                  autocorrect: false,
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    labelText: 'First Name',
                  ),
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),

                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
                  autocorrect: false,
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    labelText: 'Last Name',
                  ),
                  onEditingComplete: () {
                    _focusNode?.requestFocus();
                  },
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                ),
              ),

              TextButton(
                onPressed:(){
                  controller.register(_firstNameController!.text.trim(), _lastNameController!.text.trim(),_usernameController!.text.trim(), _passwordController!.text.trim());
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
