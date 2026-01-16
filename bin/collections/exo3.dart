void main() {
  List<int> numbers = [25, 42, 79, 12];

  // Tri décroissant
  numbers.sort((a, b) => b.compareTo(a));
  print('Tri décroissant : $numbers');

  // Multiplier chaque élément par 2
  List<int> multiplied = numbers.map((e) => e * 2).toList();
  print('Multiplié par 2 : $multiplied');

  // Garder uniquement les nombres pairs
  List<int> pairs = multiplied.where((e) => e.isEven).toList();
  print('Nombres pairs : $pairs');
}
