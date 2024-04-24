import 'package:dio/dio.dart';

class PokemonService {

  static Future<String> getPokemonName(int pokemonId) async {

    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2',
      )
    );

    await Future.delayed(const Duration(seconds: 2));

    try {
      final response = await dio.get('/pokemon/$pokemonId');
      return response.data['name'] ?? 'Pokemon name not found';
    } catch (error) {
      throw Exception('getPokemonName error: $error');
    }
  }

}