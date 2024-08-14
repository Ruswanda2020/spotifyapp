import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/data/models/auth/create_signin_request.dart';
import 'package:spotify_app/data/models/auth/create_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(
    SignInRequest signInRequest,
  );
  Future<Either> signUp(
    CreateUserRequest createUserRequest,
  );
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signIn(SignInRequest signInRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInRequest.email,
        password: signInRequest.password,
      );
      return const Right("Signin was Successful");
    } on FirebaseAuthException catch (e) {
      String message = " ";
      if (e.code == "invalid-email") {
        message = "not user found for that email";
      } else if (e.code == "invalid-credential") {
        message = "wrong password provided fot that user";
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signUp(
    CreateUserRequest createUserRequest,
  ) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserRequest.email,
        password: createUserRequest.password,
      );
      FirebaseFirestore.instance.collection("User").add({
        "name": createUserRequest.fullName,
        "email": data.user?.email,
      });
      return const Right("Signup was Successful");
    } on FirebaseAuthException catch (e) {
      String message = " ";
      if (e.code == "week-password") {
        message = "the password provided is too weak";
      } else if (e.code == "email-already-in-use") {
        message = "an account already exists with that email.";
      }
      return Left(message);
    }
  }
}
