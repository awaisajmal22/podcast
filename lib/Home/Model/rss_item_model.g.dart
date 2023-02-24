// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rss_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RssItemModelAdapter extends TypeAdapter<RssItemModel> {
  @override
  final int typeId = 1;

  @override
  RssItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RssItemModel(
      guid: fields[0] as String,
      url: fields[1] as String,
      title: fields[2] as String,
      href: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RssItemModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.guid)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.href);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RssItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
