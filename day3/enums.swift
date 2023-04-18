//><-- Enums --><
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

enum Weekday1 {
    case monday, tuesday, wednesday, thursday, friday
}

var chosenDay = Weekday1.friday
chosenDay = .monday // Since the var's type is fixed, Swift already knows what we're referring to.