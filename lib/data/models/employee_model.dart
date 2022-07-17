class Employee {
  int id;
  String first_name;
  String last_name;
  String email;
  int company_id;
  String? companyName;
  String avatar;
  Employee(
      {required this.id,
      required this.first_name,
      required this.last_name,
      required this.avatar,
      this.companyName,
      required this.company_id,
      required this.email});
  Employee.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        first_name = parsedJson['first_name'],
        avatar = parsedJson['avatar'],
        last_name = parsedJson['last_name'],
        company_id = parsedJson['company_id'],
        email = parsedJson['email'];
}
