import 'package:bloc/bloc.dart';
import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/main.dart';
import 'package:dutchmenserve/models/organization.dart';
import 'package:equatable/equatable.dart';

part 'organization_state.dart';

class OrganizationCubit extends Cubit<OrganizationState> {
  Repository _repository;

  OrganizationCubit() : super(OrganizationInitial()) {
    _repository = getIt<Repository>();
    getOrgs();
  }

  void getOrgs() async {
    try {
      emit(OrgLoadingState());
      final organizations = await _repository.getOrganizations();
      //TODO research what this line does
      // final activeOrgs = organizations.where((f) => f.deleted).toList();
      emit(OrgLoadedState(organizations));
    } catch (e) {
      emit(OrgErrorState());
    }
  }

  void addOrg(Organization o1) async {
    try {
      //emit(OrgLoadingState());
      await _repository.addOrganization(o1);
      //final organizations = await orgRepo.getOrganization();
      //emit(LoadedState(organizations));
    } catch (e) {
      // emit(OrgErrorState());
    }
  }

  void removeOrg(Organization o) async {
    try {
      //emit(OrgLoadingState());
      o.deleted = true;
      // await _repository.deleteOrganization(o);
      //final organizations = await orgRepo.getOrganization();
      //emit(LoadedState(organizations));
    } catch (e) {
      // emit(OrgErrorState());
    }
  }

  void updateOrg(Organization o) async {
    try {
      emit(OrgLoadingState());
      await _repository.updateOrganization(o);
      final organizations = await _repository.getOrganizations();
      emit(OrgLoadedState(organizations));
    } catch (e) {
      emit(OrgErrorState());
    }
  }

  // void editOrg(Organization o1,
  //     {String orgName,
  //     List users,
  //     List officers,
  //     String description,
  //     String email,
  //     String imagepath}) async {
  //   try {
  //     //emit(OrgLoadingState());
  //     await _repository.updateOrganization(o1);
  //     //final organizations = await orgRepo.getOrganization();
  //     //emit(LoadedState(organizations));
  //   } catch (e) {
  //     // emit(OrgErrorState());
  //   }
  // }
}
