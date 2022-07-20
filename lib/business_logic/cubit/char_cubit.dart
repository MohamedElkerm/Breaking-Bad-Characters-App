import 'package:bloc/bloc.dart';
import 'package:flutter_breaking/data/repo/characters_repo.dart';
import 'package:meta/meta.dart';

import '../../data/models/characters.dart';

part 'char_state.dart';

class CharCubit extends Cubit<CharState> {

  final CharactersRepository charactersRepository;
  late List<Character>characters;
  CharCubit(this.charactersRepository) : super(CharInitial());


  List<Character> getAllCharacters(){
    charactersRepository.getAllCharacters().then((characters){
      emit(CharLoaded(characters));
      this.characters = characters;
    });
    return characters;

  }
}
