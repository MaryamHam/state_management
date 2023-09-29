import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/cubit/auth/cubit/auth_cubit.dart';
import 'package:state_management/cubit/main/main_cubit.dart';
import 'package:state_management/view/home_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MainCubit()),
          BlocProvider(create: (context) => AuthCubit()),
        ],
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            if (state is LightThemeState) {
              print("light");
            }
            if (state is DarkThemeState) {
              print("dark");
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
              theme: ThemeData.light(useMaterial3: true),
              darkTheme: ThemeData.dark(useMaterial3: true),
              themeMode: MainCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
            );
          },
        ));
    
    
    
    //  MaterialApp(
    //  debugShowCheckedModeBanner: false,
    //  home: HomeScreen(),

    // );
  }
}