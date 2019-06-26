import numpy as np
import matplotlib.pyplot as plt

games = []
money = 100
eps = 0.005
all_money = []
np.random.seed(123)

print('Enter the order of the games:')
a = str(input())

for element in a:
    if element == "A":
        games.append("A")
    elif element == "B":
        games.append("B")

games = games * int((100 / len(games)))

# playing many times
for x in range(4000):
    # playing one time
    for game in games:
        if game == "A":
            result = np.random.choice([0, 1], p=[0.5 + eps, 0.5 - eps])
            if result == 0:  # если выпала решка – вычитаем доллар
                money = money - 1
            elif result == 1:  # если выпал орёл – прибавляем доллар
                money = money + 1
        elif game == "B":
            if money % 3 == 0:
                result = np.random.choice([0, 1], p=[0.9 + eps, 0.1 - eps])
                if result == 0:  # если выпала решка – вычитаем доллар
                    money = money - 1
                elif result == 1:  # если выпал орёл – прибавляем доллар
                    money = money + 1
            else:
                result = np.random.choice([0, 1], p=[0.3 + eps, 0.7 - eps])
                if result == 0:  # если выпала решка – вычитаем доллар
                    money = money - 1
                elif result == 1:  # если выпал орёл – прибавляем доллар
                    money = money + 1
    all_money.append(money)
    money = 100

np_all_money = np.array(all_money)

print("Mean: " + str(np.mean(np_all_money)))
plt.hist(np_all_money, normed=True)

plt.show()
