import 'dart:convert';
import '../../helper/sql/entity.dart';

class MovimentModel extends Entity {
  int? id;
  int? userID;
  String? descri;
  double? value;
  String? date;
  String? type;
  String? local;

//<editor-fold desc="Data Methods">

  MovimentModel(
      {this.id,
      this.userID,
      this.descri,
      this.value,
      this.date,
      this.type,
      this.local});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovimentModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userID == other.userID &&
          descri == other.descri &&
          value == other.value &&
          date == other.date &&
          type == other.type &&
          local == other.local);

  @override
  int get hashCode =>
      id.hashCode ^
      userID.hashCode ^
      descri.hashCode ^
      value.hashCode ^
      date.hashCode ^
      local.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' id: $id,' +
        ' userID: $userID,' +
        ' descri: $descri,' +
        ' value: $value,' +
        ' data: $date' +
        ' local: $local' +
        ' type: $type'
            '}';
  }

  MovimentModel copyWith({
    int? id,
    int? userID,
    String? descri,
    double? value,
    String? data,
    String? type,
    String? local,
  }) {
    return MovimentModel(
        id: id ?? this.id,
        userID: userID ?? this.userID,
        descri: descri ?? this.descri,
        value: value ?? this.value,
        date: data ?? this.date,
        local: data ?? this.local,
        type: type ?? this.type);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'userID': this.userID,
      'descri': this.descri,
      'value': this.value,
      'data': this.date,
      'type': this.type,
      'local': this.local
    };
  }

  factory MovimentModel.fromJson(Map<String, dynamic> json) {
    return MovimentModel(
        id: json['id'],
        userID: json['userID'],
        descri: json['descri'],
        value: json['value'],
        date: json['data'],
        local: json['local'],
        type: json['type']);
  }

  String toJson() => json.encode(toMap());

//</editor-fold>
}
