# This program prompts user for hours worked and hourly rate
# then calculates and prints the total pay.

# Get user input
hours = input("Enter hours worked: ")   
rate = input("Enter hourly rate: ")

# Calculate total pay
pay = float(hours) * float(rate)

# Print the total pay
print(f"Total pay: {pay}")      