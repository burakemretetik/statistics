import random

random.seed(1)


def piecewise(a, b, c):
    if a < b:
        return a + b * c
    elif a == b:
        return c ** 2 - a
    else:
        return (a - b) / (c if c != 0 else 1)


def course_results(students=80, courses=5):
    passed = [0] * courses
    for _ in range(students):
        for k in range(courses):
            midterm = random.randint(0, 100)
            final = random.randint(0, 100)
            avg = 0.4 * midterm + 0.6 * final
            if avg >= 50 and final >= 50:
                passed[k] += 1
    for k, p in enumerate(passed, start=1):
        print(f"course {k}: {p}/{students} passed")


def parents_education(answers):
    levels = {1: "primary", 2: "high school", 3: "university", 4: "graduate"}
    counts = dict.fromkeys(levels.values(), 0)
    for mother, father in answers:
        for level in (mother, father):
            match level:
                case 1 | 2 | 3 | 4:
                    counts[levels[level]] += 1
                case _:
                    print("invalid code:", level)
    return counts


if __name__ == "__main__":
    for abc in [(1, 4, 2), (3, 3, 5), (9, 2, 7), (5, 1, 0)]:
        print(abc, piecewise(*abc))

    course_results()

    answers = [(random.randint(1, 4), random.randint(1, 4)) for _ in range(30)]
    print(parents_education(answers))
