import '../../repository/listscreen_repository.dart';

class MyService {
  final MyRepository repository;

  MyService(this.repository);

  Future<List<String>> fetchData() {
    return repository.fetchData();
  }
}
