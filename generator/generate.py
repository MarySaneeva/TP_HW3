import csv
import random
import os
import sys

NUM_ROWS = 50
COLUMNS = ["employee_id", "department", "salary", "performance"]

def generate_row():
    return {
        "employee_id": random.randint(1000, 9999),
        "department": random.choice(["Sales", "Marketing", "IT", "HR", "Finance"]),
        "salary": random.randint(50000, 200000),
        "performance": round(random.uniform(1.0, 5.0), 1),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)
