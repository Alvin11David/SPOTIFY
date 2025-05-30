import 'package:cloud_firestore/cloud_firestore.dart' show FirebaseFirestore;
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart' show SigninUserReq;

abstract class AuthFirebaseService {
  
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);

}

class AuthFirebaseServicesImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password
      );

      return const Right('SignIn Was Successful');

    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = "No user found for that email";
      } else if (e.code == 'invalid-credentials') {
        message = "Wrong password provided for that user.";
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password
      );

      FirebaseFirestore.instance.collection('Users').add(
        {
          'name' : data.user?.displayName,
          'email' : data.user?.email
        }
      );
      return const Right('SignUp Was Successful');

    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = "The Password Provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        message = "An Account already exists with that email.";
      }
      return Left(message);
    }
  }
}