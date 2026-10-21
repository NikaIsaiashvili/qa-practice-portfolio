# SQL Data Checks: Results

[← Back to project](README.md)

- **Expected results** come from how the synthetic dataset was built: each problem was added to the data on purpose.
- **Agent-executed results:** the AI agent ran [checks.sql](checks.sql) against [schema-and-data.sql](schema-and-data.sql) on 21 October 2026 (latest run after the review fixes), using SQLite (Node.js 22 `node:sqlite`, in-memory database).
- **Nika's run:** still to be done. Fill in the last column after running the queries in DB Browser for SQLite or `sqlite3`.

| Check | What it looks for | Expected rows | Agent result | Match | Nika's result |
|---|---|---|---|---|---|
| 1 | Orders with an unknown customer | order 106 (customer 12) | order 106, customer 12 | Yes | |
| 2 | Payments for unknown orders | payment 1010 (order 999) | payment 1010, order 999, 50.00 | Yes | |
| 3 | Order total ≠ sum of items | orders 105, 111, 112 | 105: 80 vs 75 · 111: 18 vs 0 · 112: 70 vs 65 | Yes | |
| 4 | Order paid more than once | order 103 | order 103: 2 payments, 60.00 total | Yes | |
| 5a | Invalid order status | order 110 (DELIVERED) | order 110, DELIVERED | Yes | |
| 5b | Invalid payment method | payment 1006 (CASH) | payment 1006, CASH | Yes | |
| 6 | Invalid quantity or price | items 12 and 14 | item 12: quantity 0 · item 14: price −5.00 | Yes | |
| 7 | Order dated in the future | order 109 | order 109, 2027-01-15 | Yes | |
| 8a | Missing or invalid email | customers 4 and 8 | 4: NULL · 8: "user8@example" | Yes | |
| 8b | Duplicate email | user2@example.com | customers 2 and 6 | Yes | |
| 9 | PAID order without payment | order 112 | order 112 | Yes | |
| 10 | Report: orders and revenue by country | 4 countries | Georgia 5 / 313.00 · Germany 2 / 135.00 · Armenia 2 / 129.99 · Turkey 2 / 55.50 | Yes | |
| 11 | CANCELLED order with a payment | order 107 | order 107, payment 1007, 60.00 | Yes | |
| 12 | Total paid ≠ order total | order 103 | order 103: total 30.00, paid 60.00 | Yes | |

## Notes

- Check 3 finds order 111 because item 12 has quantity 0, and order 112 because item 14 has a negative price. One wrong item row can make an order total look wrong.
- Check 10 counts every order status, including the CANCELLED order 107 (Georgia, 60.00), and it skips order 106 because its customer does not exist. In a real report you would decide whether cancelled orders count as revenue.
- Check 3 uses LEFT JOIN, so an order without any items would also be reported. In this dataset every order has items, so the result is the same as with an inner JOIN.
- Check 8a uses a simple LIKE pattern. It catches the two problems in this data, but it would not reject every invalid email (for example, one with spaces).
- Check 7 compares with the fixed date `2026-10-21`, so the result does not change over time.

## Summary of data problems found

| Severity (real system) | Problems |
|---|---|
| High | Duplicate payment, so the order is paid twice (103); payment for a non-existent order (1010); PAID order with no payment (112); cancelled order that was not refunded (107); order for a non-existent customer (106) |
| Medium | Order totals that do not match their items (105, 111, 112); negative price and zero quantity; invalid status and payment method |
| Low | Missing, invalid, and duplicate emails; an order dated in the future |
