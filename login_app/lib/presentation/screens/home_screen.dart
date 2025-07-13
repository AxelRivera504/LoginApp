import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_app/presentation/clases/integrantes.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;
  final Integrantes? integrante;

  const HomeScreen({
    Key? key,
    required this.pageIndex,
    required this.integrante,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nombre = integrante?.nombreCompleto ?? 'Usuario';

    return Scaffold(
       appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          elevation: 0,
          centerTitle: true,
          leading: Container(
            margin: const EdgeInsets.all(8),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () => context.go('/login/0'),
            ),
          ),
          title: Text('HealthNest', style: TextStyle(color: Colors.white)),
        ),
      body: Center(
        child: Text(
          'Bienvenido, $nombre',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
