
import '../Data/Network/api_services.dart';
import '../Resources/APPUrl/app_url.dart';

class HomeRepositry {
  static Future<dynamic> hitApi() async {
    var response = await ApiServices().getApi(AppUrl.url);
    return response;
  }
}

