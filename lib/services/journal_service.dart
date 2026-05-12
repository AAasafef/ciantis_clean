import '../models/journal_entry_model.dart';

class JournalService {
  static final JournalService instance =
      JournalService._internal();

  JournalService._internal();

  final List<JournalEntryModel>
      _entries = [

    JournalEntryModel(
      id: '1',
      title: 'Feeling Focused',
      content:
          'Today felt productive and calm. I stayed organized and clear-headed.',
      createdAt: DateTime.now(),
    ),

    JournalEntryModel(
      id: '2',
      title: 'Dream Life Vision',
      content:
          'I want my future home to feel peaceful, luxurious, and healing.',
      createdAt: DateTime.now(),
    ),
  ];

  List<JournalEntryModel>
      getEntries() {
    return _entries;
  }

  void addEntry(
    JournalEntryModel entry,
  ) {
    _entries.insert(0, entry);
  }

  void deleteEntry(
    String id,
  ) {
    _entries.removeWhere(
      (entry) => entry.id == id,
    );
  }
}
