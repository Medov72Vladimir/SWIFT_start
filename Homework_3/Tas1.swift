// 1. Есть словарь с видами чая и их стоимостью. Есть очередь людей, 
//    которые хотят заказать чай (можно представить её в виде массива 
//    видов чая, которые хотят заказать).
//    Необходимо последовательно выводить в консоль сколько заплатит покупатель 
//   (необходимо вывести его номер по порядку, чай, который он заказал, и стоимость).

enum teaType {
  case earlGrey
  case herbalTea
  case yellowTea
  case oolong
}

var teaPrices: [teaType: Int] = [.earlGrey: 5, .herbalTea: 4, .yellowTea: 3, .oolong: 6]

let customerOrders: [teaType] = [.earlGrey, .oolong, .yellowTea, .herbalTea, .earlGrey]

for(index, tea) in customerOrders.enumerated() {
  if let price = teaPrices[tea] {
    print("Cusomter #\(index + 1) will pay \(price) for \(tea)")
  }
}