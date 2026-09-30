scores = [72, 45, 88, 91, 60, 77, 53]

total = 0
for s in scores:
    total += s
mean = total / len(scores)
print(f"n = {len(scores)}, mean = {mean:.2f}")

passed = 0
for s in scores:
    if s >= 85:
        label = "high"
    elif s >= 60:
        label = "pass"
    else:
        label = "fail"
    if s >= 60:
        passed += 1
    print(s, label)
print(f"pass rate: {passed / len(scores):.0%}")

lo = hi = scores[0]
for s in scores[1:]:
    lo = min(lo, s)
    hi = max(hi, s)
print("range:", hi - lo)

# how many years until 10000 TL doubles at 35% a year
money, years = 10000, 0
while money < 20000:
    money *= 1.35
    years += 1
print(years, round(money, 2))

n = 27
steps = 0
while n != 1:
    n = n // 2 if n % 2 == 0 else 3 * n + 1
    steps += 1
print("collatz steps for 27:", steps)

values = [3.2, 4.8, 5.1, 2.9, 6.3]
ss = 0
for v in values:
    ss += (v - sum(values) / len(values)) ** 2
print(f"sample variance: {ss / (len(values) - 1):.4f}")

age = 21
is_student = True
gpa = 3.12
print(type(age), type(is_student), type(gpa), type("text"))
print(int("42") + 1, float("2.5") * 2, str(7) + "7", round(2 / 3, 3))
