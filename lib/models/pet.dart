class Pet {
  String? id;
  String name;
  String breed;
  String type;
  int age;
  String ownerName;
  double weight;

  Pet({
    required this.name,
    required this.breed,
    required this.type,
    required this.age,
    required this.ownerName,
    required this.weight,
  });

  Pet.withId({
    required this.id,
    required this.name,
    required this.breed,
    required this.type,
    required this.age,
    required this.ownerName,
    required this.weight,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'breed': breed,
        'type': type,
        'age': age,
        'ownerName': ownerName,
        'weight': weight,
      };

  Pet.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        breed = json['breed'],
        type = json['type'],
        age = json['age'],
        ownerName = json['ownerName'],
        weight = json['weight'];

  static List<Pet> listFromJson(Map<String, dynamic> json) {
    List<Pet> pets = [];
    json.forEach((key, value) {
      Map<String, dynamic> item = {'id': key, ...value};
      pets.add(Pet.fromJson(item));
    });
    return pets;
  }
}
