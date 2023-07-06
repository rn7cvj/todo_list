class NavigationState {
  final bool? _unknown;
  final bool? _addTask;
  final bool? _settings;

  final bool? _internetError;
  final bool? _internetCheck;

  String? _editTaskId;

  String get editTaskId => _editTaskId ?? "-1";

  bool get isInternetError => _internetError == true;

  bool get isInternetCheck => _internetCheck == true;

  bool get isEditTask => _editTaskId != null;

  bool get isAddTask => _addTask == true;

  bool get isSettings => _settings == true;

  bool get isUnknown => _unknown == true;

  bool get isRoot => !isUnknown && !isAddTask && !isEditTask && !isInternetCheck && !isSettings && !isInternetError;

  NavigationState.internetCheck()
      : _unknown = false,
        _editTaskId = null,
        _settings = false,
        _internetCheck = true,
        _internetError = false,
        _addTask = false;

  NavigationState.internetError()
      : _unknown = false,
        _editTaskId = null,
        _settings = false,
        _internetCheck = false,
        _internetError = true,
        _addTask = false;

  NavigationState.root()
      : _unknown = false,
        _editTaskId = null,
        _settings = false,
        _internetCheck = false,
        _internetError = false,
        _addTask = false;

  NavigationState.createTask()
      : _unknown = false,
        _editTaskId = null,
        _settings = false,
        _internetCheck = false,
        _internetError = false,
        _addTask = true;

  NavigationState.editTask(this._editTaskId)
      : _unknown = false,
        _settings = false,
        _internetCheck = false,
        _internetError = false,
        _addTask = false;

  NavigationState.settings()
      : _unknown = false,
        _addTask = false,
        _settings = true,
        _internetCheck = false,
        _internetError = false,
        _editTaskId = null;

  NavigationState.unknown()
      : _unknown = true,
        _addTask = false,
        _settings = false,
        _internetCheck = false,
        _internetError = false,
        _editTaskId = null;
}
