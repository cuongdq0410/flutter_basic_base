# Flutter base App

## Getting Started

### Configuration Environment Running

- ANDROID STUDIO Step 1 : Open "Edit Configuration in Android Studio"

Step 2 : Create new Configuration with build flavor value is :

+ Develop Environment : development
+ Staging Environment : staging
+ Production Environment : production

- VS CODE

### These step need to run before can run app in code

- Multi-languages flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart

### Json parsing / serialization

This project is implementing [json_serializable](https://pub.dev/packages/json_serializable). It use
build_runner to generate files. If you make a change to these files, you need to re-run the
generator using build_runner:

```
flutter pub run build_runner build
```

generator using build_runner and remove conflict file :

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Injections

1. We are using `GetIt` for injections. It is fun because we can start the service locator and use
   it everywhere when needed because they are injected at top-level in main.dart.
2. Only use it upon initialization

```
injector.registerSingleton<LoginBloc>(LoginBloc(
    loginUseCase: LoginUseCase(getIt<LoginRepositoryImpl>()),
  ));
```

and use it on `route`

```
BlocProvider<LoginBloc>(
    create: (_) => getIt.get<LoginBloc>(),
),
```

for reusing the `BLoC`,

```
BlocProvider.value(
    value: injector.get<PumpsBloc>(),
)
```

for usage (in Widgets), **always** use

`context.boc<PumpsBloc>().add(AddPumps());`

instead of

`injector.get<PumpsBloc>().add(AppPumps());`

For non widget usage, manually inject the object on initialization.

## Terminal build APK or IPA

- run terminal build apk "flutter build apk --flavor development"
- run terminal build ios "flutter build ios --flavor development"
- "flutter build apk --flavor {flavorName}"

## How to change version number and version code :

- Go to pubspec.yaml => line version to change :
- Example : 1.0.10+3 => Version name : 1.0.10, Version code : 3

[warring]: in first time run `chmod +x sh_file_name` for add permission .sh file!

### Localization

We are using [Easy Localization](https://pub.dev/packages/easy_localization) to handle
multi-languages.

Google sheet sample on this project :
"https://docs.google.com/spreadsheets/d/1Xidh8daJWDe5s6Ar15tdgBy0oJBrr-KYZzv5_MyO_1E/edit?usp=sharing"

Step to set-up google sheet :

- 1 : Create a CSV Google Sheet with form like that form
  "https://docs.google.com/spreadsheets/d/1Xidh8daJWDe5s6Ar15tdgBy0oJBrr-KYZzv5_MyO_1E/edit#gid=0"
- 2 : Enable share for anyone have this link
- 3 : on file locale_keys.dart in lib/localization/locale_keys.dart change docId annotation with
  your google sheet docId Example of DocID is :
  "https://docs.google.com/spreadsheets/d/1Xidh8daJWDe5s6Ar15tdgBy0oJBrr-KYZzv5_MyO_1E (it's docId)
  /edit?usp=sharing"
- 4 : run terminal : "flutter pub run build_runner build" to generate .g.dart localization file
- 5 : When update new value on google sheet should update plus one version on SheetLocalization at
  locale_keys.dart and run "flutter packages pub run build_runner build" again to get new file csv

Step to use multi-languages import in code:

- Remember import file "localization_util.dart" instead of "locale_keys.dart" because first file
  already import library easy_localization extension,you no need to use 2 import

- Using : LocaleKeys.keyDefine.tr()  (tr() is using to change languages with current languages
  setup, remember have it)

Link library : https://pub.dev/packages/easy_localization
Link plugin generate csv from google
sheet : https://github.com/Hoang-Nguyenn/easy_localization_generator

### Change package name android
flutter pub run change_app_package_name:main com.new.package.name


