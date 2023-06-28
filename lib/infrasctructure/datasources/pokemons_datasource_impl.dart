

import 'package:dio/dio.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrasctructure/mappers/pokemon_mapper.dart';

class PokemonDatasoruceImpl implements PokemonsDatasource{

  final Dio dio;

  PokemonDatasoruceImpl()
    : dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));

  
  
  @override 
  Future<(Pokemon?, String)> getPokemon(String id) async{
    try{

      final resp = await dio.get('/pokemon/$id');
      final pokemon = PokemonMapper.pokeApiPokemonToEntity(resp.data);

      return ( pokemon, 'Data obtenida correctamente');

    }catch(e){
      return ( null, 'No se pudo obtener el pokemon $e');
    }
  }

}