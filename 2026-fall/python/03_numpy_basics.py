import numpy as np

lst = [2, 4, 6]
arr = np.array(lst)
print(lst * 2)
print(arr * 2)

a = np.array([1, 2.5, 3])
print(a.dtype, np.array([1, "a"]).dtype)

m = np.arange(12).reshape(3, 4)
print(m.ndim, m.shape, m.size, m.dtype)
print(np.zeros(3), np.ones((2, 2)), np.linspace(0, 1, 5))

print(m[1, 2], m[-1], m[:, 1], m[:2, 1:3])

s = m[0, :]
s[0] = 99
print(m[0])
c = m[1, :].copy()
c[0] = -1
print(m[1])

x = np.array([12.0, 15.5, 9.8, 20.1, 14.3, 11.7, 18.2])
y = np.array([3.0, 4.1, 2.2, 5.6, 3.9, 2.8, 4.7])
print(x + y, x / y)
print(np.sqrt(x).round(2), np.log(x).round(2), np.exp(y).round(1))

print(f"mean {x.mean():.3f}, median {np.median(x)}, sum {x.sum()}")
print(f"var ddof=0 {x.var():.3f}, ddof=1 {x.var(ddof=1):.3f}")
print(f"sd ddof=1 {x.std(ddof=1):.3f}")
print(np.percentile(x, [25, 50, 75]))

print(m.sum(axis=0), m.mean(axis=1))

above = x > x.mean()
print(above, above.sum(), x[above])
print(x[(x > 10) & (x < 16)])
print(np.where(x > 15, "high", "low"))

z = (x - x.mean()) / x.std(ddof=1)
print(z.round(2))

print(np.corrcoef(x, y)[0, 1].round(3))
