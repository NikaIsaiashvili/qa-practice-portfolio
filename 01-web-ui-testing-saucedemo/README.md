# Web UI Testing: E-commerce Flows (SauceDemo)

[← Back to portfolio](../README.md)

**Status:** Test cases written; not executed yet · **Type:** Independent practice

**Target:** [saucedemo.com](https://www.saucedemo.com/), a public demo store made for testing practice. The test accounts and the shared password are listed on its login page.

## Files

| File | Content | Status |
|---|---|---|
| [test-cases.md](test-cases.md) | 33 test cases and 2 decision tables: login, products and sorting, cart, checkout, special test users | Not Run |
| `bug-reports.md` | Bugs found during execution, using the [bug report template](../templates/bug-report-template.md) | To be created after execution |
| `evidence/` | Own screenshots, named by test case (for example `TC-07-locked-out.png`) | To be created after execution |

## Scope and techniques

Login (valid, invalid, empty fields, locked-out user, case sensitivity, direct URL access, logout), sorting (4 options), product details, cart (badge count at 0, 1, and all items; add and remove; persistence after reload), checkout (happy path, total calculation, required fields, spaces-only input, cancel, empty cart), and the main flow for each of the four special test users.

Techniques used: equivalence partitioning, boundary values (0, 1, and all items in the cart), decision tables for the login and checkout fields, state transitions for the cart and session, and error guessing.

## How to run

1. Open https://www.saucedemo.com/ in Chrome (and later a second browser for a comparison run).
2. Run the test cases in [test-cases.md](test-cases.md) in order. Fill in **Actual result** and **Status**.
3. Take a screenshot for every Fail and save it in `evidence/`.
4. For each failure that you can reproduce twice, write a bug report.
5. Fill in the run summary at the end of `test-cases.md`.

## Completed vs to verify

- **Done:** 33 test cases written. No test has been executed, and no results or bugs are recorded.
- **Nika to do:** execute the test cases, record the results, and write bug reports only for problems actually observed.
