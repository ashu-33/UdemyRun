"""
Day 1 — Task Manager CLI v1
Python Mega Course Sections 1-2

YOUR GOAL: Build a simple task manager that:
- Asks user for a task
- Adds it to a list
- Shows all tasks
- Runs in a loop until user types 'quit'
"""

# Start coding here:
tasks = []

while True:
    action = input("Type add, show, or quit: ")

    if action == "quit":
        break
    elif action == "add":
        task = input("Enter a task: ")
        tasks.append(task)
    elif action == "show":
        print("Tasks:")
        for task in tasks:
            print(f"- {task}")

print("Goodbye!")
