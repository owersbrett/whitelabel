import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth/auth.dart';
import 'bloc/user/user_bloc.dart';
import 'data/_repository.dart';
import 'service/auth_service.dart';
import 'service/mock/mock_auth_service.dart';
import 'widget/page/auth_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  const bool useMocks = true;
  runZoned<Future>(() async {
    runApp(const MyApp(useMocks: useMocks));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.useMocks}) : super(key: key);
  final bool useMocks;

  @override
  Widget build(BuildContext context) {
    IUserRepository userRepository = MockUserRepository();
    IAuthRepository authRepository = MockAuthRepository();
    IAuthTypeRepository authTypeRepository = MockAuthTypeRepository();
    IAuthService authService = MockAuthService(authRepository, userRepository, authTypeRepository);

    return AppWrapper(
      authRepository: authRepository,
      authTypeRepository: authTypeRepository,
      userRepository: userRepository,
      authService: authService,
    );
  }
}

class AppWrapper extends StatelessWidget {
  const AppWrapper({
    Key? key,
    required this.authRepository,
    required this.authTypeRepository,
    required this.userRepository,
    required this.authService,
  }) : super(key: key);
  final IAuthService authService;
  final IUserRepository userRepository;
  final IAuthTypeRepository authTypeRepository;
  final IAuthRepository authRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => userRepository),
        RepositoryProvider(create: (context) => authRepository),
        RepositoryProvider(create: (context) => authService),
        RepositoryProvider(create: (context) => authTypeRepository),
      ],
      child: WhitelabelApp(authService: authService, userRepository: userRepository),
    );
  }
}

class WhitelabelApp extends StatefulWidget {
  const WhitelabelApp({Key? key, required this.authService, required this.userRepository}) : super(key: key);
  final IAuthService authService;
  final IUserRepository userRepository;

  @override
  State<WhitelabelApp> createState() => _WhitelabelAppState();
}

class _WhitelabelAppState extends State<WhitelabelApp> {
  //blocs
  late UserBloc userBloc;
  late AuthBloc authBloc;
  @override
  void initState() {
    super.initState();
    userBloc = UserBloc(widget.userRepository);
    authBloc = AuthBloc(widget.authService, userBloc);
  }

  @override
  void dispose() {
    userBloc.close();
    authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => userBloc),
        BlocProvider(create: (context) => authBloc),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Whitelabel',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthPage(),
      ),
    );
  }
}
