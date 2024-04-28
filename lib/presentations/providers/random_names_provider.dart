import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/config/config.dart';

final namesStreamProvider = StreamProvider.autoDispose<List<String>>((ref) async* {
  final List<String> names = [];
  await for (final name in RandomGenerator.randomNamesStream() ) {
    names.add(name);
    yield names;
  }

});

// final namesStreamProvider = StreamProvider<List<String>>((ref) async* {

//   await Future.delayed(const Duration(seconds: 2));
//   yield [];

//   await Future.delayed(const Duration(seconds: 2));
//   yield ['Franz'];

//   await Future.delayed(const Duration(seconds: 2));
//   yield ['Franz', 'Dubs'];

//   await Future.delayed(const Duration(seconds: 2));
//   yield ['Franz', 'Dubs', 'Riverpod'];
// });