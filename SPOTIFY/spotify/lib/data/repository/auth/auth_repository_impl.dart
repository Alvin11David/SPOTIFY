import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user_req.dart' show CreateUserReq;
import 'package:spotify/data/models/auth/signin_user_req.dart' show SigninUserReq;
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart' show sl;

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }
 
  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }
}