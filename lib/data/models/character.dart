import 'package:valorant_app/data/models/ability.dart';
import 'package:valorant_app/data/models/role.dart';
import 'package:valorant_app/data/models/voice_line.dart';

class CharacterModel {
  String fullPortrait, displayName, description, displayIcon;
  List<AbilityModel> abilities;
  VoiceLineModel voiceLine;
  RoleModel roleModel;

  CharacterModel(
      {required this.fullPortrait,
      required this.displayName,
      required this.description,
      required this.displayIcon,
      required this.abilities,
      required this.voiceLine,
      required this.roleModel});
}

///Data -> List of Character Model
///Naming
///fromMap && toMap
