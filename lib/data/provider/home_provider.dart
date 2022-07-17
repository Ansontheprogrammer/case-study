import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lawn_buddy/data/case_study/company_data.dart';
import 'package:lawn_buddy/data/case_study/employee_data.dart';
import 'package:lawn_buddy/data/models/employee_model.dart';

import '../models/company_model.dart';

enum Name { first, last }

List<Employee> employees_data = employee_data.map((e) {
  Map<String, dynamic> companyData = company_data
      .where((element) => element['id'] == e['company_id'])
      .toList()[0];
  Company company = Company.fromJson(companyData);
  Employee employee = Employee.fromJson(e);
  employee.companyName = company.name;
  return employee;
}).toList();

class HomeProvider extends ChangeNotifier {
  String _selectedCompany = '';
  String get selectedCompany => _selectedCompany;
  String _selectedEmployee = '';
  String get selectedEmployee => _selectedCompany;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  void onTextChange(Name type) {
    if (type == Name.first) {
      employees = employees_data
          .where((element) =>
              element.first_name.toLowerCase().contains(firstName.text))
          .toList();
    } else {
      employees = employees_data
          .where((element) =>
              element.last_name.toLowerCase().contains(lastName.text))
          .toList();
    }
    notifyListeners();
  }

  List<Company> companies =
      company_data.map((e) => Company.fromJson(e)).toList();
  List<Employee> employees = employee_data.map((e) {
    Map<String, dynamic> companyData = company_data
        .where((element) => element['id'] == e['company_id'])
        .toList()[0];
    Company company = Company.fromJson(companyData);
    Employee employee = Employee.fromJson(e);
    employee.companyName = company.name;
    return employee;
  }).toList();
}
