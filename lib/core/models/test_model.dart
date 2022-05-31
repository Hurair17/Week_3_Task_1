class TestModel {
  String? id;
  String? name;
  String? department;
  String? imageUrl;
  String? gpa;

  TestModel({
    this.id,
    this.name,
    this.department,
    this.imageUrl,
    this.gpa,
  });

  toJson() {
    return {
      'id': id,
      'name': name,
      'department': department,
      'imageUrl': imageUrl,
      'gpa': gpa,
    };
  }

  TestModel.fromJson(json, id) {
    this.id = id;
    name = json['name'] ?? "Ali";
    department = json['department'] ?? 'DCSE';
    imageUrl = json['imageUrl'] ??
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1UZyPMY3-hJzKToOonNqvBHFgSwXrMysQkQ&usqp=CAU';
    gpa = json['gpa'] ?? '0.00';
  }
}
