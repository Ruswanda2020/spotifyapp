import 'package:either_dart/either.dart';
import 'package:spotify_app/core/usecase/usecase.dart';
import 'package:spotify_app/data/models/auth/create_signin_request.dart';
import 'package:spotify_app/domain/repository/auth/auth_repository.dart';
import 'package:spotify_app/service_locator.dart';

class SignInUsecase implements Usecase<Either, SignInRequest> {
  @override
  Future<Either> call({SignInRequest? params}) {
    return serviceLocator<AuthRepository>().signIn(
      params!,
    );
  }
}
