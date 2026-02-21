# ✅ CHAPTER 46 — SEQUENCE

---

## 📘 What Is a Sequence?

A **sequence** is an auto-generated number counter stored in the database.

It’s commonly used to generate unique IDs for rows — like order numbers, invoice numbers, or customer IDs.

Think of it like a ticket machine that gives out a new number every time you press the button.

---

## ✅ Basic Syntax: Create a Sequence

```sql
CREATE SEQUENCE orders_seq
START WITH 1000
INCREMENT BY 1;
```

💡 What This Does:

- Creates a sequence named `orders_seq`
- Starts counting at `1000`
- Increases by `1` each time you call it

---

## ⚙️ How It Works

Each time you reference a sequence’s `NEXTVAL`, you get the next number in line.

- First call → `1000`
- Next call → `1001`
- Then `1002`, and so on…

---

## 📌 Important Rules

- Each statement gets only one number  
  If you call `NEXTVAL` multiple times in one SQL statement, all uses share the same generated value (Oracle behavior).

- `NEXTVAL` increments automatically  
  You don’t manually change it — the database keeps track.

- You can’t reuse old values  
  Once generated, the number is gone — even if the transaction rolls back.

---

## ✅ Example

```sql
SELECT orders_seq.NEXTVAL FROM dual;
```

💬 Returns:

```
NEXTVAL
--------
1000
```

💡 `dual` is a special one-row, one-column dummy table used in Oracle for running expressions.

---

# 🧩 Using Sequences in SQL Statements

---

## 🔹 1. For INSERT

```sql
INSERT INTO Orders (Order_UID, Customer)
VALUES (orders_seq.NEXTVAL, 1032);
```

Result:

- `Order_UID` gets a new unique number (e.g., 1000)
- `Customer` gets the value 1032

---

## 🔹 2. For UPDATE

```sql
UPDATE Orders
SET Order_UID = orders_seq.NEXTVAL
WHERE Customer = 581;
```

Every row that matches the condition gets a new sequential value.

---

## 🔹 3. For SELECT

```sql
SELECT orders_seq.NEXTVAL FROM dual;
```

---

# 🧠 Advanced Options (Optional Knowledge)

You can control sequences more precisely:

```sql
CREATE SEQUENCE invoice_seq
START WITH 500
INCREMENT BY 10
MINVALUE 500
MAXVALUE 10000
CYCLE
CACHE 20;
```

### Explanation:

- `START WITH 500` → first value is 500
- `INCREMENT BY 10` → next will be 510, 520, etc.
- `MINVALUE / MAXVALUE` → bounds for the sequence
- `CYCLE` → restarts at min value after hitting the max
- `CACHE` → preloads sequence values into memory for faster performance

---

# 🧩 Example Workflow

```sql
CREATE SEQUENCE orders_seq 
START WITH 1000 
INCREMENT BY 1;

INSERT INTO Orders (Order_UID, Customer)
VALUES (orders_seq.NEXTVAL, 1032);

SELECT orders_seq.NEXTVAL FROM dual;
```
