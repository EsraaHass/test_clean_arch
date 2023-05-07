import 'package:get_it/get_it.dart';
import 'package:test_clean_architecture/features/auth/data/dataSource/auth_remote_dataSource.dart';
import 'package:test_clean_architecture/features/auth/data/repository/auth_repo_impl.dart';
import 'package:test_clean_architecture/features/auth/domain/repositories/repo.dart';
import 'package:test_clean_architecture/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:test_clean_architecture/features/auth/view/bloc/sign_up_bloc.dart';

var sl = GetIt.instance;

Future<void> initAuth() async {
  //Blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));

  //UseCase
  sl.registerFactory<SignUpUseCase>(() => SignUpUseCase(sl()));

  //Repository
  sl.registerFactory<AuthRepo>(() => AuthRepoImple(sl()));

  //DataSource
  sl.registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
}
