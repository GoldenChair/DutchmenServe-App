import 'package:dutchmenserve/models/organizations.dart';

class OrganizationRepository {
  // EventsRepository(this.client);

  // final Dio client;

  Future<List<Organization>> getOrganization() async {
    try {

      final org = [
        Organization(
          orgName: 'Alpha Phi Omega',
          orgID: 1,
          usersIDs: [1, 2, 3],
          officers: [54, 60],
        ),
        Organization(
          orgName: 'B',
          orgID: 2,
          usersIDs: [1, 2, 3],
          officers: [54, 60],
        ),
        Organization(
          orgName: 'C',
          orgID: 3,
          usersIDs: [1, 2, 3],
          officers: [54, 60],
        ),
      ];
      return org;
    } catch (e) {
      throw e;
    }
  }
}
