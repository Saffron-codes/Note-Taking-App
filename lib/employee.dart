class Employee {
  final int id;
  final String name;
  final int age;
  final String field;

  Employee(
      {required this.id,
      required this.name,
      required this.age,
      required this.field});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'field':field
    };
  }
  @override
  String toString() {
    return 'Employee{id: $id, name: $name, age: $age}';
  }
}
