import 'package:flutter_16/generated/objectbox.g.dart';
import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';

@module
abstract class DatabaseModule {
  @singleton
  @preResolve
  Future<Store> get store => openStore();
}
