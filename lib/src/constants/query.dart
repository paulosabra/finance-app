class AppQuery {
  AppQuery._();

  static const String kGetAllTransactions = '''
  query getAllTransactions {
    transaction {
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
