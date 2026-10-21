# SQL Data Checks

[← Back to portfolio](../README.md)

**Status:** Queries ready and executed by the agent; Nika's run pending · **Type:** Independent practice

**Target:** a small synthetic SQLite database. All data is invented and contains data quality problems on purpose. The task is to find them with SQL.

## Files

| File | Content |
|---|---|
| [schema-and-data.sql](schema-and-data.sql) | 4 tables (customers, orders, order_items, payments) with 46 rows |
| [checks.sql](checks.sql) | 14 queries (checks 1–12; 10 is a report), each with a comment |
| [results.md](results.md) | Expected rows, agent-executed results, and a column for Nika's run |

## SQL covered

SELECT and WHERE, LEFT JOIN and JOIN, GROUP BY, HAVING, COUNT / SUM / ROUND / COALESCE, IS NULL checks, NOT IN for allowed values, LIKE for format checks, and GROUP_CONCAT.

## How to run

1. Install [DB Browser for SQLite](https://sqlitebrowser.org/), or use the `sqlite3` command line.
2. Create a new empty database.
3. Run `schema-and-data.sql` (Execute SQL tab).
4. Run each query in `checks.sql` one by one and compare the rows with [results.md](results.md).

With `sqlite3`:
```bash
sqlite3 practice.db < schema-and-data.sql
sqlite3 -header -column practice.db < checks.sql
```

## Completed vs to verify

- **Done:** queries written and executed by the agent; all 14 results match the expected rows (see [results.md](results.md)).
- **Nika to do:** run the queries in a SQL tool, fill in "Nika's result", and be ready to explain each JOIN, GROUP BY, and HAVING in an interview.
