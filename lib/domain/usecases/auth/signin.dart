import 'package:dartz/dartz.dart';
import 'package:rapidrescue/core/usecases/usecase.dart';
import 'package:rapidrescue/data/model/auth/Signin_User_Request.dart';
import 'package:rapidrescue/domain/repositories/auth/auth_repo.dart';
import 'package:rapidrescue/injections.dart';

class SigninUseCase implements Usecase<Either, SigninUserRequest>{
  @override
  Future<Either> call({SigninUserRequest? params}) {
    return sl<AuthRepository>().signin(params!);
  }
}