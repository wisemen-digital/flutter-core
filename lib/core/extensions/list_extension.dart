extension CustomListExtensions<T, I> on List<T>? {
  //add or update an item in the list
  List<T> addOrUpdateItem(
      {required T item, required bool Function(T element) predicate}) {
    //if the list is not null
    if (this != null) {
      //check if the item already exist so it needs to be updated
      int index = this!.indexWhere(predicate);

      if (index == -1) {
        //if the item does not exist -> append to list
        return [...this!, item];
      } else {
        //if the item exists -> replace at index
        this!.removeAt(index);
        this!.insert(index, item);
        return this!;
      }
    } else {
      //if the list is null
      return [item];
    }
  }

  List<T> updateItem({required T item, required int index}) {
    //if the list is not null
    if (this != null) {
      this!.removeAt(index);
      this!.insert(index, item);
      return this!;
    } else {
      //if the list is null
      return [item];
    }
  }
}
