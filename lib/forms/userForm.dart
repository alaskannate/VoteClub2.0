import 'package:flutter/material.dart';
import '../model/user.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              // Add more sophisticated email validation if needed
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true, // Use for password fields
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              // Add more sophisticated password validation if needed
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Here you can hash the password and create a new User instance
                  User newUser = User(
                    name: _nameController.text,
                    email: _emailController.text,
                    passwordHash: _passwordController.text, // Hash this password in real application
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  );
                  // Process the newUser object (e.g., send to a server)
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}