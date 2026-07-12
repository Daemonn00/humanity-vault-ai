/// The five states a single Vault Hub pack can be in, per the approved
/// Vault Hub v0.1 plan.
///
/// A pack only ever moves forward through this sequence. Any failure
/// while Downloading, Verifying, or Installing reverts the pack to
/// [available] with a transient error message rather than a persistent
/// failed state - there is deliberately no sixth "Failed" state, and no
/// pause/resume, per the approved scope.
enum PackLifecycleState {
  /// In the catalog, not installed. Default/rest state.
  available,

  /// The release ZIP transfer is in progress.
  downloading,

  /// The downloaded bytes' SHA-256 is being checked against the
  /// registry entry, before anything is written to permanent storage.
  verifying,

  /// The verified ZIP has been handed to the existing, unmodified
  /// PackImporter.
  installing,

  /// PackImporter reported success, re-confirmed by re-reading
  /// installed pack IDs rather than just trusted from memory.
  installed,
}
