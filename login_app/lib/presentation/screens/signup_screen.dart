import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_app/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  static const String name = 'signup_screen';
  final int pageIndex;

  const SignUpScreen({super.key, required this.pageIndex});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red[700], content: Text(message)));
  }

  void _signUp() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    final regexSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showSnackBar("Todos los campos son obligatorios.");
      return;
    }

    if (!email.endsWith('@unah.hn')) {
      _showSnackBar("El correo debe terminar en @unah.hn.");
      return;
    }

    if (password.length < 6) {
      _showSnackBar("La contraseña debe tener al menos 6 caracteres.");
      return;
    }

    if (!regexSpecialChar.hasMatch(password) ||
        password.replaceAll(RegExp(r'[!@#$%^&*(),.?":{}|<>]'), '').length != password.length - 1) {
      _showSnackBar("La contraseña debe contener exactamente un carácter especial.");
      return;
    }

    if (password != confirmPassword) {
      _showSnackBar("Las contraseñas no coinciden.");
      return;
    }

    // Guardar valores o continuar
    print('Formulario válido. Nombre: $name, Correo: $email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.go('/login/0')),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Column(
                children: const [
                  Text(
                    "Crear Cuenta",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            CustomTextField(label: "Ingrese su nombre", controller: _nameController),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Ingrese su correo",
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Ingrese su contraseña",
              controller: _passwordController,
              obscureText: _obscurePassword,
              toggleVisibility: _togglePasswordVisibility,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: "Confirme su contraseña",
              controller: _confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              toggleVisibility: _toggleConfirmPasswordVisibility,
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _signUp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text("Crear Cuenta", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 16),

            const Center(
              child: Text("O o también puedes registrarte con:", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.g_mobiledata),
              label: const Text("Google", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.facebook),
              label: const Text("Facebook", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ya tienes una cuenta? ", style: TextStyle(color: Colors.grey[400])),
                GestureDetector(
                  onTap: () => context.go('/login/0'),
                  child: const Text(
                    "Iniciar Sesión",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
