class MyRepository {
  Future<List<String>> fetchData() async {
    // Simulate fetching data from an API or database
    await Future.delayed(Duration(seconds: 1));

    return ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  }
}
