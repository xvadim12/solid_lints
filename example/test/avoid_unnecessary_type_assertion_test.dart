// ignore_for_file: cyclomatic_complexity
class Example {
  final _myList = <int>[1, 2, 3];

  void main() {
    // expect_lint: avoid_unnecessary_type_assertions
    _myList.whereType<int>();
    // expect_lint: avoid_unnecessary_type_assertions
    ['1', '2'].whereType<String?>();
  }
}

///
class Animal {}

///
class HomeAnimal extends Animal {}

void main() {
  final animal = Animal();

  if (animal case final HomeAnimal _) {}
  if (animal case HomeAnimal()) {}

  // expect_lint: avoid_unnecessary_type_assertions
  if (animal case final Animal result) {}
  // expect_lint: avoid_unnecessary_type_assertions
  if (animal case Animal()) {}
}
