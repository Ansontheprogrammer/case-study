class Company {
  int id;
  String name;
  String contact_last_name;
  String contact_first_name;
  String email;

  Company(
      {required this.id,
      required this.name,
      required this.contact_first_name,
      required this.contact_last_name,
      required this.email});
  Company.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        name = parsedJson['company_name'],
        contact_last_name = parsedJson['contact_last_name'],
        contact_first_name = parsedJson['contact_first_name'],
        email = parsedJson['email'];
}
