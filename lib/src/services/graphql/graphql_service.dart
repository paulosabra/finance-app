import 'package:graphql_flutter/graphql_flutter.dart';

abstract class GraphQLService {
  Future<void> init();

  GraphQLClient get getClient;
}
