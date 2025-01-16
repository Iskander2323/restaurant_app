import 'dart:developer';

import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:restaurant_app/components/local_db/globals.dart';
import 'package:restaurant_app/components/placement/model/placement_model.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'local_db.g.dart';

class Placements extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}

@DriftDatabase(tables: [Placements])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  Future<void> addPlacements(List<PlacementModel> listPlacements) async {
    try {
      await database.batch((batch) {
        for (var placement in listPlacements) {
          batch.insert(
            placements,
            PlacementsCompanion(title: Value<String>(placement.placementName)),
          );
        }
      });
    } on Exception catch (e) {
      log(e.toString(), name: 'FROM INSERT PLACEMENTS');
    }
  }

  Future<List<PlacementModel>> fetchPlacement() async {
    var items = [];
    try {
      items = await select(placements).get();
    } on Exception catch (e) {
      log(e.toString());
    }
    final result = <PlacementModel>[];
    for (var item in items) {
      result.add(PlacementModel.fromLocal(item));
    }
    return result;
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
