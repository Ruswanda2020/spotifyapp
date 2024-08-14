import 'package:either_dart/either.dart';
import 'package:spotify_app/data/models/auth/create_signin_request.dart';
import 'package:spotify_app/data/models/auth/create_user_request.dart';

abstract class AuthRepository {
  Future<Either> signIn(
    SignInRequest signinRequest,
  );
  Future<Either> signUp(
    CreateUserRequest createUserRequest,
  );
}
