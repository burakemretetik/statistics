def multiply(a, b):
    if len(a[0]) != len(b):
        print("columns of A must equal rows of B")
        return None
    rows, inner, cols = len(a), len(b), len(b[0])
    c = [[0] * cols for _ in range(rows)]
    for i in range(rows):
        for j in range(cols):
            for k in range(inner):
                c[i][j] += a[i][k] * b[k][j]
    return c


def summary(m):
    rows, cols = len(m), len(m[0])
    values = [x for row in m for x in row]
    mean = sum(values) / len(values)

    print("row means:", [round(sum(r) / cols, 2) for r in m])
    print("col means:", [round(sum(m[i][j] for i in range(rows)) / rows, 2) for j in range(cols)])
    print("row mins: ", [min(r) for r in m])
    print("col maxes:", [max(m[i][j] for i in range(rows)) for j in range(cols)])
    print(f"min {min(values)}, max {max(values)}")
    print(f"odd {sum(x % 2 != 0 for x in values)}, even {sum(x % 2 == 0 for x in values)}")
    print(f"positive {sum(x > 0 for x in values)}, negative {sum(x < 0 for x in values)}")
    print(f"below mean ({mean:.2f}): {sum(x < mean for x in values)}")


def diagonal_and_upper(m):
    n = len(m)
    product = 1
    upper = []
    for i in range(n):
        for j in range(n):
            if i == j:
                product *= m[i][j]
            elif i < j:
                upper.append(m[i][j])
    return product, sum(upper) / len(upper)


if __name__ == "__main__":
    a = [[1, 2, 3], [4, 5, 6]]
    b = [[7, 8], [9, 10], [11, 12]]
    print(multiply(a, b))
    print(multiply(a, a))

    m = [[4, -2, 7, 0], [3, 9, -5, 8], [-1, 6, 2, 11]]
    summary(m)

    sq = [[2, 5, 1], [7, 3, 8], [4, 6, 1]]
    print(diagonal_and_upper(sq))
