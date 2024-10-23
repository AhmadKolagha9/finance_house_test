import 'package:dio/dio.dart';
import 'package:finance_house_test/data/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/bloc/theme_bloc.dart';
import '../core/constant.dart';
import '../data/dio/dio_settings.dart';
import '../data/movie_repository.dart';
import '../data/prefs.dart';


final  sl= GetIt.instance;

Future iniGetIt() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => ((Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "charset": "utf-8",
        "Accept-Charset": "utf-8"
      },
      responseType: ResponseType.plain)))));
  sl.registerLazySingleton(() => (sharedPreferences));
  sl.registerLazySingleton<DioSetting>(() => DioSetting(sl()));
  sl.registerLazySingleton<ApiService>(() => ApiService(sl()));
  sl.registerLazySingleton<Prefs>(() => Prefs(sl()));
  sl.registerLazySingleton<MovieRepository>(() => MovieRepository(sl()));
  sl.registerLazySingleton<ThemeBloc>(() => ThemeBloc(sl()));

}