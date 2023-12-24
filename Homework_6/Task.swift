struct Pizza: MenuProtocol { 

    var cost: Int 
    var view: PizzaView 
    var thickness: DoughThickness 
    var supplement: PizzaSupplement
  
    enum PizzaSupplement { 
        case pepperoni, tomatos, cheese
    }
  
    enum PizzaView: String {
        case napoletana 
        case calzone 
        case romana 
        case siciliana 
        case fritta 
    }
  
    enum DoughThickness: String {
        case thin
        case thick
    }
}

/* Создать структуру работника пиццерии. В ней должны быть такие свойства, 
как имя, зарплата и должность. Должностей пока может быть две: или кассир, или повар.*/

struct Worker {

    var name: String
    var salary: Double
    var jobTitle: Profession

    enum Profession: String {
        case cashier
        case cook
    }
}

class Pizzeria  {

    fileprivate var menu: [MenuProtocol]

// Добавить в класс пиццерии массив с работниками.
    var workers: [Worker]

// Добавить в класс пиццерии свойство, в котором хранится массив столиков.
    var tables: [Table] = []

    init(menu: [MenuProtocol], workers: [Worker], numberTables: Int) {
        self.menu = menu
        self.workers = workers

// Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра
        for _ in 1...numberTables {
            tables.append(Table(pizzeria: self, numberPlaces: 5)) 
        }
    }

    func addNewItemMenu(itemMenu: MenuProtocol) {
        menu.append(itemMenu)
    }
  
     func getMenu() -> [MenuProtocol] {
        menu
    }

    func getAllWorker() -> [Worker] {
        workers
    }
}

/* Создать класс столика, в нем должны быть: свойство, в котором 
содержится количество мест, и функция, которая на вход принимает 
количество гостей, которое хотят посадить, а возвращает true, если 
места хватает и false, если места не хватает. Изначальное количество 
мест задается в инициализаторе*/

class Table{

    var numberPlaces: Int

// У класса столика добавить свойство, в котором хранится пиццерия, в которой стоит столик.
     weak var pizzeria: Pizzeria?

    init(pizzeria: Pizzeria, numberPlaces: Int) {
        self.numberPlaces = numberPlaces
    }

    func getFreeTables(numberGuest: Int) -> Bool {
        numberGuest <= numberPlaces
    }
}

protocol MenuProtocol {
    var cost: Int { get set }
}

struct PotatoFries: MenuProtocol { 

    var cost: Int 
    var size: PotatoFriesSize 
  
    enum PotatoFriesSize: String { 
        case mini = "Mini" 
        case midle = "Midle" 
        case maxi = "Maxi" 
    }
}

protocol OperatingMode {

    func pizzeriaOpen()
    func pizzeriaClosed()
}

extension Pizzeria: OperatingMode {

    func pizzeriaOpen() {
        print("ОТКРЫТО")
    }

    func pizzeriaClosed() {
        print("ЗАКРЫТО")
    }
}

let napoletana = Pizza(cost: 390, view: .napoletana, thickness: .thick, supplement: .cheese)
let romana = Pizza(cost: 400, view: .romana, thickness: .thin, supplement: .tomatos)
let fritta = Pizza(cost: 450, view: .fritta, thickness: .thin, supplement: .pepperoni)
let friMini = PotatoFries(cost: 150, size: .mini)

let worker1 = Worker(name: "Светлана", salary: 40000, jobTitle: .cashier)
let worker2 = Worker(name: "Анастасия", salary: 50000, jobTitle: .cook)

var pizzeria = Pizzeria(menu: [napoletana, romana, fritta, friMini], workers: [worker1, worker2], numberTables: 6)

let siciliana = Pizza(cost: 450, view: .siciliana, thickness: .thick, supplement: .cheese)
pizzeria.addNewItemMenu(itemMenu: siciliana)

let friMaxi = PotatoFries(cost: 300, size: .maxi)
pizzeria.addNewItemMenu(itemMenu: friMaxi)

var menuAll = pizzeria.getMenu();

for position in menuAll {
    
    if let p = position as? Pizza {
        print("Пицца: цена - \(p.cost), вид - \(p.view), толщина теста - \(p.thickness), добавка - \(p.supplement)")
    } else if let f = position as? PotatoFries {
        print("Картошка фри: цена - \(f.cost), размер - \(f.size)")
    }
}

print(pizzeria.tables[0].getFreeTables(numberGuest: 5)) 
print(pizzeria.tables[0].getFreeTables(numberGuest: 4)) 
print(pizzeria.tables[0].getFreeTables(numberGuest: 6))

var workerAll = pizzeria.getAllWorker();

for a in workerAll {
  print("Имя работника: \(a.name), зарплата: \(a.salary), должность: \(a.jobTitle)")
}