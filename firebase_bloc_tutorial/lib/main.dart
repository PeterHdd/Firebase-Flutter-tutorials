import 'package:firebase_bloc_tutorial/features/authentication/authentication_repository_impl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'app_bloc_observer.dart';
import 'features/authentication/bloc/authentication_bloc.dart';
import 'features/database/bloc/database_bloc.dart';
import 'features/database/database_repository_impl.dart';
import 'features/form-validation/bloc/form_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
    () => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(AuthenticationRepositoryImpl())
                ..add(AuthenticationStarted()),
        ),
        BlocProvider(
          create: (context) => FormBloc(
              AuthenticationRepositoryImpl(), DatabaseRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => DatabaseBloc(DatabaseRepositoryImpl()),
        )
      ],
      child: const App(),
    )),
    blocObserver: AppBlocObserver(),
  );
}
