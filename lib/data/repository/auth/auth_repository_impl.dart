import 'package:either_dart/either.dart';
import 'package:spotify_app/data/models/auth/create_signin_request.dart';
import 'package:spotify_app/data/models/auth/create_user_request.dart';
import 'package:spotify_app/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app/domain/repository/auth/auth_repository.dart';
import 'package:spotify_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(
    SignInRequest signinRequest,
  ) async {
    return await serviceLocator<AuthFirebaseService>().signIn(
      signinRequest,
    );
  }

  @override
  Future<Either> signUp(CreateUserRequest createUserRequest) async {
    return await serviceLocator<AuthFirebaseService>()
        .signUp(createUserRequest);
  }
}
