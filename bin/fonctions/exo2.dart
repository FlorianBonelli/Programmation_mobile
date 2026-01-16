String foo({
  required String name,
  int number = 0,
  bool toUpperCase = false,
}) =>
    '${(toUpperCase ? name.toUpperCase() : name)} $number';

void useFoo() {
  print(foo(name: 'a'));
  print(foo(name: 'b', number: 1));
  print(foo(name: 'c', toUpperCase: true));
  print(foo(name: 'd', number: 2, toUpperCase: true));
}

void main() {
  useFoo();
}
