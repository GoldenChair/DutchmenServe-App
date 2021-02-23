import 'package:bloc/bloc.dart';
import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/main.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  Repository _repository;

  UsersCubit() : super(UsersInitial()) {
    _repository = getIt<Repository>();
    getUsers();
  }

  void getUsers() async {
    try {
      emit(LoadingState());
      // final users = await _repository.getUsers();
      final users = [
        User(
          'Josh',
          'Miller',
          'cc01',
          'pw',
          id: 1,
          interests: [1, 2],
        ),
        User(
          'Charles',
          'Shoemaker',
          'cs35',
          'pw',
          id: 2,
          interests: [2, 5, 6, 7],
        ),
        User(
          'Carl',
          'Catt',
          'cc02',
          'pw',
          id: 3,
          interests: [1, 6],
        ),
        User(
          'Abigail',
          'Dickinson',
          'ad632',
          'pw',
          id: 4,
          interests: [3, 4],
        ),
        User(
          'June',
          'Huh',
          'jh56',
          'pw',
          id: 5,
          interests: [7, 8],
        ),
        User(
          'Nissa',
          'Siddon',
          'ns67',
          'pw',
          id: 6,
          interests: [5, 8],
        ),
      ];
      emit(LoadedState(users));
    } catch (e) {
      emit(ErrorState());
    }
  }

  void addUser(User u) async {
    try {
      emit(LoadingState());
      await _repository.addUser(u);
      // emit()
    } catch (e) {
      emit(ErrorState());
    }
  }
}
