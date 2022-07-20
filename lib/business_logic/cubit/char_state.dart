part of 'char_cubit.dart';

@immutable
abstract class CharState {}

class CharInitial extends CharState {}


class CharLoaded extends CharState {
  final List<Character> character;

  CharLoaded(this.character);
}
