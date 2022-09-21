import 'dart:convert';
import '../../helper/sql/entity.dart';

class MovimentModel extends Entity {
  int? id;
  int? userID;
  String? descri;
  double? sald;
  String? data;
  String? type;

//<editor-fold desc="Data Methods">

  MovimentModel({
    this.id,
    this.userID,
    this.descri,
    this.sald,
    this.data,
    this.type
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovimentModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userID == other.userID &&
          descri == other.descri &&
          sald == other.sald &&
          data == other.data &&
          type == other.type);

  @override
  int get hashCode =>
      id.hashCode ^
      userID.hashCode ^
      descri.hashCode ^
      sald.hashCode ^
      data.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' id: $id,' +
        ' nome: $userID,' +
        ' email: $descri,' +
        ' sald: $sald,' +
        ' data: $data' +
        ' type: $type'
        '}';
  }

  MovimentModel copyWith({
    int? id,
    int? userID,
    String? descri,
    double? sald,
    String? data,
    String? type,

  }) {
    return MovimentModel(
      id: id ?? this.id,
      userID: userID ?? this.userID,
      descri: descri ?? this.descri,
      sald: sald ?? this.sald,
      data: data ?? this.data,
      type: type ?? this.type
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.userID,
      'email': this.descri,
      'sald': this.sald,
      'data' : this.data,
      'type' : this.type
    };
  }

  factory MovimentModel.fromJson(Map<String, dynamic> json) {
    return MovimentModel(
      id: json['id'] as int,
      userID: json['name'] as int,
      descri: json['email'] as String,
      sald: json['sald'] as double,
      data: json['data'] as String,
      type: json['type'] as String
    );
  }

  String toJson() => json.encode(toMap());

//</editor-fold>
}
