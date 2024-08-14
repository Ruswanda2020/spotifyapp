import 'package:either_dart/either.dart';
import 'package:spotify_app/core/usecase/usecase.dart';
import 'package:spotify_app/data/models/auth/create_user_request.dart';
import 'package:spotify_app/domain/repository/auth/auth_repository.dart';
import 'package:spotify_app/service_locator.dart';

class SignUpUsecase implements Usecase<Either, CreateUserRequest> {
  @override
  Future<Either> call({CreateUserRequest? params}) {
    return serviceLocator<AuthRepository>().signUp(params!);
  }
}
