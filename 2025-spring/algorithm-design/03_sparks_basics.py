import random


def range_sum(low, high):
    if low > high:
        low, high = high, low
    total = 0
    for k in range(low, high + 1):
        total += k
    return total


def odd_sum_between(a, b):
    low, high = min(a, b), max(a, b)
    return sum(k for k in range(low + 1, high) if k % 2 == 1)


def factorial(n):
    if n < 0:
        raise ValueError("negative number")
    result = 1
    for k in range(2, n + 1):
        result *= k
    return result


def is_prime(n):
    if n < 2:
        return False
    d = 2
    while d * d <= n:
        if n % d == 0:
            return False
        d += 1
    return True


def describe(numbers):
    n = len(numbers)
    total = sum_sq = 0
    lo = hi = numbers[0]
    for x in numbers:
        total += x
        sum_sq += x * x
        lo = min(lo, x)
        hi = max(hi, x)
    mean = total / n
    var = (sum_sq - n * mean ** 2) / (n - 1)
    return mean, var, lo, hi


if __name__ == "__main__":
    print(range_sum(15, 3))
    print(odd_sum_between(4, 15))
    print(sum(k for k in range(1, 501) if k % 3 == 0))

    for n in (0, 1, 5, 12):
        print(f"{n}! = {factorial(n)}")

    numbers = [12, 7, 9, 31, 4, 25, 17, 2, 1, 49]
    odd = [x for x in numbers if x % 2]
    even = [x for x in numbers if x % 2 == 0]
    print(f"odd sum {sum(odd)}, even sum {sum(even)}")
    print(f"primes: {sum(is_prime(x) for x in numbers)} of {len(numbers)}")

    sample = [random.randint(1, 100) for _ in range(100)]
    mean, var, lo, hi = describe(sample)
    print(f"mean {mean:.2f}, var {var:.2f}, min {lo}, max {hi}")
