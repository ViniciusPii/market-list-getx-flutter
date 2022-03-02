import 'package:firebase_auth/firebase_auth.dart';

import '/repositories/user/user_repository.dart';

import 'user_service.dart';

class UserServiceImpl implements UserService {
  UserServiceImpl({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Future<User?> login() => _userRepository.login();

  @override
  Future<void> signOut() => _userRepository.signOut();

  @override
  Future<void> updateDisplayName(String name) => _userRepository.updateDisplayName(name);
}
