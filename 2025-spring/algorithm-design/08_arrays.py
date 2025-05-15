import random


def bubble_sort(a):
    a = a[:]
    n = len(a)
    for i in range(n - 1):
        swapped = False
        for j in range(n - 1 - i):
            if a[j] > a[j + 1]:
                a[j], a[j + 1] = a[j + 1], a[j]
                swapped = True
        if not swapped:
            break
    return a


def lucas_like(n):
    seq = [2, 1]
    while len(seq) < n:
        seq.append(seq[-1] + seq[-2])
    return seq[:n]


def digit_sum_equals_length(low=100, high=999):
    return [k for k in range(low, high + 1) if sum(map(int, str(k))) == len(str(k))]


if __name__ == "__main__":
    temps = [14.2, 16.8, 15.1, 18.4, 21.0, 19.7, 13.5]
    days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    avg = sum(temps) / len(temps)
    hottest = temps.index(max(temps))
    print(f"weekly mean {avg:.2f}, hottest {days[hottest]} ({temps[hottest]})")
    print("above mean:", [d for d, t in zip(days, temps) if t > avg])

    fib = [1, 1]
    for i in range(2, 100):
        fib.append(fib[i - 1] + fib[i - 2])
    print(f"fib[99] = {fib[99]}")

    nums = [random.randint(-50, 50) for _ in range(100)]
    mean = sum(nums) / len(nums)
    print(f"mean {mean:.2f}, min {min(nums)}, max {max(nums)}, above mean {sum(x > mean for x in nums)}")

    print(bubble_sort([29, 3, 17, 8, 41, 3, 0, 12]))
    print(lucas_like(11))

    found = digit_sum_equals_length()
    print(f"{len(found)} numbers: {found}")
