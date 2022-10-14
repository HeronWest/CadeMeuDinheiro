import 'dart:convert';
import '../../helper/sql/entity.dart';

class MovimentModel extends Entity {
  int? id;
  int? user_id;
  int? responsible;
  String? descri;
  double? value;
  String? date;
  String? type;
  String? local;

//<editor-fold desc="Data Methods">

  MovimentModel(
      {this.id,
      this.user_id,
      this.responsible,
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
          user_id == other.user_id &&
          responsible == other.responsible &&
          descri == other.descri &&
          value == other.value &&
          date == other.date &&
          type == other.type &&
          local == other.local);

  @override
  int get hashCode =>
      id.hashCode ^
      user_id.hashCode ^
      responsible.hashCode ^
      descri.hashCode ^
      value.hashCode ^
      date.hashCode ^
      local.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'MovimentModel{' +
        ' id: $id,' +
        ' user_id: $user_id,' +
        ' responsible: $responsible,' +
        ' descri: $descri,' +
        ' value: $value,' +
        ' data: $date' +
        ' local: $local' +
        ' type: $type'
            '}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'user_id': this.user_id,
      'responsible': this.responsible,
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
        user_id: json['user_id'],
        responsible: json['responsible'],
        descri: json['descri'],
        value: json['value'],
        date: json['data'],
        local: json['local'],
        type: json['type']);
  }

  String toJson() => json.encode(toMap());

//</editor-fold>
}
