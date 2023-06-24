import '../../services/google_service_class/google_screen_service.dart';

class GoogleAuthRepository{

  GoogleService googleService = GoogleService();

  Future<String?> googleAuthRepository() async{
    googleService.googleSignup();

  }

}