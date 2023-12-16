// 2. Создать структуру пиццы, она должна содержать стоимость, 
//    вид пиццы, толстое или тонкое тесто и добавки (например, 
//    дополнительно добавить пепперони, помидоры, сыр). Вид пиццы 
//    должен быть вложенным типом для структуры пиццы. Подсказка: 
//    добавки лучше также сделать перечислением. 

struct Pizza { // структура пиццы
    var cost: Int // стоимость
    var view: PizzaView // вид пиццы
    var thin: Bool // тонкое тесто (true/false)
    var supplement: PizzaSupplements // добавка

    enum PizzaSupplements { // перечисление с добавками к пицце
        case pepperoni, tomatos, cheese
    }

// 1. Создать перечисление с видами пиццы (хотя бы 4 - 5 кейсов)

    enum PizzaView: String { // перечисление с видами пиццы
        case napoletana,  calzone, romana, siciliana, fritta
    }
}

// 3. Создать класс пиццерии, добавить массив с возможными пиццами. 
//    Переменная с массивом должна быть приватной. Массив задается 
//    в инициализаторе.

class Pizzeria  {
    private var pizza: [Pizza]

    init(pizza: [Pizza]) {
        self.pizza = pizza
    }
// 4. Написать в классе пиццерии функции для добавления новой пиццы и для 
//    получения всех доступных пицц.

    func setNewPizza(newPizza: Pizza) { // добавить новую пиццу
        pizzaAll.append(newPizza)
    }

     func getAllPizza() → [Pizza] { // получить все доступные пиццы
        return pizzaAll
    }
}

// 5. Создать экземпляр класса пиццерии и добавить в него несколько пицц.

let napoletana = Pizza(cost: 390, view: .napoletana, thin: true, supplement: .cheese)
let romana = Pizza(cost: 400, view: .romana, thin: true, supplement: .tomatos)
let fritta = Pizza(cost: 450, view: .fritta, thin: false, supplement: .pepperoni)

var pizzeria = Pizzeria(pizza: [napoletana, romana, fritta])

let siciliana = Pizza(cost: 450, view: .siciliana, thin: false, supplement: .cheese)
pizzeria.setNewPizza(newPizza: siciliana)

var allPizza = pizzeria.getAllPizza();

for i in allPizza {
    print("Цена пиццы: \(i.cost), вид пиццы: \(i.view), тесто: " + (i.thin ? "тонкое" : "толстое") + " , добавка: \(i.supplement)")
}