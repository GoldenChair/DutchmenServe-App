import 'package:bloc/bloc.dart';
import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/models/organization.dart';
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

  void removeOrg(Organization o) async {
    try {
      //emit(LoadingState());
      await orgRepo.deleteOrganization(o);
      //final organizations = await orgRepo.getOrganization();
      //emit(LoadedState(organizations));
    } catch (e) {
      // emit(ErrorState());
    }
  }

  void editOrg(Organization o1,
      {String orgName,
      List users,
      List officers,
      String description,
      String email,
      String imagepath}) async {
    try {
      //emit(LoadingState());
      await orgRepo.updateOrganization(o1,
          orgName: orgName,
          users: users,
          officers: officers,
          description: description,
          email: email,
          imagepath: imagepath);
      //final organizations = await orgRepo.getOrganization();
      //emit(LoadedState(organizations));
    } catch (e) {
      // emit(ErrorState());
    }
  }
}
