import numpy as np

rng = np.random.default_rng(419)

print(rng.integers(1, 7, size=10))
print(rng.random(3))
print(rng.normal(50, 10, 3).round(2))

rolls = rng.integers(1, 7, size=60_000)
faces, counts = np.unique(rolls, return_counts=True)
print(dict(zip(faces.tolist(), (counts / rolls.size).round(4).tolist())))

coins = rng.random(10_000) < 0.5
running = np.cumsum(coins) / np.arange(1, coins.size + 1)
print(running[[9, 99, 999, 9999]].round(4))

two_dice = rng.integers(1, 7, size=(100_000, 2)).sum(axis=1)
print("P(sum = 7) ~", np.mean(two_dice == 7).round(4), "exact", round(6 / 36, 4))

pts = rng.random((1_000_000, 2))
inside = (pts ** 2).sum(axis=1) <= 1
print("pi ~", 4 * inside.mean())

# sample means from an exponential population
pop_mean = 5
for n in (2, 10, 50):
    means = rng.exponential(pop_mean, size=(20_000, n)).mean(axis=1)
    print(f"n={n:3}: mean {means.mean():.3f}, sd {means.std(ddof=1):.3f}, theory {pop_mean / np.sqrt(n):.3f}")

# 95% t-like interval coverage with normal data
covered = 0
for _ in range(5000):
    sample = rng.normal(100, 15, 20)
    half = 2.093 * sample.std(ddof=1) / np.sqrt(20)
    covered += abs(sample.mean() - 100) <= half
print("coverage", covered / 5000)

# bootstrap interval for a median
data = rng.lognormal(3, 0.6, 40)
boot = np.array([np.median(rng.choice(data, data.size)) for _ in range(5000)])
print("median", np.median(data).round(2), "95% boot CI", np.percentile(boot, [2.5, 97.5]).round(2))

# birthday problem
people = 23
sims = rng.integers(0, 365, size=(20_000, people))
shared = np.array([np.unique(row).size < people for row in sims])
print("P(shared birthday) ~", shared.mean().round(3))
