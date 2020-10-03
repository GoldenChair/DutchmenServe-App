import 'package:bloc/bloc.dart';
import 'package:dutchmenserve/models/organizations.dart';
import 'package:dutchmenserve/models/organizationsRepository.dart';
import 'package:equatable/equatable.dart';

part 'organization_state.dart';

class OrganizationCubit extends Cubit<OrganizationState> {
  OrganizationCubit({this.orgRepo}) : super(OrganizationInitial()) {
    getOrgs();
  }
  final OrganizationRepository orgRepo;
  void getOrgs() async {
    try {
      emit(LoadingState());
      final organizations = await orgRepo.getOrganization();
      emit(LoadedState(organizations));
    } catch (e) {
      emit(ErrorState());
    }
  }
 
}
