import 'package:equatable/equatable.dart';

/// Model representing an EVSE(charge point).
class Evse extends Equatable {
  /// ID of the EVSE.
  final String? evseId;

  /// Status of the charges.
  final Status? status;

  /// Connector type.
  final ConnectorType? connectorType;

  /// Power type
  final PowerType? powerType;

  /// Creates a new [Evse].
  const Evse({
    required this.evseId,
    required this.status,
    required this.connectorType,
    required this.powerType,
  });

  @override
  List<Object?> get props => [
        evseId,
        status,
        connectorType,
        powerType,
      ];
}

enum ConnectorType {
  CHADEMO,
  DOMESTIC_A,
  DOMESTIC_B,
  DOMESTIC_C,
  DOMESTIC_D,
  DOMESTIC_E,
  DOMESTIC_F,
  DOMESTIC_G,
  DOMESTIC_H,
  DOMESTIC_I,
  DOMESTIC_J,
  DOMESTIC_K,
  DOMESTIC_L,
  IEC_60309_2_single_16,
  IEC_60309_2_three_16,
  IEC_60309_2_three_32,
  IEC_62196_T1,
  IEC_62196_T2,
  IEC_62196_T1_COMBO,
  IEC_62196_T2_COMBO,
  TESLA_R,
  TESLA_S,
  UNKNOWN
}

enum PowerType { AC_1_PHASE, AC_3_PHASE, DC, UNKNOWN }

enum Status { AVAILABLE, CHARGING, UNKNOWN }
