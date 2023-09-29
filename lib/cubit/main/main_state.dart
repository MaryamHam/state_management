part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

class DarkThemeState extends MainState {}

class LightThemeState extends MainState {}