part of global;
class Patient {
  String? id;
  String? name;
  String? gender;
  String? address;
  num? phone;
  int? weight;
  Timestamp? dateOfBirth;
  int? age;

  Patient({
    this.id,
    this.name,
    this.gender,
    this.address,
    this.phone,
    this.weight,
    this.dateOfBirth,
    this.age,
  });

  factory Patient.fromMap(Map<String, dynamic> data, String id) {
    return Patient(
      id: id,
      name: data['name'] as String?,
      address: data['address'] as String?,
      gender: data['gender'] as String?,
      phone: data['phone'] as num?,
      weight: data['weight'] as int?,
      dateOfBirth: data['dateofbirth'] as Timestamp?,
      age: data['age'] as int?,
    );
  }

  Patient copyWith({
    String? id,
    String? name,
    String? address,
    num? phone,
    int? weight,
    Timestamp? dateOfBirth,
    int? age,
  }) {
    return Patient(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      weight: weight ?? this.weight,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      age: age ?? this.age,
    );
  }
}
