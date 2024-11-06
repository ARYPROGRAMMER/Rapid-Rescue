import 'package:dartz/dartz.dart';
import 'package:rapidrescue/core/usecases/usecase.dart';
import 'package:rapidrescue/data/model/auth/Create_User_Request.dart';
import 'package:rapidrescue/domain/repositories/auth/auth_repo.dart';
import 'package:rapidrescue/injections.dart';

class SignupUseCase implements Usecase<Either, CreateUserRequest>{
  @override
  Future<Either> call({CreateUserRequest? params}) {
    // TODO: implement call
      return sl<AuthRepository>().signup(params!);
  }

}