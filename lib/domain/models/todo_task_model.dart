import 'package:json_annotation/json_annotation.dart';

part 'todo_task_model.g.dart';

enum Importance {
  low,
  basic,
  important;

  @override
  String toString() => switch (this) {
        Importance.low => 'Нет',
        Importance.basic => 'Низкий',
        Importance.important => '!! Высокий',
      };

  factory Importance.fromString(String str) {
    return switch (str) {
      'Низкий' => Importance.basic,
      '!! Высокий' => Importance.important,
      _ => Importance.low,
    };
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class TodoTaskModel {
  final String id;
  final String text;
  final Importance importance;
  @NullableEpochDateTimeConverter()
  final DateTime? deadline;
  final bool done;
  final String? color;
  @EpochDateTimeConverter()
  final DateTime createdAt;
  @EpochDateTimeConverter()
  final DateTime changedAt;
  final String lastUpdatedBy;

  TodoTaskModel({
    required this.id,
    required this.text,
    required this.importance,
    this.deadline,
    this.done = false,
    this.color,
    required this.createdAt,
    required this.changedAt,
    required this.lastUpdatedBy,
  });

  factory TodoTaskModel.fromJson(Map<String, dynamic> json) => _$TodoTaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoTaskModelToJson(this);

  TodoTaskModel copyWith({
    final String? text,
    final Importance? importance,
    final DateTime? deadline,
    final bool? done,
    final bool changeDeadline = false,
  }) {
    return TodoTaskModel(
      id: id,
      text: text ?? this.text,
      importance: importance ?? this.importance,
      deadline: changeDeadline ? deadline : this.deadline,
      done: done ?? this.done,
      createdAt: createdAt,
      changedAt: changedAt,
      lastUpdatedBy: lastUpdatedBy,
    );
  }
}

class EpochDateTimeConverter implements JsonConverter<DateTime, int> {
  const EpochDateTimeConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}

class NullableEpochDateTimeConverter implements JsonConverter<DateTime?, int?> {
  const NullableEpochDateTimeConverter();

  @override
  DateTime? fromJson(int? json) => json == null ? null : DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int? toJson(DateTime? object) => object?.millisecondsSinceEpoch;
}
