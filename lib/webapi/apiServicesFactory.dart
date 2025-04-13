import 'package:racketgames/webapi/abstractAPI/baseMatchService.dart';
import 'package:racketgames/webapi/mockServices/mockMatchService.dart';

class ApiServiceFactory {
  static bool useMockApi = true; // Flag to toggle between Mock and Real API

  static BaseMatchService createMatchApiService() {
    if (useMockApi) {
      return MockMatchService(); // Return Mock API service
    }
    else {
      return MockMatchService(); // Return Real API service
    }
  }
}
