import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverApp'),
      ),
      body: const Center(
        child: _HomeScreenView(),
      ),
    );
  }
}

class _HomeScreenView extends StatelessWidget {

  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _CustomListTile(
          title: 'State Provider',
          subtitle: 'Random name generator',
          routeName: StateProviderScreen.routeName,
        ),
        _CustomListTile(
          title: 'Future Provider',
          subtitle: 'Pokemon api',
          routeName: FutureProviderScreen.routeName,
        ),
        _CustomListTile(
          title: 'Stream Provider',
          subtitle: 'Stream of random names',
          routeName: StreamProviderScreen.routeName,
        ),
        _CustomListTile(
          title: 'State Notifier Provider',
          subtitle: 'To-do list',
          routeName: StateNotifierProviderScreen.routeName,
        ),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {

  final String title;
  final String subtitle;
  final String routeName;

  const _CustomListTile({
    required this.title,
    required this.subtitle,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {
        context.pushNamed(routeName);
      },
    );
  }
}