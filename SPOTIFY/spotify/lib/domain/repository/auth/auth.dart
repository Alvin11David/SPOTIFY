import 'package:spotify/data/models/auth/create_user_req.dart' show CreateUserReq;

abstract class AuthRepository {
  Future<void> signup(CreateUserReq createUserReq);

  Future<void> signin();
}