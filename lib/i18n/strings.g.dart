/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 52 (26 per locale)
///
/// Built on 2023-07-06 at 02:22 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
  en(languageCode: 'en', build: _StringsEn.build),
  ru(languageCode: 'ru', build: _StringsRu.build);

  const AppLocale(
      {required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, _StringsEn> build;

  /// Gets current instance managed by [LocaleSettings].
  _StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
  Translations._(); // no constructor

  static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
  TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  _StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
  AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) =>
      instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
      : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, _StringsEn> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final _StringsEn _root = this; // ignore: unused_field

  // Translations
  late final _StringsAddtaskEn addtask = _StringsAddtaskEn._(_root);
  late final _StringsCommonEn common = _StringsCommonEn._(_root);
  late final _StringsErrorsEn errors = _StringsErrorsEn._(_root);
  late final _StringsHomeEn home = _StringsHomeEn._(_root);
  late final _StringsMessagesEn messages = _StringsMessagesEn._(_root);
  late final _StringsNointernetEn nointernet = _StringsNointernetEn._(_root);
  late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
  late final _StringsUnknownEn unknown = _StringsUnknownEn._(_root);
}

// Path: addtask
class _StringsAddtaskEn {
  _StringsAddtaskEn._(this._root);

  final _StringsEn _root; // ignore: unused_field

  // Translations
  String get what_to_do => 'What to do...';
  String get importance => 'Importance';
  String get importance_no => 'Not';
  String get importance_low => 'Low';
  String get importance_high => 'High';
  String get deadline => 'Deadline';
  String get select_deadline => 'Select deadline';
}

// Path: common
class _StringsCommonEn {
  _StringsCommonEn._(this._root);

  final _StringsEn _root; // ignore: unused_field

  // Translations
  String get add_new => 'New';
  String get delete => 'Delete';
  String get save => 'Save';
  String get edit => 'Edit';
  String get syncing => 'Syncing';
}

// Path: errors
class _StringsErrorsEn {
  _StringsErrorsEn._(this._root);

  final _StringsEn _root; // ignore: unused_field

  // Translations
  String get noIntenet => 'No internet connection';
  String get failServerConnetcion => 'The server is temporarily unavailable, data will be synchronized later';
}

// Path: home
class _StringsHomeEn {
  _StringsHomeEn._(this._root);

  final _StringsEn _root; // ignore: unused_field

  // Translations
  String get my_task => 'My task';
  String get complited => 'Complited';
  String get offline_mode => 'Offline';
}

// Path: messages
class _StringsMessagesEn {
  _StringsMessagesEn._(this._root);

  final _StringsEn _root; // ignore: unused_field

  // Translations
  String get connection_restore => 'Connection restored data was synced';
}

// Path: nointernet
class _StringsNointernetEn {
  _StringsNointernetEn._(this._root);

  final _StringsEn _root; // ignore: unused_field

  // Translations
  String get error_text => 'The server is temporarily unavailable, please check your internet connection';
  String get continue_offline => 'Continue offline';
  String get data_will_sync => 'You can continue working offline, the data will be synced the next time you connect';
}

// Path: settings
class _StringsSettingsEn {
  _StringsSettingsEn._(this._root);

  final _StringsEn _root; // ignore: unused_field

  // Translations
  String get title => 'Settings';
  String get use_local_storage => 'Use local storage';
  String get restart_required => 'Restart required';
}

// Path: unknown
class _StringsUnknownEn {
  _StringsUnknownEn._(this._root);

  final _StringsEn _root; // ignore: unused_field

  // Translations
  String get oops => 'There seems to be an error';
  String get back_to_home => 'Go back to the main page';
}

// Path: <root>
class _StringsRu implements _StringsEn {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
      : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.ru,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <ru>.
  @override
  final TranslationMetadata<AppLocale, _StringsEn> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  @override
  late final _StringsRu _root = this; // ignore: unused_field

  // Translations
  @override
  late final _StringsAddtaskRu addtask = _StringsAddtaskRu._(_root);
  @override
  late final _StringsCommonRu common = _StringsCommonRu._(_root);
  @override
  late final _StringsErrorsRu errors = _StringsErrorsRu._(_root);
  @override
  late final _StringsHomeRu home = _StringsHomeRu._(_root);
  @override
  late final _StringsMessagesRu messages = _StringsMessagesRu._(_root);
  @override
  late final _StringsNointernetRu nointernet = _StringsNointernetRu._(_root);
  @override
  late final _StringsSettingsRu settings = _StringsSettingsRu._(_root);
  @override
  late final _StringsUnknownRu unknown = _StringsUnknownRu._(_root);
}

// Path: addtask
class _StringsAddtaskRu implements _StringsAddtaskEn {
  _StringsAddtaskRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get what_to_do => 'Что надо сделать...';
  @override
  String get importance => 'Важность';
  @override
  String get importance_no => 'Нет';
  @override
  String get importance_low => 'Низкая';
  @override
  String get importance_high => 'Высокая';
  @override
  String get deadline => 'Сделать до';
  @override
  String get select_deadline => 'Выберите дату';
}

// Path: common
class _StringsCommonRu implements _StringsCommonEn {
  _StringsCommonRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get add_new => 'Новое';
  @override
  String get delete => 'Удалить';
  @override
  String get save => 'Сохранить';
  @override
  String get edit => 'Изменить';
  @override
  String get syncing => 'Cинхронизация';
}

