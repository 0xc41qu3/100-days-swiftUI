/**
 Checkpoint 8
 • Make a protocol that describes a building.
 • Your protocol should require the following:
 • A property storing how many rooms it has.
 • A property storing the cost as an integer.
 • A property storing the name of the estate agent selling the building.
 • A method for printing the sales summary of the building.
 • Create two structs, House and Office, that conform to it.
 */

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var stateAgent: String { get }
    
    func printSalesSummary()
}

extension Building {
    func printSalesSummary() {
        print("""
        \n
        rooms: \(rooms);
        cost: $\(cost);
        state agent: \(stateAgent)
        """)
    }
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var stateAgent: String
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var stateAgent: String
}

let brandNewOffice = Office(rooms: 25, cost: 48_000_000, stateAgent: "Stuart Little")
let brandNewHouse = House(rooms: 6, cost: 273_000, stateAgent: "Stuart Little Jr")

brandNewHouse.printSalesSummary()
brandNewOffice.printSalesSummary()
