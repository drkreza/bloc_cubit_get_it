import 'dart:convert';

import 'package:equatable/equatable.dart';

class MyModel extends Equatable {
  final String name;
  final int age;
  const MyModel({
    required this.name,
    required this.age,
  });

  @override
  List<Object> get props => [name, age];

  MyModel copyWith({
    String? name,
    int? age,
  }) {
    return MyModel(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'age': age});
  
    return result;
  }

  factory MyModel.fromMap(Map<String, dynamic> map) {
    return MyModel(
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyModel.fromJson(String source) => MyModel.fromMap(json.decode(source));

  @override
  String toString() => 'MyModel(name: $name, age: $age)';
}
