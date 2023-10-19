/// Data transfer object that represents a EVSE summary.
class EvseSummaryDTO {
  /// ID of the EVSE.
  final String? evseId;

  /// Status of the charges.
  final String? status;

  /// Connector type.
  final String? connectorType;

  /// Power type
  final String? powerType;

  /// Creates a new [EvseSummaryDTO].
  EvseSummaryDTO({
    required this.evseId,
    required this.status,
    required this.connectorType,
    required this.powerType,
  });

  /// Creates a [EvseSummaryDTO] from a json.
  factory EvseSummaryDTO.fromJson(Map<String, dynamic> json) => EvseSummaryDTO(
        evseId: json['evseId'],
        status: json['status'],
        connectorType: json['connectorType'],
        powerType: json['powerType'],
      );

  /// Creates a [EvseSummaryDTO]s from a list of json maps.
  static List<EvseSummaryDTO> fromJsonList(List<Map<String, dynamic>> json) =>
      json.map(EvseSummaryDTO.fromJson).toList();
}
