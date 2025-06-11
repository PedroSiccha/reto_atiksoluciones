class SolicitudModel {
  final String codigo;
  final String tipo;
  final String fechaTipo;
  final String nombreEmpleado;
  final String codigoEmpleado;
  final String areaEmpleado;
  final String periodo;
  final String empresa;
  final String sucursal;
  final String solicitado;
  final String estado;

  const SolicitudModel({
    required this.codigo,
    required this.tipo,
    required this.fechaTipo,
    required this.nombreEmpleado,
    required this.codigoEmpleado,
    required this.areaEmpleado,
    required this.periodo,
    required this.empresa,
    required this.sucursal,
    required this.solicitado,
    required this.estado,
  });
}