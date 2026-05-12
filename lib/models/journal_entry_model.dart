class JournalEntryModel {
  final String id;

  final String title;

  final String content;

  final DateTime createdAt;

  const JournalEntryModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  JournalEntryModel copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? createdAt,
  }) {
    return JournalEntryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt:
          createdAt ?? this.createdAt,
    );
  }
}
