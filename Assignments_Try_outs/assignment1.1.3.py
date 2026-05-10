# This program calculates the square root of a number inputted by the user
# and prints the result.

# Import math library
import math

# Get user input
num = (input("Enter a number: "))
# num is the number inputted by the user
result = math.sqrt(float(num))
print(f"The square root of {num} is {result}")
