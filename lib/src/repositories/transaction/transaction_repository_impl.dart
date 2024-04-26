import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mono/src/constants/query.dart';
import 'package:mono/src/locator.dart';
import 'package:mono/src/model/balance_model.dart';
import 'package:mono/src/model/transaction_model.dart';
import 'package:mono/src/repositories/transaction/transaction_repository.dart';
import 'package:mono/src/services/graphql/graphql_service.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final client = getIt.get<GraphQLService>().getClient;

  @override
  Future<BalanceModel> getBalance() async {
    try {
      final response = await client.query(
        QueryOptions(document: gql(AppQuery.kGetBalance)),
      );

      final data = response.data ?? {};
      return BalanceModel.fromMap(data);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<Transactions> getAllTransactions() async {
    try {
      final response = await client.query(
        QueryOptions(document: gql(AppQuery.kGetAllTransactions)),
      );

      final data = response.data?['transaction'] as List;
      return data.map(
        (item) {
          return TransactionModel.fromJson(item as Map<String, dynamic>);
        },
      ).toList();
    } catch (error) {
      rethrow;
    }
  }
}
