import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

rng = np.random.default_rng(6)

months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
visitors = np.array([120, 135, 160, 190, 240, 310, 380, 395, 300, 220, 160, 130])
online = visitors * rng.uniform(0.3, 0.5, 12)

fig, ax = plt.subplots(figsize=(8, 4))
ax.plot(months, visitors, marker="o", label="total")
ax.plot(months, online, marker="s", linestyle="--", label="online")
ax.set_title("Monthly visitors")
ax.set_ylabel("visitors (thousand)")
ax.legend()
ax.grid(alpha=0.3)
fig.tight_layout()
fig.savefig("line.png", dpi=120)

scores = {g: rng.normal(m, 10, 60) for g, m in zip("ABC", (62, 70, 66))}
hours = rng.uniform(0, 10, 120)
exam = 45 + 4 * hours + rng.normal(0, 8, 120)

fig, axes = plt.subplots(2, 2, figsize=(9, 7), sharex=False)
axes[0, 0].bar(list(scores), [v.mean() for v in scores.values()],
               yerr=[v.std(ddof=1) for v in scores.values()], capsize=4, color="steelblue")
axes[0, 0].set_title("Mean score by group")

axes[0, 1].hist(scores["B"], bins=15, edgecolor="white")
axes[0, 1].axvline(scores["B"].mean(), color="red", linestyle="--")
axes[0, 1].set_title("Group B distribution")

axes[1, 0].boxplot(list(scores.values()))
axes[1, 0].set_xticks([1, 2, 3], list(scores))
axes[1, 0].set_title("Boxplots")

b1, b0 = np.polyfit(hours, exam, 1)
xs = np.linspace(0, 10, 50)
axes[1, 1].scatter(hours, exam, s=12, alpha=0.6)
axes[1, 1].plot(xs, b0 + b1 * xs, color="black")
axes[1, 1].set_title(f"exam = {b0:.1f} + {b1:.2f} hours")
axes[1, 1].set_xlabel("study hours")

fig.suptitle("Week 6 practice")
fig.tight_layout()
fig.savefig("grid.png", dpi=120)

shares = {"Python": 41, "R": 27, "SPSS": 18, "Excel": 14}
fig, ax = plt.subplots()
ax.pie(shares.values(), labels=shares.keys(), autopct="%1.0f%%", startangle=90)
ax.set_title("Tool used in the term project")
fig.savefig("pie.png", dpi=120)

print("saved line.png, grid.png, pie.png")
