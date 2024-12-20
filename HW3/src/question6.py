import numpy as np
import matplotlib.pyplot as plt

# Define the functions
def chebyshev_series(x):
    return x  # T1(x) since cos(x) = T1(x) for x in the domain of cosine function

def power_series(x):
    return 1 - (x**2)/2 + (x**4)/24  # Up to x^4

# Values to evaluate
x_values = np.linspace(-np.pi, np.pi, 400)
true_values = np.cos(x_values)
chebyshev_values = chebyshev_series(x_values)
power_values = power_series(x_values)

# Plotting
plt.figure(figsize=(10, 6))
plt.plot(x_values, true_values, label='True Cos(x)', linewidth=2)
plt.plot(x_values, chebyshev_values, '--', label='Chebyshev Approximation', linewidth=1.5)
plt.plot(x_values, power_values, '--', label='Power Series Approximation', linewidth=1.5)
plt.legend()
plt.grid(True)
plt.title('Comparison of True Cos(x) vs Approximations')
plt.xlabel('x')
plt.ylabel('cos(x)')
plt.show()

# Calculate the maximum error
error_chebyshev = np.max(np.abs(true_values - chebyshev_values))
error_power = np.max(np.abs(true_values - power_values))
print(f'Maximum error in Chebyshev Approximation: {error_chebyshev}')
print(f'Maximum error in Power Series Approximation: {error_power}')
