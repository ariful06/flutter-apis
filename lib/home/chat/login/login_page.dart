import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_learning/home/chat/controller/auth_controller.dart';
import 'package:flutter_api_learning/home/chat/register/register.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthController> {

  FocusNode? _focusNode  = FocusNode();
  bool _loggingIn = false;
  TextEditingController? _passwordController = TextEditingController(text: '');
  TextEditingController? _usernameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
          child: Column(
            children: [
              TextField(
                autocorrect: false,
                autofillHints: _loggingIn ? null : [AutofillHints.email],
                autofocus: true,
                controller: _usernameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  labelText: 'Email',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () => _usernameController?.clear(),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                onEditingComplete: () {
                  _focusNode?.requestFocus();
                },
                readOnly: _loggingIn,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
                  autocorrect: false,
                  autofillHints: _loggingIn ? null : [AutofillHints.password],
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () => _passwordController?.clear(),
                    ),
                  ),
                  focusNode: _focusNode,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                ),
              ),
              TextButton(
                onPressed: ()=> controller.login(_usernameController?.text.trim(), _passwordController?.text.trim()),
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: _loggingIn
                    ? null
                    : () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  );
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
