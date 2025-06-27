// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppStruct extends BaseStruct {
  AppStruct({
    String? id,
  }) : _id = id;

  // "ID" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static AppStruct fromMap(Map<String, dynamic> data) => AppStruct(
        id: data['ID'] as String?,
      );

  static AppStruct? maybeFromMap(dynamic data) =>
      data is Map ? AppStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ID': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static AppStruct fromSerializableMap(Map<String, dynamic> data) => AppStruct(
        id: deserializeParam(
          data['ID'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AppStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

AppStruct createAppStruct({
  String? id,
}) =>
    AppStruct(
      id: id,
    );
