import 'package:dartz/dartz.dart';
import 'package:rapidrescue/data/model/auth/Create_User_Request.dart';
import 'package:rapidrescue/data/model/auth/Signin_User_Request.dart';
import 'package:rapidrescue/data/sources/auth/auth_firebase_service.dart';
import 'package:rapidrescue/domain/repositories/auth/auth_repo.dart';
import 'package:rapidrescue/injections.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signin(SigninUserRequest signinUserRequest) async{
    return await sl<AuthFirebaseService>().signin(signinUserRequest);
  }

  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async{
      return await sl<AuthFirebaseService>().signup(createUserRequest);
  }

}