import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_app/config/config.dart';

final pokemonIdProvider = StateProvider<int>((ref) {
  return 1;
});

// family decorator is used to create a provider that takes a parameter.
// This provider does not request again if the parameter is the same, return the stored state.
final pokemonNameProvider = FutureProvider.family<String, int>((ref, id) async {
  final name = await PokemonService.getPokemonName(id);
  return name;
});

// final pokemonNameProvider = FutureProvider<String>((ref) async {
//   final name = await PokemonService.getPokemonName(1);
//   return name;
// });