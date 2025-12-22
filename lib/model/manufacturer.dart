import 'package:freezed_annotation/freezed_annotation.dart';

part 'manufacturer.freezed.dart';
part 'manufacturer.g.dart';

@freezed
sealed class Manufacturer with _$Manufacturer {
  const factory Manufacturer({
    /**
     * Card manufacturer name.
     */
    required String name,
    /**
     * Timestamp of manufacturing.
     */
    required DateTime manufactureDate,
    /**
     * Signature of CardId with manufacturer’s private key. COS 1.21+
     */
    String? signature,
  }) = _Manufacturer;

  factory Manufacturer.fromJson(Map<String, dynamic> json) =>
      _$ManufacturerFromJson(json);
}
