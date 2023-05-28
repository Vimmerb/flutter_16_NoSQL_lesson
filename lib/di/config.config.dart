// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/interacrtor/default_note_interactor.dart' as _i6;
import '../data/services/repository_service.dart' as _i4;
import '../domain/interactor/note_interactor.dart' as _i5;
import '../domain/service/notes_repository_service.dart' as _i3;
import '../ui/home/home_store.dart' as _i7;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.NotesRepositoryService>(() => _i4.RepositoryService());
  gh.factory<_i5.NoteInteractor>(
      () => _i6.DefaultNoteInteractor(gh<_i3.NotesRepositoryService>()));
  gh.factory<_i7.HomeStore>(() => _i7.HomeStore(gh<_i5.NoteInteractor>()));
  return getIt;
}
