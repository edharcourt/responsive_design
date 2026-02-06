import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _passHidden = true;

  // there could be multiple forms. This assigns a unique
  // key to each form. Also, it calls the validator function
  // for each field in the form
  final _formKey = GlobalKey<FormState>();

  // an object used for extracting data from fields
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formKey,  // ID for a partiocular form
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _header(),
                const SizedBox(height: 40),
                _username(),  
                const SizedBox(height: 20),
                _password(),
                const SizedBox(height: 20),
                _loginButton(),
              ]
            ),
          ),
        ),
      ),
    );
  }  // build

  // Header
  Widget _header() {
    return const Text(
      'Welcome Back',
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,);
  }

  Widget _username() {
    return TextFormField(
      controller: _usernameController,   // TODO
      decoration: const InputDecoration(
        labelText: 'Username',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your username';
        }
        return null;  // no error
      },   // TODO
    );
  }

  Widget _password() {
    return TextFormField(
      controller: null,   // TODO
      obscureText: _passHidden,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(_passHidden ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _passHidden = !_passHidden;
            });
          },
          )
      ),
      validator: null,  // TODO
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: _submitLogin, 
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontSize: 18),
      ), 
      child: const Text('Login'),
    );
  }

  void _submitLogin() {
      
      // call all of the validator function in the Form
      // I am certain currentState is not going to be null
      if (_formKey.currentState!.validate()) {
          final username = _usernameController.text.trim();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('loggin in user $username')),
          );
      }
  }

}
