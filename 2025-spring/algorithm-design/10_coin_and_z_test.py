import math
import random

random.seed(42)


def coin_experiment(tosses=30, repeats=1000):
    probs = []
    for _ in range(repeats):
        heads = sum(random.randint(0, 1) for _ in range(tosses))
        probs.append(heads / tosses)
    return sum(probs) / repeats, probs


def norm_cdf(z):
    return 0.5 * (1 + math.erf(z / math.sqrt(2)))


def z_test(sample, mu0, sigma, alpha=0.05):
    n = len(sample)
    mean = sum(sample) / n
    z = (mean - mu0) / (sigma / math.sqrt(n))
    p = {
        "two-sided": 2 * (1 - norm_cdf(abs(z))),
        "less": norm_cdf(z),
        "greater": 1 - norm_cdf(z),
    }
    print(f"mean {mean:.4f}, z = {z:.3f}")
    for alt, pv in p.items():
        decision = "reject H0" if pv < alpha else "fail to reject H0"
        print(f"  {alt:10} p = {pv:.4f}  {decision}")


if __name__ == "__main__":
    estimate, probs = coin_experiment()
    print(f"P(heads) ~ {estimate:.4f} (min {min(probs):.2f}, max {max(probs):.2f})")

    ph = [random.gauss(8.305, 0.02) for _ in range(50)]
    z_test(ph, mu0=8.3, sigma=0.02)
