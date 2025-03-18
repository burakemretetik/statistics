import math


def f(x):
    return x ** 3 - 6 * x ** 2 + 4 * x + 12


def fibonacci(n):
    seq = []
    a, b = 1, 1
    for _ in range(n):
        seq.append(a)
        a, b = b, a + b
    return seq


def exp_series(x, terms=20):
    total = 0
    term = 1
    for k in range(terms):
        total += term
        term *= x / (k + 1)
    return total


def pythagorean_triples(limit=1000):
    found = []
    for a in range(1, limit):
        for b in range(a + 1, limit - a):
            c = math.isqrt(a * a + b * b)
            if c * c == a * a + b * b and a + b + c < limit:
                found.append((a, b, c))
    return found


if __name__ == "__main__":
    nums = range(1, 101)
    n = len(nums)
    mean = sum(nums) / n
    sd = math.sqrt(sum((x - mean) ** 2 for x in nums) / (n - 1))
    print(f"1..100: sum {sum(nums)}, mean {mean}, sd {sd:.4f}")

    print(fibonacci(15))

    # walk [-2, 8] with step 0.2
    xs = [round(-2 + 0.2 * i, 1) for i in range(51)]
    positive = [f(x) for x in xs if f(x) > 0]
    print(f"positive f(x): {len(positive)} values, sum {sum(positive):.2f}")
    window = [f(x) for x in xs if 4 <= x <= 8]
    print(f"[4, 8]: {len(window)} points, min {min(window):.2f}, max {max(window):.2f}")

    for x in (0.5, 1, 3):
        print(f"e^{x}: series {exp_series(x):.10f}, math {math.exp(x):.10f}")

    triples = pythagorean_triples()
    print(f"{len(triples)} triples, first few: {triples[:5]}")
