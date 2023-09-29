import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

 static AuthCubit get(context) => BlocProvider.of(context);

  void login(String email, String password) {
    emit(LoadingLoginState());
    Future.delayed(Duration(seconds: 3)).then((value) {
      emit(SuccessLoginState());
    }).catchError((e) {
      print(e.toString());
      emit(ErrorLoginState());
    });
  }


}
