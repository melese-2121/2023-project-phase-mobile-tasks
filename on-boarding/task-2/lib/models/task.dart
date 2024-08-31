class Task {
  String _title;
  String _description;
  DateTime _dueDate;
  bool _isCompleted;

  Task(this._title, this._description, this._dueDate,
      {bool isCompleted = false})
      : _isCompleted = isCompleted;

  // Getters and setters
  String get title => _title;
  set title(String title) => _title = title;

  String get description => _description;
  set description(String description) => _description = description;

  DateTime get dueDate => _dueDate;
  set dueDate(DateTime dueDate) => _dueDate = dueDate;

  bool get isCompleted => _isCompleted;
  set isCompleted(bool isCompleted) => _isCompleted = isCompleted;
}
