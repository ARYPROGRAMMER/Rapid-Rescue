import 'package:get_it/get_it.dart';
import 'package:rapidrescue/data/repositories/auth/auth_repo_impl.dart';
import 'package:rapidrescue/data/sources/auth/auth_firebase_service.dart';
import 'package:rapidrescue/domain/repositories/auth/auth_repo.dart';
import 'package:rapidrescue/domain/usecases/auth/signin.dart';
import 'package:rapidrescue/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initialiseDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
}
