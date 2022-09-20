import 'dart:convert';
import '../../helper/sql/entity.dart';

class UserModel extends Entity{
  int? id;
  String? name;
  String? email;
  String? sald;
  String? minim;

//<editor-fold desc="Data Methods">

  UserModel({
    this.id,
    this.name,
    this.email,
    this.sald,
    this.minim,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          minim == other.minim &&
          email == other.email &&
          sald == other.sald);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      minim.hashCode ^
      email.hashCode ^
      sald.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' id: $id,' +
        ' nome: $name,' +
        ' email: $email,' +
        ' sald: $sald,' +
        ' minim: $minim,' +
        '}';
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? sald,
    String? minim,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      sald: sald ?? this.sald,
      minim: minim ?? this.minim,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'minim': this.minim,
      'email': this.email,
      'sald': this.sald,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      minim: json['minim'] as String,
      email: json['email'] as String,
      sald: json['sald'] as String,
    );
  }

  String toJson() => json.encode(toMap());

//</editor-fold>
}