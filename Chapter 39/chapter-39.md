✅ Chapter 39: NULL — Study Guide										
										
📘 Purpose		"In SQL, NULL represents “nothing” — the absence of any value.

⚠️ Important distinctions:

NULL ≠ empty string ('')

NULL ≠ number 0

Do not write 'NULL' in quotes — that is treated as text, not NULL."					🧩 Key Characteristics			
⚙️ Filtering for NULL		"-- Select rows where ManagerId is NULL
SELECT * FROM Employees
WHERE ManagerId IS NULL;

-- Select rows where ManagerId is NOT NULL
SELECT * FROM Employees
WHERE ManagerId IS NOT NULL;"			"💡 Explanation:
| Clause                | Description                                    |
| --------------------- | ---------------------------------------------- |
| `IS NULL`             | Filters rows where the column has no value     |
| `IS NOT NULL`         | Filters rows where the column contains a value |
| `= NULL` or `<> NULL` | ❌ Not allowed — always returns UNKNOWN         |
"		Concept	Description		
⚙️ Nullable vs Non-Nullable Columns		"CREATE TABLE MyTable (
    MyCol1 INT NOT NULL,  -- cannot store NULL
    MyCol2 INT NULL       -- can store NULL
);

-- Works fine
INSERT INTO MyTable (MyCol1, MyCol2) VALUES (1, NULL);

-- ❌ Fails: cannot insert NULL into non-nullable column
INSERT INTO MyTable (MyCol1, MyCol2) VALUES (NULL, 2);
"			"💡 Explanation:

NOT NULL ensures column must always have a value.

NULL allows optional or missing data.

Default: Columns are nullable unless explicitly set to NOT NULL."		Meaning	Absence of a value		
⚙️ Updating Fields to NULL		"-- Set ManagerId to NULL for employee with Id = 4
UPDATE Employees
SET ManagerId = NULL
WHERE Id = 4;"			"💡 Explanation:

Updating a column to NULL works like updating any other value."		Comparison	NULL cannot be compared using = or <> (always UNKNOWN)		
⚙️ Inserting Rows with NULL Fields		"INSERT INTO Employees
(Id, FName, LName, PhoneNumber, ManagerId, DepartmentId, Salary, HireDate)
VALUES
(5, 'Jane', 'Doe', NULL, NULL, 2, 800, '2016-07-22');"			"💡 Explanation:

Columns like PhoneNumber or ManagerId can remain empty (NULL) if no data is available.

Useful for optional fields or unknown information."		Default Behavior	Columns are nullable by default unless NOT NULL is specified		
							Use Case	Represent missing or optional data (e.g., no manager, unknown phone number)		
										
							⚡ Key Points			
							Concept	Summary		
							NULL is absence of value	Not 0, not empty string, not 'NULL'		
							Comparisons	Use IS NULL or IS NOT NULL		
							Column constraints	NOT NULL prevents NULLs; default is nullable		
							Insertion & Update	Can insert or update columns to NULL where allowed		
										
										
										
										
