class Snack {
  final String name;

  Snack(this.name);

  factory Snack.fromJson(Map<String, dynamic> json) {
    return Snack(json['name'] ?? '');
  }
}
