// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmarkData_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookmarkDataModelAdapter extends TypeAdapter<BookmarkDataModel> {
  @override
  final int typeId = 1;

  @override
  BookmarkDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookmarkDataModel(
      Imageurl: fields[0] as String?,
      title: fields[1] as String?,
      content: fields[2] as String?,
      description: fields[3] as String?,
      url: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookmarkDataModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.Imageurl)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookmarkDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
