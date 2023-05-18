import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

# Part A
x = np.linspace(1, 10, 20)
x1 = x.reshape((-1, 1))
y = 2 * x + np.sin(200 * np.pi * x)

# Part B
plt.plot(x, y)
plt.xlabel('x')
plt.ylabel('y')
plt.title('Plot of y versus x')
plt.show()

# Part C
print("Shape of x:", x.shape)
print("Shape of x1:", x1.shape)
print("First five values of x:", x[:5])
print("First five values of x1:")
print(x1[:5])

# Part D
model = LinearRegression()
model.fit(x1, y)

# Part E
beta_0 = model.intercept_
beta_1 = model.coef_[0]

print("Coefficient beta_0:", beta_0)
print("Coefficient beta_1:", beta_1)