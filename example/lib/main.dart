// // ignore_for_file: cyclomatic_complexity
// class Example {
//   final _myList = <int>[1, 2, 3];
//
//   void main() {
//     final result = _myList is List<int>;
//     _myList.whereType<int>();
//     ['1', '2'].whereType<String?>();
//   }
// }
//
// ///
// class Animal {}
//
// ///
// class HomeAnimal extends Animal {}
//
// void main() {
//   final animal = Animal();
//
//   if (animal case HomeAnimal result) {}
//   if (animal case HomeAnimal()) {}
//
//   if (animal case Animal result) {} // LINT
//   if (animal case Animal()) {} // LINT
// }
