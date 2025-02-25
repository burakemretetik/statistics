def sugar_beet(daily_deliveries, rate=0.015):
    total_beet = 0
    for day, deliveries in enumerate(daily_deliveries, start=1):
        for farmer, kg in deliveries:
            total_beet += kg
            print(f"day {day:2}: farmer {farmer} gets {kg * rate:.1f} kg sugar")
    print(f"total beet: {total_beet} kg, total sugar: {total_beet * rate:.1f} kg")


def dress_shop(sales):
    total_qty = 0
    revenue = 0
    for qty, price in sales:
        total_qty += qty
        revenue += qty * price
    print(f"{total_qty} dresses sold, revenue {revenue} TL")


def mean_variance(scores):
    count = total = sum_sq = 0
    for x in scores:
        total += x
        sum_sq += x * x
        count += 1
    mean = total / count
    variance = (sum_sq - total ** 2 / count) / (count - 1)
    return mean, variance


def sofa_orders(orders, types=5):
    totals = [0] * types
    for day_orders in orders:
        for sofa_type, qty in day_orders:
            totals[sofa_type - 1] += qty
    for t, qty in enumerate(totals, start=1):
        print(f"type {t}: {qty}")


if __name__ == "__main__":
    sugar_beet([
        [(1, 1200), (2, 850)],
        [(3, 2000)],
        [(1, 640), (4, 1500), (5, 900)],
    ])

    dress_shop([(5, 300), (1, 1000), (2, 500), (6, 250), (1, 1500),
                (3, 400), (0, 750), (4, 350), (2, 600), (1, 2000)])

    m, v = mean_variance([75, 30, 60, 10, 100])
    print(f"mean {m}, variance {v}")

    sofa_orders([
        [(1, 2), (3, 1), (1, 4)],
        [(2, 5)],
        [(5, 1), (5, 2), (4, 3), (1, 1)],
    ])
