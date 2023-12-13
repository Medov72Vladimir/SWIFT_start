// 2. Есть массив [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]. 
//    Необходимо создать новый массив, который будет состоять из элементов старого, но 
//    не должно быть nil, не должно быть 0 и 4, а также массив должен быть отсортирован 
//    по возрастанию.

// var a: [Int?] = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]
// var b = a.compactMap {$0} 
// print(b)
// var c: [Int] = []
// for num in 0 ..< b.count {
//   if b[num] != 0 && b[num] != 4 {
//     c.append(b[num])
//   }
// }
// var d = c.sorted(by: <)
// print(d)

var a: [Int?] = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]
var b = a.compactMap{$0}.filter{$0 != 0 && $0 != 4}.sorted(by: <)
print(b)

