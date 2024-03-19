extension ImmutableIterableExt on Iterable {
  List<T> toImmutableList<T>() => List.unmodifiable(this);
}
