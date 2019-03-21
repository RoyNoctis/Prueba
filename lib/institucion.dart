class Institucion
{
  String id_institucion;
  String nomInstitucion;
  String logoInstitucion;
  String nomCortoInstitucion;

  Institucion({
    this.id_institucion,
    this.nomInstitucion,
    this.logoInstitucion,
    this.nomCortoInstitucion});

  factory Institucion.fromJSON(Map<String,dynamic> json)
  {
    return Institucion(
      id_institucion: json['id_institucion'],
      nomInstitucion: json['institucion'],
      logoInstitucion: json['logotipo'],
      nomCortoInstitucion: json['nombre_corto']
    );
  }
}