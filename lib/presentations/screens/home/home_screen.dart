import 'package:flutter/material.dart';
import 'package:flutter_riverpod_app/presentations/screens/screens.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('RiverApp')),
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
          subtitle: 'A simple state',
          routeName: StateProviderScreen.routeName,
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

    final titleMediumStyle = Theme.of(context).textTheme.titleMedium;

    return ListTile(
      title: Text(title, style: titleMediumStyle),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {
        context.pushNamed(routeName);
      },
    );
  }
}