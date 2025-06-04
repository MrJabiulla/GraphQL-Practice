import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static final HttpLink _httpLink = HttpLink('https://rickandmortyapi.com/graphql');

  static ValueNotifier<GraphQLClient> getClient() {
    return ValueNotifier(
      GraphQLClient(
        link: _httpLink,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );
  }
}