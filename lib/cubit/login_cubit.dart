import 'package:bloc/bloc.dart';
import 'package:hotel_management/cubitstate/base_state.dart';
import 'package:meta/meta.dart';

import '../repository/NetworkRepository.dart';

part '../cubitstate/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final NetworkRepository networkRepository;

  LoginCubit(this.networkRepository) : super(LoginInitial());

  Future<void> login(String role, String mobileNumber, String password) async {
    emit(BaseLoadingState());
    try {
      networkRepository
          .login(role, mobileNumber, password)
          .then((value) => emit(LoginSuccess()));
    } catch (e) {
      emit(BaseErrorState(e.toString()));
    }
  }
}
