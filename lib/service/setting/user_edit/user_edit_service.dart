import 'package:tasuke_ai/repositories/firebase/firebase_user_repository.dart';
import 'package:tasuke_ai/service/auth/firebase_auth_service.dart';

class UserEditService {
  FirebaseUserRepository _firebaseUserRepository;
  FirebaseAuthService _firebaseAuthService;

  UserEditService() {
    _firebaseUserRepository = FirebaseUserRepository();
    _firebaseAuthService = FirebaseAuthService();
  }

  Future<Map<String, dynamic>> getSelf() async {
    return await _firebaseUserRepository.getSelf(uid: _firebaseAuthService.getAuthenticatedUser().uid);
  }
}
