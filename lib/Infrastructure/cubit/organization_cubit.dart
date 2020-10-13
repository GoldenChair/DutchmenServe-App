import 'package:bloc/bloc.dart';
import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/models/organizations.dart';
import 'package:equatable/equatable.dart';

part 'organization_state.dart';

class OrganizationCubit extends Cubit<OrganizationState> {
  OrganizationCubit({this.orgRepo}) : super(OrganizationInitial()) {
    getOrgs();
  }
  final FakeRepository orgRepo;
  void getOrgs() async {
    try {
      emit(LoadingState());
      final organizations = await orgRepo.getOrganizations();
      emit(LoadedState(organizations));
    } catch (e) {
      emit(ErrorState());
    }
  }

  void addOrg(Organization o1) async {
    try {
      //emit(LoadingState());
      await orgRepo.addOrganization(o1);
      //final organizations = await orgRepo.getOrganization();
      //emit(LoadedState(organizations));
    } catch (e) {
      // emit(ErrorState());
    }
  }

  void removeOrg(Organization o1) async {
    try {
      //emit(LoadingState());
      await orgRepo.removeOrganization(o1);
      //final organizations = await orgRepo.getOrganization();
      //emit(LoadedState(organizations));
    } catch (e) {
      // emit(ErrorState());
    }
  }
}
