class Fournisseur {
  final int id;
  final String name;
  final String adress;
  final String contact;
  String? imgurl;

  Fournisseur(
      {required this.id,
      required this.name,
      required this.adress,
      required this.contact,
      this.imgurl});
}
