import 'package:festiva_flutter/domain/model/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_dto.g.dart';

@JsonSerializable()
class EventDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'titulo')
  final String? titulo;

  @JsonKey(name: 'descrip')
  final String? descrip;

  @JsonKey(name: 'url_foto')
  final String? urlFoto;

  @JsonKey(name: 'fecha')
  final String? fecha;

  @JsonKey(name: 'hora')
  final String? hora;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  EventDto({
    required this.id,
    required this.titulo,
    required this.descrip,
    required this.urlFoto,
    required this.fecha,
    required this.hora,
    required this.createdAt,
  });

  factory EventDto.fromJson(Map<String, dynamic> json) =>
      _$EventDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EventDtoToJson(this);

  Event toDomain() {
    return Event(
      id: id ?? 0,
      titulo: titulo ?? '',
      descrip: descrip ?? '',
      urlFoto: urlFoto ?? '',
      fecha: fecha ?? '',
      hora: hora ?? '',
      createdAt: createdAt ?? '',
    );
  }
}