// Path: errors
class _StringsErrorsRu implements _StringsErrorsEn {
  _StringsErrorsRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get noIntenet => 'Отсутствует подключение к интернету';
  @override
  String get failServerConnetcion => 'Сервер временно недоступен, данные будут синхронизированы позже';
}

// Path: home
class _StringsHomeRu implements _StringsHomeEn {
  _StringsHomeRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get my_task => 'Мои дела';
  @override
  String get complited => 'Выполненно';
  @override
  String get offline_mode => 'Локально';
}

// Path: messages
class _StringsMessagesRu implements _StringsMessagesEn {
  _StringsMessagesRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get connection_restore => 'Соединение восстановлено данные были синхронизированы';
}

// Path: nointernet
class _StringsNointernetRu implements _StringsNointernetEn {
  _StringsNointernetRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get error_text => 'Сервер временно недоступен, пороверьте подключение к инернету';
  @override
  String get continue_offline => 'Продолжить локально';
  @override
  String get data_will_sync =>
      'Вы можете продолжить работу локально, данные будут синхронизированы при последующем подключении';
}

// Path: settings
class _StringsSettingsRu implements _StringsSettingsEn {
  _StringsSettingsRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Настройки';
  @override
  String get use_local_storage => 'Использовать локальное хранилище';
  @override
  String get restart_required => 'Требуется перезапуск';
}

// Path: unknown
class _StringsUnknownRu implements _StringsUnknownEn {
  _StringsUnknownRu._(this._root);

  @override
  final _StringsRu _root; // ignore: unused_field

  // Translations
  @override
  String get oops => 'Кажется произошла ошибка';
  @override
  String get back_to_home => 'Вернуться на главную';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'addtask.what_to_do':
        return 'What to do...';
      case 'addtask.importance':
        return 'Importance';
      case 'addtask.importance_no':
        return 'Not';
      case 'addtask.importance_low':
        return 'Low';
      case 'addtask.importance_high':
        return 'High';
      case 'addtask.deadline':
        return 'Deadline';
      case 'addtask.select_deadline':
        return 'Select deadline';
      case 'common.add_new':
        return 'New';
      case 'common.delete':
        return 'Delete';
      case 'common.save':
        return 'Save';
      case 'common.edit':
        return 'Edit';
      case 'common.syncing':
        return 'Syncing';
      case 'errors.noIntenet':
        return 'No internet connection';
      case 'errors.failServerConnetcion':
        return 'The server is temporarily unavailable, data will be synchronized later';
      case 'home.my_task':
        return 'My task';
      case 'home.complited':
        return 'Complited';
      case 'home.offline_mode':
        return 'Offline';
      case 'messages.connection_restore':
        return 'Connection restored data was synced';
      case 'nointernet.error_text':
        return 'The server is temporarily unavailable, please check your internet connection';
      case 'nointernet.continue_offline':
        return 'Continue offline';
      case 'nointernet.data_will_sync':
        return 'You can continue working offline, the data will be synced the next time you connect';
      case 'settings.title':
        return 'Settings';
      case 'settings.use_local_storage':
        return 'Use local storage';
      case 'settings.restart_required':
        return 'Restart required';
      case 'unknown.oops':
        return 'There seems to be an error';
      case 'unknown.back_to_home':
        return 'Go back to the main page';
      default:
        return null;
    }
  }
}

extension on _StringsRu {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'addtask.what_to_do':
        return 'Что надо сделать...';
      case 'addtask.importance':
        return 'Важность';
      case 'addtask.importance_no':
        return 'Нет';
      case 'addtask.importance_low':
        return 'Низкая';
      case 'addtask.importance_high':
        return 'Высокая';
      case 'addtask.deadline':
        return 'Сделать до';
      case 'addtask.select_deadline':
        return 'Выберите дату';
      case 'common.add_new':
        return 'Новое';
      case 'common.delete':
        return 'Удалить';
      case 'common.save':
        return 'Сохранить';
      case 'common.edit':
        return 'Изменить';
      case 'common.syncing':
        return 'Cинхронизация';
      case 'errors.noIntenet':
        return 'Отсутствует подключение к интернету';
      case 'errors.failServerConnetcion':
        return 'Сервер временно недоступен, данные будут синхронизированы позже';
      case 'home.my_task':
        return 'Мои дела';
      case 'home.complited':
        return 'Выполненно';
      case 'home.offline_mode':
        return 'Локально';
      case 'messages.connection_restore':
        return 'Соединение восстановлено данные были синхронизированы';
      case 'nointernet.error_text':
        return 'Сервер временно недоступен, пороверьте подключение к инернету';
      case 'nointernet.continue_offline':
        return 'Продолжить локально';
      case 'nointernet.data_will_sync':
        return 'Вы можете продолжить работу локально, данные будут синхронизированы при последующем подключении';
      case 'settings.title':
        return 'Настройки';
      case 'settings.use_local_storage':
        return 'Использовать локальное хранилище';
      case 'settings.restart_required':
        return 'Требуется перезапуск';
      case 'unknown.oops':
        return 'Кажется произошла ошибка';
      case 'unknown.back_to_home':
        return 'Вернуться на главную';
      default:
        return null;
    }
  }
}
