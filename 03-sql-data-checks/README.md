# SQL Data Checks

[← Back to portfolio](../README.md)

**Status:** Not started · **Type:** Independent practice

**Target:** a small synthetic SQLite database in [schema-and-data.sql](schema-and-data.sql). All data is invented. The dataset contains data quality problems on purpose; the task is to find them with SQL.

## Setup

1. Install [DB Browser for SQLite](https://sqlitebrowser.org/) or use the `sqlite3` command line.
2. Create a new database and run `schema-and-data.sql`.

## Checks to write

| # | Check | Typical SQL |
|---|---|---|
| 1 | Orders whose customer does not exist | LEFT JOIN, IS NULL |
| 2 | Payments for orders that do not exist | LEFT JOIN, IS NULL |
| 3 | Orders where `total_amount` differs from the sum of their items | JOIN, GROUP BY, SUM, HAVING |
| 4 | Orders paid more than once | GROUP BY, HAVING COUNT(*) > 1 |
| 5 | Order statuses or payment methods outside the allowed values | WHERE … NOT IN |
| 6 | Items with invalid quantity or price | WHERE |
| 7 | Orders dated in the future | WHERE with date comparison |
| 8 | Customers with missing, invalid, or duplicate emails | WHERE, GROUP BY, HAVING |
| 9 | Orders marked PAID that have no payment | LEFT JOIN, IS NULL |
| 10 | Number of orders and revenue by customer country | JOIN, GROUP BY |

## Deliverables

- [ ] `checks.sql`: one query per check, with a short comment explaining what it looks for
- [ ] `results.md`: for each check, the rows my query returned and what the problem is
- [ ] Short summary: which problems would matter most in a real system, and why

Update the status line above when work starts and when it is complete.
