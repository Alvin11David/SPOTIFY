import 'package:dartz/dartz.dart' show Either;
import 'package:spotify/data/models/auth/create_user_req.dart' show CreateUserReq;
import 'package:spotify/data/models/auth/signin_user_req.dart' show SigninUserReq;

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);
}