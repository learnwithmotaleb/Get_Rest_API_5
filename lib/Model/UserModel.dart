/// company : "TechCo Inc."
/// founded_year : 2000
/// employees : [{"id":1,"name":"John Doe","position":"CEO","departments":["Management","Finance"],"contact":{"email":"john.doe@techco.com","phone":"555-123-4567"}},{"id":2,"name":"Jane Smith","position":"CTO","departments":["Engineering"],"contact":{"email":"jane.smith@techco.com","phone":"555-987-6543"}},{"id":3,"name":"Bob Johnson","position":"CFO","departments":["Finance"],"contact":{"email":"bob.johnson@techco.com","phone":"555-555-5555"}}]
/// departments : [{"name":"Management","location":"Headquarters"},{"name":"Engineering","location":"Tech Hub"},{"name":"Finance","location":"Financial Center"}]

class UserModel {
  UserModel({
      String? company, 
      num? foundedYear, 
      List<Employees>? employees, 
      List<Departments>? departments,}){
    _company = company;
    _foundedYear = foundedYear;
    _employees = employees;
    _departments = departments;
}

  UserModel.fromJson(dynamic json) {
    _company = json['company'];
    _foundedYear = json['founded_year'];
    if (json['employees'] != null) {
      _employees = [];
      json['employees'].forEach((v) {
        _employees?.add(Employees.fromJson(v));
      });
    }
    if (json['departments'] != null) {
      _departments = [];
      json['departments'].forEach((v) {
        _departments?.add(Departments.fromJson(v));
      });
    }
  }
  String? _company;
  num? _foundedYear;
  List<Employees>? _employees;
  List<Departments>? _departments;
UserModel copyWith({  String? company,
  num? foundedYear,
  List<Employees>? employees,
  List<Departments>? departments,
}) => UserModel(  company: company ?? _company,
  foundedYear: foundedYear ?? _foundedYear,
  employees: employees ?? _employees,
  departments: departments ?? _departments,
);
  String? get company => _company;
  num? get foundedYear => _foundedYear;
  List<Employees>? get employees => _employees;
  List<Departments>? get departments => _departments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company'] = _company;
    map['founded_year'] = _foundedYear;
    if (_employees != null) {
      map['employees'] = _employees?.map((v) => v.toJson()).toList();
    }
    if (_departments != null) {
      map['departments'] = _departments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Management"
/// location : "Headquarters"

class Departments {
  Departments({
      String? name, 
      String? location,}){
    _name = name;
    _location = location;
}

  Departments.fromJson(dynamic json) {
    _name = json['name'];
    _location = json['location'];
  }
  String? _name;
  String? _location;
Departments copyWith({  String? name,
  String? location,
}) => Departments(  name: name ?? _name,
  location: location ?? _location,
);
  String? get name => _name;
  String? get location => _location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['location'] = _location;
    return map;
  }

}

/// id : 1
/// name : "John Doe"
/// position : "CEO"
/// departments : ["Management","Finance"]
/// contact : {"email":"john.doe@techco.com","phone":"555-123-4567"}

class Employees {
  Employees({
      num? id, 
      String? name, 
      String? position, 
      List<String>? departments, 
      Contact? contact,}){
    _id = id;
    _name = name;
    _position = position;
    _departments = departments;
    _contact = contact;
}

  Employees.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _position = json['position'];
    _departments = json['departments'] != null ? json['departments'].cast<String>() : [];
    _contact = json['contact'] != null ? Contact.fromJson(json['contact']) : null;
  }
  num? _id;
  String? _name;
  String? _position;
  List<String>? _departments;
  Contact? _contact;
Employees copyWith({  num? id,
  String? name,
  String? position,
  List<String>? departments,
  Contact? contact,
}) => Employees(  id: id ?? _id,
  name: name ?? _name,
  position: position ?? _position,
  departments: departments ?? _departments,
  contact: contact ?? _contact,
);
  num? get id => _id;
  String? get name => _name;
  String? get position => _position;
  List<String>? get departments => _departments;
  Contact? get contact => _contact;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['position'] = _position;
    map['departments'] = _departments;
    if (_contact != null) {
      map['contact'] = _contact?.toJson();
    }
    return map;
  }

}

/// email : "john.doe@techco.com"
/// phone : "555-123-4567"

class Contact {
  Contact({
      String? email, 
      String? phone,}){
    _email = email;
    _phone = phone;
}

  Contact.fromJson(dynamic json) {
    _email = json['email'];
    _phone = json['phone'];
  }
  String? _email;
  String? _phone;
Contact copyWith({  String? email,
  String? phone,
}) => Contact(  email: email ?? _email,
  phone: phone ?? _phone,
);
  String? get email => _email;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['phone'] = _phone;
    return map;
  }

}