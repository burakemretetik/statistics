heights = [168, 172, 181, 159, 175, 190, 166, 178, 170, 184]

print(heights[0], heights[-1])
print(heights[:4], heights[-3:], heights[::2])

heights.append(173)
heights.insert(0, 162)
heights.remove(190)
print(len(heights), sorted(heights)[:3], max(heights))
print(181 in heights, 200 not in heights)

point = (38.42, 27.14)
lat, lon = point
print(f"lat {lat}, lon {lon}")

answers = ["yes", "no", "yes", "maybe", "yes", "no", "yes"]
counts = {}
for a in answers:
    counts[a] = counts.get(a, 0) + 1
print(counts)
for key, value in sorted(counts.items(), key=lambda kv: kv[1], reverse=True):
    print(f"{key:6} {value}  {value / len(answers):.2f}")


def mean(xs):
    return sum(xs) / len(xs)


def median(xs):
    s = sorted(xs)
    n = len(s)
    mid = n // 2
    return s[mid] if n % 2 else (s[mid - 1] + s[mid]) / 2


def variance(xs, ddof=1):
    m = mean(xs)
    return sum((x - m) ** 2 for x in xs) / (len(xs) - ddof)


def describe(xs):
    return {
        "n": len(xs),
        "mean": round(mean(xs), 2),
        "median": median(xs),
        "sd": round(variance(xs) ** 0.5, 2),
        "min": min(xs),
        "max": max(xs),
    }


def z_scores(xs):
    m, s = mean(xs), variance(xs) ** 0.5
    return [round((x - m) / s, 2) for x in xs]


print(describe(heights))
print(z_scores(heights))

students = [
    {"name": "Ali", "dept": "stat", "score": 78},
    {"name": "Ayse", "dept": "math", "score": 91},
    {"name": "Can", "dept": "stat", "score": 64},
    {"name": "Deniz", "dept": "math", "score": 70},
]
by_dept = {}
for s in students:
    by_dept.setdefault(s["dept"], []).append(s["score"])
print({d: mean(v) for d, v in by_dept.items()})

squares = [x ** 2 for x in range(1, 11)]
evens = [x for x in squares if x % 2 == 0]
print(squares, evens)
