import 'dart:convert';
import '../../helper/sql/entity.dart';

class UserModel extends Entity {
  int? id;
  String? name;
  String? nick;
  String? passwd;
  String? email;
  double? sald;
  double? minim;

//<editor-fold desc="Data Methods">

  UserModel({
    this.id,
    this.name,
    this.nick,
    this.email,
    this.sald,
    this.minim,
    this.passwd
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          nick == other.nick &&
          minim == other.minim &&
          email == other.email &&
          passwd == other.passwd &&
          sald == other.sald);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      nick.hashCode ^
      minim.hashCode ^
      email.hashCode ^
      passwd.hashCode ^
      sald.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' id: $id,' +
        ' name: $name,' +
        ' nick: $nick,' +
        ' passwd $passwd'
        ' email: $email,' +
        ' sald: $sald,' +
        ' minim: $minim,' +
        '}';
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? nick,
    String? passwd,
    String? email,
    double? sald,
    double? minim,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      nick: nick ?? this.nick,
      email: email ?? this.email,
      sald: sald ?? this.sald,
      minim: minim ?? this.minim,
      passwd: passwd ?? this.passwd
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'nick': this.nick,
      'minim': this.minim,
      'email': this.email,
      'sald': this.sald,
      'passwd' : this.passwd
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      nick: json['nick'] as String,
      minim: json['minim'] as double,
      email: json['email'] as String,
      sald: json['sald'] as double,
      passwd: json['passwd'] as String,
    );
  }

  String toJson() => json.encode(toMap());

//</editor-fold>
}
