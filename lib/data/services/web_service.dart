import 'package:http/http.dart' as http;
import 'package:valorant_app/constants/constants.dart';

class WebServices {
  Future<dynamic> getCharactersData() async {
    final response = await http.get(Uri.parse(apiUrl));
    return response;
  }
}
