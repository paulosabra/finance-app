class AppQuery {
  AppQuery._();

  static const String kGetBalance = '''
  query getBalance {
    totalBalance: transaction_aggregate {
      aggregate {
        sum {
          value
        }
      }
    }
    income: transaction_aggregate(where: {value: {_gt: "0"}}) {
      aggregate {
        sum {
          value
        }
      }
    }
    expenses: transaction_aggregate(where: {value: {_lt: "0"}}) {
      aggregate {
        sum {
          value
        }
      }
    }
  }
  ''';

  static const String kGetAllTransactions = '''
  query getAllTransactions {
    transaction(order_by: {date: desc}) {
      category
      created_at
      date
      description
      id
      status
      user_id
      value
    }
  }
  ''';
}
