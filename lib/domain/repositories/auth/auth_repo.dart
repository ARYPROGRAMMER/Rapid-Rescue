import 'package:dartz/dartz.dart';
import 'package:rapidrescue/data/model/auth/Create_User_Request.dart';
import 'package:rapidrescue/data/model/auth/Signin_User_Request.dart';

abstract class AuthRepository{
  Future<Either> signup(CreateUserRequest createUserRequest);
  Future<Either> signin(SigninUserRequest signinUserRequest);
}