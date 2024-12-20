import numpy as np
from scipy.integrate import simps

""" trapezodial rule """
# Define the function to integrate
def integrand(x, y):
    return np.exp(x) * np.sin(2 * y)

# Integration limits
x_min, x_max = -0.2, 1.4
y_min, y_max = 0.4, 2.6

# Step size
h = 0.1

# Generate grids for x and y
x_points = np.arange(x_min, x_max + h, h)
y_points = np.arange(y_min, y_max + h, h)

# Function to perform trapezoidal rule for 2D integral
def trapezoidal_2d(f, x_points, y_points):
    integral = 0
    for i in range(len(x_points) - 1):
        for j in range(len(y_points) - 1):
            # Get the corners of each subrectangle
            x0, x1 = x_points[i], x_points[i+1]
            y0, y1 = y_points[j], y_points[j+1]
            # Calculate the average value of the function at the corners
            f_mean = (f(x0, y0) + f(x0, y1) + f(x1, y0) + f(x1, y1)) / 4
            # Calculate the area of the rectangle
            area = (x1 - x0) * (y1 - y0)
            # Add to the integral
            integral += f_mean * area
    return integral

# Compute the integral using the trapezoidal rule
ans = trapezoidal_2d(integrand, x_points, y_points)

print("Trapezoidal integral: ", ans)


""" simpson's 1/3 rule """
# Define the function
def integrand(x, y):
    return np.exp(x) * np.sin(2 * y)

# Create grids
x = np.arange(-0.2, 1.5, 0.1)
y = np.arange(0.4, 2.7, 0.1)

# Evaluate the function on a grid
X, Y = np.meshgrid(x, y, indexing='ij')
Z = integrand(X, Y)

# Integrate using Simpson's rule
result = simps([simps(row, y) for row in Z], x)

print("Simpson's integral: ",result)