import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  
  Future<Either> signup(CreateUserReq CreateUserReq);
  Future<void> signin();

}

class AuthFirebaseServicesImpl extends AuthFirebaseService {
  @override
  Future<void> signin() {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password
        );

        return const Right('SignUp Was Successful');

    } on FirebaseAuthException catch (e) {
      String message = '';

      if(e.code == 'weak-password') {
        message == "The Password Provided is too weak";
      } else if(e.code == 'email-already-in-use') {
        message == "An Account already exists with that email.";
      }
      return Left(message);
    }
  }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password
        );

        return const Right('SignUp Was Successful');

    } on FirebaseAuthException catch (e) {
      String message = '';

      if(e.code == 'weak-password') {
        message == "The Password Provided is too weak";
      } else if(e.code == 'email-already-in-use') {
        message == "An Account already exists with that email.";
      }
      return Left(message);
    }
  }
}