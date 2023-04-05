import 'package:valorant_app/data/services/web_service.dart';

class Repository {
  final WebServices apiProvider;

  Repository({required this.apiProvider});

  Future<dynamic> getCharactersData() async {
    return apiProvider.getCharactersData();
  }
}
