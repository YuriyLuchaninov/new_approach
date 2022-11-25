import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'model.freezed.dart';

part 'model.g.dart';

const _uuid = Uuid();

enum TaskStatus { active, done }

@freezed
class Task extends Equatable with _$Task {
  const Task._();

  @override
  List<Object?> get props => [id];

  @override
  bool get stringify => true;

  const factory Task({
    required String title,
    @Default(TaskStatus.active) TaskStatus status,
    @_UuidOrNullConverter() required String id,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);

  factory Task.create({
    required String title,
  }) =>
      Task.fromJson({
        'title': title,
      });
}

class _UuidOrNullConverter implements JsonConverter<String, String?> {
  const _UuidOrNullConverter();

  @override
  String fromJson(String? data) => data ?? _uuid.v4();

  @override
  String toJson(String data) => data;
}
