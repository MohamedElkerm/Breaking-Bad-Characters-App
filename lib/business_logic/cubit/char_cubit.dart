import 'package:bloc/bloc.dart';
import 'package:flutter_breaking/data/repo/characters_repo.dart';
import 'package:meta/meta.dart';

import '../../data/models/characters.dart';

part 'char_state.dart';

class CharCubit extends Cubit<CharState> {

  final CharactersRepository charactersRepository;
  List<Character>characters = [];
  CharCubit(this.charactersRepository) : super(CharInitial());


  List<Character> getAllCharacters(){
    charactersRepository.getAllCharacters().then((characters){
      this.characters = characters;
      print('done');
      emit(CharLoaded(characters));
    });
    return characters;

  }
}
