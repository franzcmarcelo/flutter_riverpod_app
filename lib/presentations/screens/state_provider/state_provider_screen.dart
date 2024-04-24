import 'package:flutter/material.dart';

class StateProviderScreen extends StatelessWidget {

  static const String routeName = 'state_provider_screen';

  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final titleMediumStyle = Theme.of(context).textTheme.titleMedium;

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
        child: Text('State Provider Screen', style: titleMediumStyle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed function here
        },
        child: const Icon(Icons.refresh_rounded),
      )
    );
  }
}