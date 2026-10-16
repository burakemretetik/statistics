import numpy as np
import pandas as pd

rng = np.random.default_rng(5)
n = 40
df = pd.DataFrame({
    "id": range(201, 201 + n),
    "gender": rng.choice(["F", "M"], n),
    "group": rng.choice(["A", "B", "C"], n),
    "study_hours": rng.uniform(0.5, 8, n).round(1),
    "midterm": rng.integers(35, 100, n),
})
df["final"] = (df["midterm"] * 0.5 + df["study_hours"] * 5 + rng.normal(15, 8, n)).clip(0, 100).round()
df.loc[[3, 17, 29], "final"] = np.nan

df.to_csv("students.csv", index=False)
df = pd.read_csv("students.csv")

print(df.head())
print(df.shape)
print(df.dtypes)
print(df.describe().round(2))

s = df["midterm"]
print(type(s).__name__, type(df[["midterm"]]).__name__)
print(df.loc[0, "midterm"], df.iloc[0, 4])
print(df.loc[5:8, ["id", "group", "final"]])

print(df[df["midterm"] > 80][["id", "midterm"]])
print(df[(df["group"] == "A") & (df["study_hours"] > 4)].shape[0])
print(df[(df["midterm"] < 45) | (df["final"] < 40)]["id"].tolist())

print(df.isna().sum())
df["final_filled"] = df["final"].fillna(df["final"].median())

df["average"] = 0.4 * df["midterm"] + 0.6 * df["final_filled"]
df["passed"] = df["average"] >= 60
df["grade"] = pd.cut(df["average"], [0, 50, 60, 75, 85, 100], labels=["FF", "DD", "CC", "BB", "AA"])
df = df.rename(columns={"study_hours": "hours"}).drop(columns="final")

print(df.groupby("group")["average"].agg(["count", "mean", "std"]).round(2))
print(df.groupby(["group", "gender"])["passed"].mean().unstack().round(2))
print(df["grade"].value_counts().sort_index())
print(pd.crosstab(df["group"], df["passed"], margins=True))
print(df.sort_values("average", ascending=False).head(5)[["id", "hours", "average", "grade"]])
print(df[["hours", "midterm", "average"]].corr().round(3))
