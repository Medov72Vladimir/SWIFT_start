// 3. Написать функцию, которая на вход принимает целое число, 
//    а возвращает массив, который сформирован по следующим правилам: 
//    количество элементов соответствует переданному числу, массив 
//    начинается с 1, каждый последующий элемент больше предыдущего в 2 раза.

func myArray(count: Int) -> [Int] {
  var result = [Int]()
  var num = 1
  for _ in 1...count {
    result.append(num)
    num *= 2
  }
  return result
}
print(myArray(count: 5))