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

/* 1. В рамках прошлого д/з 4 был создан класс пиццерии с переменной, 
в которой хранится пицца, удалите ее. Необходимо создать структуру 
картошки фри, в которой будет стоимость и размер картошки и сделать так, 
чтобы в классе пиццерии была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.*/

class Pizzeria  {
    fileprivate var menu: [MenuProtocol]
  
    init(menu: [MenuProtocol]) {
        self.menu = menu
    }

// 2. Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню.

    func addNewItemMenu(itemMenu: MenuProtocol) {
        menu.append(itemMenu)
    }
  
     func getMenu() -> [MenuProtocol] {
        menu
    }
}

protocol MenuProtocol {
    var cost: Int { get set }
}
// структура картошки фри

struct PotatoFries: MenuProtocol { 
    var cost: Int 
    var size: PotatoFriesSize 
  
    enum PotatoFriesSize: String { 
        case mini = "Mini" 
        case midle = "Midle" 
        case maxi = "Maxi" 
    }
}

// 3. Создайте протокол, в котором будут содержаться функции открытия и закрытия пиццерии.

protocol OperatingMode {
    func pizzeriaOpen()
    func pizzeriaClosed()
}

// 4. Написать расширение для класса пиццерии, в котором будет реализован протокол из пункта 3.

extension Pizzeria: OperatingMode {
    func pizzeriaOpen() {
        print("ОТКРЫТО")
    }
    func pizzeriaClosed() {
        print("ЗАКРЫТО")
    }
}

/* 5. Написать функцию, в которой происходит вычитание одного числа из другого. 
Функция должна работать и с Int, и с Double.Функция должна возвращать результат вычитания.*/

func subtraction<T:Numeric>(_ numberA:T, _ numberB:T) -> T {
    numberA - numberB
}

let napoletana = Pizza(cost: 390, view: .napoletana, thickness: .thick, supplement: .cheese)
let romana = Pizza(cost: 400, view: .romana, thickness: .thin, supplement: .tomatos)
let fritta = Pizza(cost: 450, view: .fritta, thickness: .thin, supplement: .pepperoni)
let friMini = PotatoFries(cost: 150, size: .mini)

var pizzeria = Pizzeria(menu: [napoletana, romana, fritta, friMini])

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

print()
pizzeria.pizzeriaOpen()
print()
print(subtraction(10 , 2))
print(subtraction(10.1 , 2.9))
