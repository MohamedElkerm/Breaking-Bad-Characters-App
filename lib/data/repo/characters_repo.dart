

import 'package:flutter_breaking/data/web_servises/characters_web_services.dart';

import '../models/characters.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;
  CharactersRepository(this.charactersWebServices);
  Future<List<Character>> getAllCharacters()async{
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((e) => Character.fromJson(e)).toList();
  }

}