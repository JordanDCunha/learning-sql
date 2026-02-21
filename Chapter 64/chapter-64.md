# ✅ Chapter 64: XML

## 📘 Definition

XML (Extensible Markup Language) is a flexible data format designed to store and transport structured information.

In SQL (especially SQL Server), XML is often used to:

- Store hierarchical or semi-structured data in a single column
- Parse and query complex datasets using XQuery
- Exchange data between systems or applications

SQL Server provides the `xml` data type, which supports querying and manipulation using built-in methods such as:

- `.nodes()` – Breaks XML into relational row sets
- `.value()` – Extracts a scalar value from an XML node or attribute
- `.query()` – Returns XML fragments using XQuery expressions

---

# 🧩 Example: Querying from XML Data Type

```sql
DECLARE @xmlIN XML = '
<TableData>
    <aaa Main="First">
        <row name="a" value="1" />
        <row name="b" value="2" />
        <row name="c" value="3" />
    </aaa>
    <aaa Main="Second">
        <row name="a" value="3" />
        <row name="b" value="4" />
        <row name="c" value="5" />
    </aaa>
    <aaa Main="Third">
        <row name="a" value="10" />
        <row name="b" value="20" />
        <row name="c" value="30" />
    </aaa>
</TableData>';
```

The XML variable `@xmlIN` contains a hierarchical structure:

- Each `<aaa>` node acts as a group.
- The `Main` attribute acts like a header.
- Each `<row>` element contains name/value pairs.

---

# 🧮 Querying XML Nodes

```sql
SELECT 
    t.col.value('../@Main', 'VARCHAR(10)') AS [Header],
    t.col.value('@name', 'VARCHAR(25)') AS [Name],
    t.col.value('@value', 'VARCHAR(25)') AS [Value]
FROM 
    @xmlIN.nodes('//TableData/aaa/row') AS t(col);
```

---

## 🔍 Explanation

| Function | Purpose |
|----------|----------|
| `.nodes('//TableData/aaa/row')` | Breaks each `<row>` into its own result row |
| `.value('../@Main', 'VARCHAR(10)')` | Extracts the `Main` attribute from parent `<aaa>` |
| `.value('@name', 'VARCHAR(25)')` | Extracts `name` attribute |
| `.value('@value', 'VARCHAR(25)')` | Extracts `value` attribute |

---

## 🧾 Result

| Header | Name | Value |
|--------|------|--------|
| First  | a    | 1      |
| First  | b    | 2      |
| First  | c    | 3      |
| Second | a    | 3      |
| Second | b    | 4      |
| Second | c    | 5      |
| Third  | a    | 10     |
| Third  | b    | 20     |
| Third  | c    | 30     |

💡 This converts hierarchical XML into a flat relational format.

---

# ⚙️ Practical Use Cases

| Use Case | Description |
|-----------|------------|
| Configuration Storage | Store complex app settings in one XML column |
| Data Interchange | Send/receive structured data between systems |
| Auditing | Store record snapshots as XML |
| ETL Processes | Parse XML files into relational tables |

---

# 🧠 Tips

- Use typed XML with an XML Schema Collection when possible.
- Avoid storing extremely large XML directly in tables.
- Consider shredding XML into relational tables for performance.
- Use XML Indexes for faster queries.

---

# ⚙️ Key Takeaways

✅ XML stores hierarchical data inside SQL Server.  
✅ `.nodes()` converts XML into rowsets.  
✅ `.value()` extracts scalar data.  
✅ Great for integration and semi-structured data handling.  
⚠️ Use carefully — performance can suffer without indexing.
