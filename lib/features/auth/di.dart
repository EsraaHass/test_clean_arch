import 'package:get_it/get_it.dart';
import 'package:test_clean_architecture/features/auth/data/dataSource/auth_remote_dataSource.dart';
import 'package:test_clean_architecture/features/auth/data/repository/auth_repo_impl.dart';
import 'package:test_clean_architecture/features/auth/domain/repositories/repo.dart';
import 'package:test_clean_architecture/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:test_clean_architecture/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:test_clean_architecture/features/auth/view/bloc/auth_bloc.dart';

var sl = GetIt.instance;

Future<void> initAuth() async {
  //Blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl()));

  //UseCase
  sl.registerFactory<SignUpUseCase>(() => SignUpUseCase(sl()));
  sl.registerFactory<SignInUseCase>(() => SignInUseCase(sl()));

  //Repository
  sl.registerFactory<AuthRepo>(() => AuthRepoImple(sl()));

  //DataSource
  sl.registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
}
