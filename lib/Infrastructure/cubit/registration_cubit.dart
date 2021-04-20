import 'package:dutchmenserve/Infrastructure/cubit/registration_state.dart';
import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/main.dart';
import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  Repository _repository;

  RegistrationCubit() : super(InitialState()) {
    _repository = getIt<Repository>();
  }


  void getRegisteredUsers(Event e) async {

  }
}
