import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_app/presentation/clases/integrantes.dart';
import 'package:login_app/presentation/screens/home_screen.dart';
import 'package:login_app/presentation/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const name = 'login-screen';
  final int pageIndex;
  const LoginScreen({super.key, required this.pageIndex});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  List<Integrantes> integrantes = [
    Integrantes("dario.rivera@unah.hn", "20212020267", "Axel Rivera"),
    Integrantes("eduardo.garcia@unah.hn", "20212020268", "Eduardo Garcia"),
  ];


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

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar("Todos los campos son obligatorios.");
      return;
    }

    if (!email.endsWith('@unah.hn')) {
      _showSnackBar("El correo debe terminar en @unah.hn.");
      return;
    }

   
  Integrantes? encontrado;
  try {
    encontrado = integrantes.firstWhere((i) => i.correInstitucional == email && i.numeroCuenta == password);
  } catch (e) {
    encontrado = null;
  }

  if (encontrado != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green[600],
        content: Text('¡Ingreso exitoso!'),
      ),
    );
    Future.delayed(const Duration(milliseconds: 500), () {
      context.goNamed(
        HomeScreen.name,
        pathParameters: {'page': '0'},
        extra: encontrado,
      );
    });
  } else {
    _showSnackBar("Credenciales incorrectas.");
  }

    print('Formulario válido. Nombre: $name, Correo: $email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          elevation: 0,
          centerTitle: true,
          title: Text('HealthNest', style: TextStyle(color: Colors.white)),
        ),
       body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 100),
            Center(
              child: Column(
                children: const [
                  Text(
                    "¡Bienvenido Nuevamente!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

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
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _signUp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text("Ingresar", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            const SizedBox(height: 16),

            const Center(
              child: Text("O también puedes iniciar sesión con:", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 16),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.g_mobiledata, color: Colors.white, size: 40),
              label: const Text("Google", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.facebook, color: Colors.white, size: 25),
              label: const Text("Facebook", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("¿No tiene una cuenta? ", style: TextStyle(color: Colors.grey[400])),
                GestureDetector(
                  onTap: () => context.go('/signup/0'),
                  child: const Text(
                    "Crear una cuenta",
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