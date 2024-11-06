import 'package:bcrypt/bcrypt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rapidrescue/data/model/auth/Create_User_Request.dart';
import 'package:rapidrescue/data/model/auth/Signin_User_Request.dart';

abstract class AuthFirebaseService{
  Future<Either> signup (CreateUserRequest createUserRequest);
  Future<Either> signin (SigninUserRequest signinUserRequest);
}

class AuthFirebaseImpl extends AuthFirebaseService{


  @override
  Future<Either> signin(SigninUserRequest signinUserRequest) async{

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUserRequest.emailId,
          password: signinUserRequest.password);

      return const Right("Sign In Success");
    }
    on FirebaseAuthException catch (e){
      String message = "";

      if (e.code == "invalid-email") {
        message = "User Not Found";
      } else if (e.code == "invalid-credential") {
        message = "Wrong Password";
      }
      return Left(message);
    }


  }

  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async{

    try{
        var data = FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: createUserRequest.emailId,
            password: createUserRequest.password);
        
        FirebaseFirestore.instance.collection('Users')
        .add({
          'Name': createUserRequest.fullName,
          'Email_Id': createUserRequest.emailId,
          'Hashed_Password': BCrypt.hashpw(createUserRequest.password, BCrypt.gensalt()),
        });

        return const Right("Sign Up Success");
    }
    on FirebaseAuthException catch(e) {
      String message = "";

      if (e.code == "weak-password") {
        message = "The Password provided is too weak";
      } else if (e.code == "email-already-in-use") {
        message = "An account is already linked to this email";
      }
      return Left(message);
    }

  }

}