def read_until_blank():
    values = []
    while True:
        line = input("value (empty to stop): ").strip()
        if not line:
            return values
        values.append(float(line))


def series_sum(n):
    total = 0
    for x in range(1, n + 1):
        total += (2 * x + 5) ** 3 / 3
    return total


def divisible_by_9(n):
    n = abs(n)
    while n >= 9:
        n -= 9
    return n == 0


def multiples_of_3(low, high):
    count = total = 0
    for k in range(low, high + 1):
        if k % 3 == 0:
            count += 1
            total += k
    return count, total


def smallest_y(triples):
    best = None
    for a, b, c in triples:
        y = a * b + c ** 2
        if best is None or y < best:
            best = y
    return best


if __name__ == "__main__":
    data = read_until_blank()
    if len(data) > 1:
        n = len(data)
        total = sum(data)
        sum_sq = sum(x * x for x in data)
        print(f"mean {total / n:.3f}, variance {(sum_sq - total ** 2 / n) / (n - 1):.3f}")

    n = 0
    while n <= 0:
        n = int(input("upper limit: "))
    print(f"sum = {series_sum(n):.2f}")

    for k in (81, 100, -27, 0):
        print(k, divisible_by_9(k))

    print(multiples_of_3(10, 50))
    print(smallest_y([(2, 3, 1), (-1, 4, 2), (5, -2, 0), (3, 3, 3)]))
