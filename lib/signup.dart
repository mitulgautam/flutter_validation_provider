import 'package:flutter/material.dart';
import 'package:flutter_validation_provider/signup_model.dart';
import 'package:provider/provider.dart';
import 'validator.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SignUpModel model = Provider.of<SignUpModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          reverse: true,
          child: Form(
            autovalidate: model.autoValidate,
            key: _formState,
            child: Column(
              children: <Widget>[
                Text(
                  'Sign Up Form!',
                  style: TextStyle(fontSize: 36.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: TextFormField(
                    validator: (name) {
                      return Validator.validateName(name);
                    },
                    onSaved: (name) {
                      model.user.name = name;
                    },
                    controller: _name,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'Enter your name',
                        border: OutlineInputBorder()),
                  ),
                ),
                //name
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: TextFormField(
                    validator: (email) {
                      return Validator.validateEmail(email);
                    },
                    onSaved: (email) {
                      model.user.email = email;
                    },
                    controller: _email,
                    decoration: InputDecoration(
                        labelText: 'Enter your e-mail',
                        border: OutlineInputBorder()),
                  ),
                ),
                //email
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: TextFormField(
                    validator: (password) {
                      return Validator.validatePassword(password);
                      model.user.password = password;
                    },
                    onSaved: (password) {
                      _password.text = password;
                    },
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Enter your password',
                        border: OutlineInputBorder()),
                  ),
                ),
                //password
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: TextFormField(
                    validator: (confirmPassword) {
                      return Validator.confirmPassword(
                          _password.text, confirmPassword);
                    },
                    onSaved: (password) {
                      model.user.confirmPassword = password;
                    },
                    controller: _confirmPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Please confirm password',
                        border: OutlineInputBorder()),
                  ),
                ),
                //confirm password
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: OutlineButton(
                    padding: EdgeInsets.all(16.0),
                    borderSide: BorderSide(color: Colors.green),
                    onPressed: () {
                      model.autoValidate = true;
                      if (model.validate(_formState)) {
                        _name.text = '';
                        _password.text = '';
                        _confirmPassword.text = '';
                        _email.text = '';
                        model.autoValidate = false;
                      }
                    },
                    child: Text('Signup to continue'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
