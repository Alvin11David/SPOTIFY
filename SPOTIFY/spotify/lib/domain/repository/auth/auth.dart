import 'package:dartz/dartz.dart' show Either;
import 'package:spotify/data/models/auth/create_user_req.dart' show CreateUserReq;

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<void> signin();
}