// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultAdapter extends TypeAdapter<Result> {
  @override
  final int typeId = 0;

  @override
  Result read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Result(
      id: fields[0] as int,
      name: fields[1] as String,
      slug: fields[2] as String,
      category: fields[3] as dynamic,
      description: fields[4] as String,
      price: fields[5] as int,
      currency: fields[6] as String,
      publishedAt: fields[7] as DateTime,
      address: fields[8] as Address,
      seller: fields[9] as Seller,
      photos: (fields[10] as List).cast<String>(),
      extra: fields[11] as Extra,
    );
  }

  @override
  void write(BinaryWriter writer, Result obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.currency)
      ..writeByte(7)
      ..write(obj.publishedAt)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.seller)
      ..writeByte(10)
      ..write(obj.photos)
      ..writeByte(11)
      ..write(obj.extra);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 1;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      district: fields[0] as District,
      name: fields[1] as String,
      lat: fields[2] as double,
      long: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.district)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.lat)
      ..writeByte(3)
      ..write(obj.long);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DistrictAdapter extends TypeAdapter<District> {
  @override
  final int typeId = 2;

  @override
  District read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return District(
      id: fields[0] as int,
      name: fields[1] as String,
      region: fields[2] as Region,
    );
  }

  @override
  void write(BinaryWriter writer, District obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.region);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DistrictAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RegionAdapter extends TypeAdapter<Region> {
  @override
  final int typeId = 3;

  @override
  Region read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Region(
      id: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Region obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 4;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      id: fields[0] as int,
      name: fields[1] as String,
      adsCount: fields[2] as int,
      icon: fields[3] as String,
      parentCategory: fields[4] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.adsCount)
      ..writeByte(3)
      ..write(obj.icon)
      ..writeByte(4)
      ..write(obj.parentCategory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExtraAdapter extends TypeAdapter<Extra> {
  @override
  final int typeId = 5;

  @override
  Extra read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Extra(
      isMine: fields[0] as bool,
      status: fields[1] as String,
      expiresAt: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Extra obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isMine)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.expiresAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExtraAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SellerAdapter extends TypeAdapter<Seller> {
  @override
  final int typeId = 6;

  @override
  Seller read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Seller(
      id: fields[0] as int,
      fullName: fields[1] as String,
      profilePhoto: fields[2] as String,
      phoneNumber: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Seller obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.profilePhoto)
      ..writeByte(3)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SellerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
