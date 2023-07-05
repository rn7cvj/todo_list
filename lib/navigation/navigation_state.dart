class NavigationState {
  final bool? _unknown;
  final bool? _addTask;

  String? _editTaskId;

  String get editTaskId => _editTaskId ?? "-1";

  bool get isEditTask => _editTaskId != null;

  bool get isAddTask => _addTask == true;

  bool get isUnknown => _unknown == true;

  bool get isRoot => !isUnknown && !isAddTask && !isEditTask;

  NavigationState.root()
      : _unknown = false,
        _editTaskId = null,
        _addTask = false;

  NavigationState.createTask()
      : _unknown = false,
        _editTaskId = null,
        _addTask = true;

  NavigationState.editTask(this._editTaskId)
      : _unknown = false,
        _addTask = false;

  NavigationState.unknown()
      : _unknown = true,
        _addTask = false,
        _editTaskId = null;
}
