import 'package:bloc/bloc.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:dutchmenserve/models/usersRepository.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit({this.userRepo}) : super(UsersInitial()) {
    //getUsers();
  }
  final userRepository userRepo;
  void getUsers() async {
    try {
      emit(LoadingState());
      final usersList = await userRepo.getUsers();
      emit(LoadedState(usersList));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
