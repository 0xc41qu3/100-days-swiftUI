//><-- Checkpoint 2 --><
/*
 Create an array of strings, then write some code that prints the
 number of items in the array and also the number of unique items in the array.
 */

let collection = ["Item0", "Item1", "Item2", "Item1"]

print("Number of items in the collection: \(collection.count)")
print("Number of unique items in the collection: \(Set(collection).count)")