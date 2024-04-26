import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mono/src/services/auth/auth_service.dart';
import 'package:mono/src/services/graphql/graphql_service.dart';

class GraphQLServiceHasura implements GraphQLService {
  GraphQLServiceHasura({
    required this.service,
  });
  final AuthService service;

  late GraphQLClient client;

  @override
  Future<void> init() async {
    final token = await service.userToken;

    final httpLink = HttpLink(
      'https://mono-paulosabra.hasura.app/v1/graphql',
    );

    final authLink = AuthLink(
      getToken: () async => 'Bearer $token',
    );

    final link = authLink.concat(httpLink);

    client = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
    );
  }

  @override
  GraphQLClient get getClient => client;
}
