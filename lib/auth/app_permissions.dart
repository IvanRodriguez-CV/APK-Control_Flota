class AppPermissions {
  const AppPermissions._({
    required this.isAdministrator,
    required this.isOperator,
    required this.isSupervisor,
  });

  factory AppPermissions.fromUser({
    required Map<String, dynamic> user,
    required bool verifiedByApi,
  }) {
    final role = user['rol_nombre']?.toString().trim().toUpperCase();
    final isVerified = verifiedByApi;
    return AppPermissions._(
      isAdministrator: isVerified && role == 'ADMINISTRADOR',
      isOperator: isVerified && role == 'OPERADOR',
      isSupervisor: isVerified && role == 'SUPERVISOR',
    );
  }

  final bool isAdministrator;
  final bool isOperator;
  final bool isSupervisor;

  bool get canManageUnits => isAdministrator;
  bool get canManageDrivers => isAdministrator;
  bool get canManageTrips => isAdministrator;
  bool get canRegisterUnits => isAdministrator || isOperator;
  bool get canRegisterTrips => isAdministrator || isOperator;
  bool get canRegisterRefuels => isAdministrator || isOperator;
  bool get canRegisterLoads => isAdministrator || isOperator;
  bool get canRegisterMovements => isAdministrator || isOperator;
}
