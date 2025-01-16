// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// ignore_for_file: type=lint
class $PlacementsTable extends Placements
    with TableInfo<$PlacementsTable, Placement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlacementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'placements';
  @override
  VerificationContext validateIntegrity(Insertable<Placement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Placement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Placement(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $PlacementsTable createAlias(String alias) {
    return $PlacementsTable(attachedDatabase, alias);
  }
}

class Placement extends DataClass implements Insertable<Placement> {
  final int id;
  final String title;
  const Placement({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  PlacementsCompanion toCompanion(bool nullToAbsent) {
    return PlacementsCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory Placement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Placement(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  Placement copyWith({int? id, String? title}) => Placement(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  Placement copyWithCompanion(PlacementsCompanion data) {
    return Placement(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Placement(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Placement && other.id == this.id && other.title == this.title);
}

class PlacementsCompanion extends UpdateCompanion<Placement> {
  final Value<int> id;
  final Value<String> title;
  const PlacementsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  PlacementsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<Placement> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  PlacementsCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return PlacementsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlacementsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlacementsTable placements = $PlacementsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [placements];
}

typedef $$PlacementsTableCreateCompanionBuilder = PlacementsCompanion Function({
  Value<int> id,
  required String title,
});
typedef $$PlacementsTableUpdateCompanionBuilder = PlacementsCompanion Function({
  Value<int> id,
  Value<String> title,
});

class $$PlacementsTableFilterComposer
    extends Composer<_$AppDatabase, $PlacementsTable> {
  $$PlacementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));
}

class $$PlacementsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlacementsTable> {
  $$PlacementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));
}

class $$PlacementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlacementsTable> {
  $$PlacementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);
}

class $$PlacementsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlacementsTable,
    Placement,
    $$PlacementsTableFilterComposer,
    $$PlacementsTableOrderingComposer,
    $$PlacementsTableAnnotationComposer,
    $$PlacementsTableCreateCompanionBuilder,
    $$PlacementsTableUpdateCompanionBuilder,
    (Placement, BaseReferences<_$AppDatabase, $PlacementsTable, Placement>),
    Placement,
    PrefetchHooks Function()> {
  $$PlacementsTableTableManager(_$AppDatabase db, $PlacementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlacementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlacementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlacementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
          }) =>
              PlacementsCompanion(
            id: id,
            title: title,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
          }) =>
              PlacementsCompanion.insert(
            id: id,
            title: title,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PlacementsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlacementsTable,
    Placement,
    $$PlacementsTableFilterComposer,
    $$PlacementsTableOrderingComposer,
    $$PlacementsTableAnnotationComposer,
    $$PlacementsTableCreateCompanionBuilder,
    $$PlacementsTableUpdateCompanionBuilder,
    (Placement, BaseReferences<_$AppDatabase, $PlacementsTable, Placement>),
    Placement,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlacementsTableTableManager get placements =>
      $$PlacementsTableTableManager(_db, _db.placements);
}
