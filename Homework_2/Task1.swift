
// 1. Написать функцию, которая на вход принимает число: 
// сумма, которую пользователь хочет положить на вклад, 
// следующий аргумент это годовой процент, третий аргумент 
// это срок Функция возвращает сколько денег получит пользователь по итогу.

func simpleInterest(_ deposit: Double, _ interestRate: Double, _ days: Double) → Double {
    let totalAmount = deposit + deposit * (nterestRate / 100) / 365 * days
    return totalAmount
}

print(simpleInterest(100000, 5, 367))