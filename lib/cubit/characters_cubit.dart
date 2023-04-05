import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_app/data/models/ability.dart';
import 'package:valorant_app/data/models/character.dart';
import 'package:valorant_app/data/models/role.dart';
import 'package:valorant_app/data/models/voice_line.dart';

import '../data/services/web_service.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.apiProvider) : super(CharactersInitial());

  final WebServices apiProvider;

  Future<List<CharacterModel>> requestCharactersData() async {
    try {
      final response = await apiProvider.getCharactersData();
      if (response == null) {
        return [];
      }
      final jsonDecoded = json.decode(response.body);
      final mainList = jsonDecoded['data'] as List<dynamic>;
      final list = mainList
          .map((e) {
            ///Role
            final role = e['role'] ?? {};
            final roleInfo = RoleModel(
                displayIcon: role['displayIcon'] ?? '',
                description: role['description'] ?? '',
                displayName: role['displayName'] ?? '',
                uuid: role['uuid'] ?? '');

            ///Ability
            final ability = e['abilities'] as List<dynamic>;
            final abilityInfo = ability.map((a) {
              return AbilityModel(
                  displayIcon: a['displayIcon'] ?? '',
                  slot: a['slot'] ?? '',
                  displayName: a['displayName'] ?? '',
                  description: a['description'] ?? '');
            }).toList();
            abilityInfo
                .retainWhere((element) => element.displayIcon.isNotEmpty);

            ///voiceLine
            final voiceLine = e['voiceLine'] ?? {};
            final voiceMediaList = voiceLine['mediaList'] as List;
            final voiceMedia =
                VoiceLineModel(voiceLine: voiceMediaList[0]['wave']);

            return CharacterModel(
              fullPortrait: e['fullPortrait'] ?? '',
              displayName: e['displayName'] ?? '',
              description: e['description'] ?? '',
              displayIcon: e['displayIcon'] ?? '',
              abilities: abilityInfo,
              voiceLine: voiceMedia,
              roleModel: roleInfo,
            );
          })
          .toSet()
          .toList();
      list.retainWhere((element) => element.fullPortrait.isNotEmpty);
      return list;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception(e.toString());
    }
  }

  Future<void> getCharacter() async {
    try {
      emit(CharacterLoadingState());
      final listOfLoadedCharacters = await requestCharactersData();
      emit(CharacterLoadedState(listCharacter: listOfLoadedCharacters));
    } catch (e) {
      emit(CharacterErrorState(errorMessage: e.toString()));
    }
  }
}

/// ToDo : List of Character Model...We Can Handel it When We Handel Models **
///ToDo :  Serialization && deserialization
