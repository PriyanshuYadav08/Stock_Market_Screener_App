import 'package:flutter/material.dart';

/// Simple authentication screen placeholder.
/// Add real login/registration logic here later.
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  // String _email = '';
  // String _password = '';
  bool _loading = false;

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    // TODO: perform authentication
    setState(() {
      _loading = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _loading = false;
      });
      // show success/failure
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login attempted (placeholder)')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Enter email' : null,
                  // onSaved: (v) => _email = v ?? '',
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Enter password' : null,
                  // onSaved: (v) => _password = v ?? '',
                ),
                const SizedBox(height: 20),
                _loading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _submit,
                        child: const Text('Login'),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}