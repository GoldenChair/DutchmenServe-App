part of 'organization_cubit.dart';

abstract class OrganizationState extends Equatable {
  // const OrganizationState();

  // @override
  // List<Object> get props => [];
}

class OrganizationInitial extends OrganizationState {
  @override
  List<Object> get props => [];
}

class OrgLoadingState extends OrganizationState {
  @override
  List<Object> get props => [];
}

class OrgLoadedState extends OrganizationState {
  OrgLoadedState(this.orgs);

  final List<Organization> orgs;

  @override
  List<Object> get props => [orgs];
}

class OrgErrorState extends OrganizationState {
  @override
  List<Object> get props => [];
}


