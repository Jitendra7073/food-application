import 'package:flutter/material.dart';
import 'package:login_signup/widgets/custom_scaffold.dart';
import '../theme/theme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(height: 10),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Please enter email'
                            : null,
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'OTP',
                          hintText: 'Enter OTP',
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Please enter OTP'
                            : null,
                      ),
                      const SizedBox(height: 35),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Reset link sent'),
                                ),
                              );
                            }
                          },
                          child: const Text('Reset Password'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
