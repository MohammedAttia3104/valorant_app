part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharacterLoadingState extends CharactersState {
  CharacterLoadingState();
}

class CharacterLoadedState extends CharactersState {
  List<CharacterModel> listCharacter;

  CharacterLoadedState({required this.listCharacter});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CharacterLoadedState &&
        other.listCharacter == listCharacter;
  }

  @override
  int get hashCode => listCharacter.hashCode;
}

class CharacterErrorState extends CharactersState {
  String errorMessage;

  CharacterErrorState({required this.errorMessage});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CharacterErrorState && other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => errorMessage.hashCode;
}

///ToDo : Equatable will help me to reduce upper code
///TODO : fromJson && toJson is best choice other than upper solution => list of character
/// IMP : all problems can be fixed if we handled models well ##
