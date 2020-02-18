class Usuarios {
  List<Usuario> usuarios = new List();

  Usuarios();

  Usuarios.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final usuario = new Usuario.fromJsonMap(item);
      usuarios.add(usuario);
    }
  }
}

class Usuario {
  String idUsuario;
  String emailUsuario;
  String nombreUsuario;
  String apellidoUsuario;
  String perfil;
  String code;
  String skin;
  bool login;
  int idInstitucion;
  String idPeriodoAcademicoActivo;

  Usuario({
    this.idUsuario,
    this.emailUsuario,
    this.nombreUsuario,
    this.apellidoUsuario,
    this.perfil,
    this.code,
    this.skin,
    this.login,
    this.idInstitucion,
    this.idPeriodoAcademicoActivo,
  });

  Usuario.fromJsonMap(Map<String, dynamic> json) {
    this.idUsuario = json['idUsuario'];
    this.emailUsuario = json['emailUsuario'];
    this.nombreUsuario = json['nombreUsuario'];
    this.apellidoUsuario = json['apellidoUsuario'];
    this.perfil = json['perfil'];
    this.code = json['code'];
    this.skin = json['skin'];
    this.login = json['login'];
    this.idInstitucion = json['idInstitucion'];
    this.idPeriodoAcademicoActivo = json['idPeriodoAcademicoActivo'];
  }
}
