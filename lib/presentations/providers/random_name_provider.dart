import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/config.dart';

// autoDispose is used to automatically dispose of the state when it is no longer used. (reset state when the widget is disposed)
final randomNameProvider = StateProvider.autoDispose<String>((ref) {
  return RandomGenerator.getRandomName();
});

// This keep the state alive even when the widget is disposed.
// final randomNameProvider = StateProvider<String>((ref) {
//   return RandomGenerator.getRandomName();
// });