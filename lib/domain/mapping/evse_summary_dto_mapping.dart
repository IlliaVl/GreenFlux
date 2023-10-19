import '../../data/dtos/evse_summary_dto.dart';
import '../models/evse.dart';

/// Extension that provides mappings for [EvseSummaryDTO].
extension EvseSummaryDTOMapping on EvseSummaryDTO {
  /// Maps into a [Evse].
  // TODO: Handle exception for `byName` when there is no enum with the value
  Evse toEvse() => Evse(
        evseId: evseId,
        status: status == null ? null : Status.values.byName(status!),
        connectorType: connectorType == null
            ? null
            : ConnectorType.values.byName(connectorType!),
        powerType:
            powerType == null ? null : PowerType.values.byName(powerType!),
      );
}
