import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/config/config.dart';

final namesStreamProvider = StreamProvider.autoDispose<String>((ref) async* {
  await for (final name in RandomGenerator.randomNamesStream() ) {
    yield name;
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