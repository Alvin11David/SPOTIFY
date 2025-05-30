import 'package:dartz/dartz.dart' show Either;
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/repository/auth/auth.dart' show AuthRepository;
import 'package:spotify/service_locator.dart' show sl;

class SignupUseCase implements UseCase<Either,CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq ? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
