void main() {
  final List<int> numbers = <int>[25, 42, 79, 12];

  // Tri décroissant
  numbers.sort((int a, int b) => b.compareTo(a));
  print('Tri décroissant : $numbers');

  // Multiplier chaque élément par 2
  final List<int> multiplied = numbers.map((int e) => e * 2).toList();
  print('Multiplié par 2 : $multiplied');

  // Garder uniquement les nombres pairs
  final List<int> pairs = multiplied.where((int e) => e.isEven).toList();
  print('Nombres pairs : $pairs');
}
