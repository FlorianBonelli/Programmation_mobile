void main() {
  int? a;

  final int b = a ?? 5;
  print(b);

  a ??= 3;

  final int c = a;
  print(c);

  print(a.isEven);
}
