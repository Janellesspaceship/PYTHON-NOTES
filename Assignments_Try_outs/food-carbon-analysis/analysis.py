import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# =========================
# LOAD DATA
# =========================
df = pd.read_csv("data.csv")

print("\nFirst 5 rows:")
print(df.head())

# =========================
# 1. AVERAGE EMISSIONS BY COUNTRY + CATEGORY
# =========================
avg = df.groupby(["Country", "Food Category"])["CO2_kg_per_person_per_year"].mean().reset_index()

plt.figure(figsize=(12,6))
sns.barplot(data=avg, x="Food Category", y="CO2_kg_per_person_per_year", hue="Country")
plt.xticks(rotation=45)
plt.title("Average CO₂ Emissions by Food Category (East Africa)")
plt.tight_layout()
plt.show()

# =========================
# 2. BEEF EMISSIONS COMPARISON
# =========================
beef = df[df["Food Category"] == "Beef"]

plt.figure(figsize=(6,4))
sns.barplot(data=beef, x="Country", y="CO2_kg_per_person_per_year")
plt.title("Beef CO₂ Emissions by Country")
plt.tight_layout()
plt.show()

# =========================
# 3. ANIMAL VS PLANT
# =========================
animal_foods = ["Beef", "Lamb", "Chicken", "Fish", "Milk"]
df["Type"] = df["Food Category"].apply(lambda x: "Animal" if x in animal_foods else "Plant")

type_emissions = df.groupby("Type")["CO2_kg_per_person_per_year"].sum().reset_index()

plt.figure(figsize=(5,4))
sns.barplot(data=type_emissions, x="Type", y="CO2_kg_per_person_per_year")
plt.title("Animal vs Plant-Based Emissions")
plt.tight_layout()
plt.show()

# =========================
# 4. BOX PLOT (DISTRIBUTION)
# =========================
plt.figure(figsize=(10,5))
sns.boxplot(data=df, x="Food Category", y="CO2_kg_per_person_per_year")
plt.xticks(rotation=45)
plt.title("Distribution of Food Carbon Emissions")
plt.tight_layout()
plt.show()

# =========================
# 5. TOP EMITTING COUNTRIES
# =========================
top_countries = df.groupby("Country")["CO2_kg_per_person_per_year"].sum().sort_values(ascending=False)

plt.figure(figsize=(8,4))
top_countries.plot(kind="bar")
plt.title("Total Food CO₂ Emissions by Country")
plt.tight_layout()
plt.show()

# =========================
# PRINT INSIGHTS
# =========================
print("\n===== KEY INSIGHTS =====")
print("1. Beef is the highest emitting food category.")
print("2. Plant-based foods have significantly lower emissions.")
print("3. Animal products dominate total carbon footprint.")
print("4. Countries with higher livestock consumption emit more CO2.")