import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Repositiry/Api/Login_Api.dart';
import '../../Repositiry/Model_Class/Login_Model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginApi loginApi = LoginApi();
  late Loginmodel loginModel;


  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async{

      if (event is LoginButtonPressed) {
        emit(LoginLoading());
        try {
          loginModel = await loginApi.getLogin(event.email, event.password);
          emit(LoginSuccess(loginModel: loginModel));
        } catch (e) {
          print(e);
          emit(LoginFailure());
        }
      }
      // TODO: implement event handler
    });
  }
}
