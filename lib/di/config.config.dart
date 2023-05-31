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

import '../data/interacrtor/default_note_interactor.dart' as _i7;
import '../data/services/repository_service.dart' as _i4;
import '../domain/interactor/note_interactor.dart' as _i6;
import '../domain/service/notes_repository_service.dart' as _i3;
import '../generated/objectbox.g.dart' as _i5;
import '../ui/home/home_store.dart' as _i8;
import 'database_module.dart' as _i9;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final databaseModule = _$DatabaseModule();
  gh.lazySingleton<_i3.NotesRepositoryService>(() => _i4.RepositoryService());
  await gh.singletonAsync<_i5.Store>(
    () => databaseModule.store,
    preResolve: true,
  );
  gh.factory<_i6.NoteInteractor>(
      () => _i7.DefaultNoteInteractor(gh<_i3.NotesRepositoryService>()));
  gh.factory<_i8.HomeStore>(() => _i8.HomeStore(gh<_i6.NoteInteractor>()));
  return getIt;
}

class _$DatabaseModule extends _i9.DatabaseModule {}
