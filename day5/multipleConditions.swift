// ><-- Multiple conditions --><
enum AvailableOptions {
  case A, B, C, D
}

let chosenOption = AvailableOptions.B

if chosenOption == .A || chosenOption == .B {
  print("A or B was chosen.")
} else if chosenOption == .C {
  print("C option was chosen.")
} else {
  print("D option or any other else was chosen.")
}

switch chosenOption {
  case .A:
    print("A was chosen.")
  case .B:
    print("B was chosen.")
  case .C:
    print("C was chosen.")
    fallthrough // It runs this block of code and the following one.
  case .D:
    print("D was chosen.")
}