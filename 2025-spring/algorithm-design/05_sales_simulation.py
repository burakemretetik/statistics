import random

random.seed(208)


def furniture(models=3, cities=7, days=30):
    totals = [0] * models
    for _ in range(days):
        for _ in range(cities):
            for m in range(models):
                totals[m] += random.randint(0, 6)
    for m, t in enumerate(totals, start=1):
        print(f"model {m}: {t}")
    worst = totals.index(min(totals)) + 1
    print(f"model {worst} sold the least")


def pen_shop(days=30):
    prices = {"A": 40, "B": 65, "C": 80}
    qty = {brand: 0 for brand in prices}
    best_day, best_income = 0, 0

    for day in range(1, days + 1):
        income = 0
        for brand, price in prices.items():
            sold = random.randint(0, 15)
            qty[brand] += sold
            income += sold * price
        if income > best_income:
            best_day, best_income = day, income

    for brand in prices:
        print(f"{brand}: {qty[brand]} pens, {qty[brand] * prices[brand]} TL")
    print(f"best day: {best_day} ({best_income} TL)")


if __name__ == "__main__":
    furniture()
    print()
    pen_shop()
