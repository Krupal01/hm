import 'package:bloc/bloc.dart';
import 'package:hotel_management/cubitstate/base_state.dart';
import 'package:meta/meta.dart';

import '../models/User.dart';
import '../repository/NetworkRepository.dart';

part '../cubitstate/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final NetworkRepository networkRepository;

  RegisterCubit(this.networkRepository) : super(RegisterInitial());

  Future<void> registerUser(User user) async {
    emit(BaseLoadingState());

    try {
      networkRepository
          .registerUser(user)
          .then((value) => emit(RegisterSuccess()));
    } catch (e) {
      emit(BaseErrorState(e.toString()));
    }
  }
}
