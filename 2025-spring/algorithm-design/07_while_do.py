def odd_even_summary(stream):
    odd = []
    even = []
    it = iter(stream)
    x = next(it)
    while x > 0:
        (odd if x % 2 else even).append(x)
        x = next(it)

    if odd:
        print(f"odd: {len(odd)} numbers, mean {sum(odd) / len(odd):.2f}")
    if even:
        harmonic = len(even) / sum(1 / v for v in even)
        print(f"even: {len(even)} numbers, harmonic mean {harmonic:.2f}")


def class_weights(sections):
    for name, weights in sections.items():
        i = total = 0
        while i < len(weights):
            total += weights[i]
            i += 1
        print(f"class {name}: mean weight {total / i:.1f} kg")


def farthest_multiple(a, b):
    low, high = min(a, b), max(a, b)
    sevens = [k for k in range(low, high + 1) if k % 7 == 0]
    mean = sum(sevens) / len(sevens)
    fives = [k for k in range(low, high + 1) if k % 5 == 0]
    far = max(fives, key=lambda k: abs(k - mean))
    return mean, far, abs(far - mean)


if __name__ == "__main__":
    odd_even_summary([7, 12, 3, 8, 21, 4, 9, 0])
    class_weights({"1A": [22.5, 24.0, 19.8, 25.1], "1B": [21.0, 23.4, 26.2], "1C": [20.5, 22.2, 24.8, 23.3, 21.9]})
    print(farthest_multiple(120, 30))
