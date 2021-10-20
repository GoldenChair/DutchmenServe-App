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
      emit(LoadingState());
      // final organizations = await _repository.getOrganizations();
      // final activeOrgs = organizations.where((f) => f.deleted).toList();

      final List<Organization> activeOrgs = [
        Organization(
            'Lebanon Valley Educational Partnership', 'B there or B square',
            id: 1,
            email: 'b@lvc.edu',
            officers: [1, 2, 3, 4, 5],
            members: [1, 2]),
        Organization('Colleges Against Cancer',
            'see me at Relay, this is a longer description',
            id: 2, email: 'c@lvc.edu', officers: [3], members: [3, 4, 5]),
        Organization('Alpha Phi Omega',
            'how fun fun fun we do so many fun things together with the brothers',
            id: 3,
            email: 'apo@lvc.edu',
            officers: [8],
            members: [6, 8, 9],
            imagepath: 'images/apo.jpeg'),
        Organization('AST', 'hello hi hi',
            id: 4, email: 'ast@lvc.edu', officers: [7], members: [7, 10, 12]),
        Organization('Gamma Sigma Sigma', 'xmas we organize the presents',
            id: 5, email: 'gs@lvc.edu', officers: [], members: [11, 12]),
      ];

      emit(LoadedState(activeOrgs));
    } catch (e) {
      emit(ErrorState());
    }
  }

  void addOrg(Organization o1) async {
    try {
      //emit(LoadingState());
      await _repository.addOrganization(o1);
      //final organizations = await orgRepo.getOrganization();
      //emit(LoadedState(organizations));
    } catch (e) {
      // emit(ErrorState());
    }
  }

  void removeOrg(Organization o) async {
    try {
      //emit(LoadingState());
      o.deleted = true;
      // await _repository.deleteOrganization(o);
      //final organizations = await orgRepo.getOrganization();
      //emit(LoadedState(organizations));
    } catch (e) {
      // emit(ErrorState());
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
  //     //emit(LoadingState());
  //     await _repository.updateOrganization(o1);
  //     //final organizations = await orgRepo.getOrganization();
  //     //emit(LoadedState(organizations));
  //   } catch (e) {
  //     // emit(ErrorState());
  //   }
  // }
}
