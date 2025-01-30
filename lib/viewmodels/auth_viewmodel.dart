import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  Future<bool> signInWithGoogle() async {
    _isLoading = true;
    notifyListeners();

    try {
      final userCredential = await _authService.signInWithGoogle();
      if (userCredential?.user != null) {
        _user = UserModel.fromFirebase(userCredential!.user!);
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print('Error in viewmodel: $e');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }

  void listenToAuthChanges() {
    _authService.authStateChanges.listen((user) {
      if (user != null) {
        _user = UserModel.fromFirebase(user);
      } else {
        _user = null;
      }
      notifyListeners();
    });
  }
}