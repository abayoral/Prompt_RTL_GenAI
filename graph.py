import matplotlib.pyplot as plt
import numpy as np

# Data
frameworks = [
    "Zero-Shot", "CoT", "Generate Knowledge", "Least to most", "RaR",
    "RoEm", "Self-ask", "Self-calibration", "Self-consistency"
]

categories = ["Arithmetic & Data", "Modular & Advanced", "Sequential & FSMs", "Basic-Combinational"]
values = np.array([
    [88.33, 45.21, 58.7, 97.24],
    [72.61, 35.46, 53.64, 92.34],
    [92.86, 55.33, 57.96, 97.37],
    [92.86, 53.77, 57.06, 96.09],
    [72.86, 40.17, 46.63, 72.07],
    [93.33, 52.48, 56.57, 95.67],
    [81.43, 43.78, 55.55, 93.57],
    [76.9, 47.48, 60.41, 89.03],
    [84.04, 52.31, 57.07, 96.4]
]).T  # Transpose so categories are rows

# Calculate the average performance across all categories for each framework
average_performance = np.mean(values, axis=0)

# Append "Overall" as a new category
extended_categories = categories + ["Overall"]

# Extend the data to include the average performance values
extended_values = np.vstack([values, average_performance])

# Define colors for bars
colors = [
    "steelblue", "orange", "green", "red", "purple", "brown", "pink", "gray", "cyan"
]

# Create a grouped bar plot with a vertical dotted line after "Basic-Combinational"
fig, ax = plt.subplots(figsize=(14, 5))

bar_width = 0.1  # Width of each bar
x = np.arange(len(extended_categories)) * 2  # Increase spacing between categories

# Plot bars for each framework
for i, framework in enumerate(frameworks):
    ax.bar(x + i * bar_width, extended_values[:, i], width=bar_width, label=framework, color=colors[i])

# Add a vertical dotted line after "Basic-Combinational"
separation_x = x[len(categories) - 1] + 1  # Position after the last main category
ax.axvline(x=separation_x, color="black", linestyle="dotted", linewidth=1.5)

# Set labels and title
ax.set_xlabel("Categories")
ax.set_ylabel("Average Test Vectors Passed")
ax.set_title("Framework Performance Across Categories (Including Overall)")

# Adjust x-axis tick positions and labels
ax.set_xticks(x + (len(frameworks) / 2) * bar_width)
ax.set_xticklabels(extended_categories, rotation=0, ha="center")

# Adjust legend placement
ax.legend(loc="upper left", bbox_to_anchor=(1, 1))

plt.show()