import 'package:cloud_firestore/cloud_firestore.dart';

class Userr {
  late String id;
  late String nom;
  late String prenom;
  late String email;
  late String motdepasse;

  Userr({
    this.id = '',
    required this.nom,
    required this.prenom,
    required this.email,
    required this.motdepasse,
  });

  static Userr fromJson(Map<String, dynamic> json) => Userr(
      id: json['id'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      motdepasse: json['mot de passe']);
}
