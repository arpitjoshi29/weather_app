import 'package:http/http.dart' as https;

const String apikey = '1445ae74f46464b37b0fb5f8ec44bf34';
const String openWeatherUrl =
    'http://api.openweathermap.org/data/2.5/weather?q';

class Check {
  Future<String> checkName(String name) async {
    https.Response response =
        await https.get('$openWeatherUrl=$name&appid=$apikey&units=metric');
    return response.statusCode == 200 ? 'true' : 'false';
  }
}
