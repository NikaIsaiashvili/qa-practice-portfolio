# QA Practice Portfolio: Nika Isaiashvili

Manual QA Engineer based in Tbilisi, Georgia. This repository contains independent QA practice on public practice systems and on synthetic data. It does not contain any commercial work.

**Skills practiced:** manual test design (equivalence partitioning, boundary values, decision tables, state transitions) · REST API testing with Postman and Newman · SQL data validation (SQLite) · bug reporting

**Status: in progress.** The test cases, Postman collection, and SQL queries were prepared with AI assistance. Some of them were executed by an AI agent to validate the materials, and those results are labeled as agent runs. My own execution is still pending (see the [verification checklist](NIKA-VERIFICATION-CHECKLIST.md)).

## Projects

| Project | Target | Files | Executed so far |
|---|---|---|---|
| [1. Web UI testing](01-web-ui-testing-saucedemo/README.md) | SauceDemo (public practice store) | 33 test cases, 2 decision tables | Not executed |
| [2. REST API testing](02-api-testing-restful-booker/README.md) | Restful-Booker (public practice API) | Postman collection (17 requests), environment template, results | 11 of 17 requests run by the agent: 15 of 19 assertions passed; 3 negative cases failed |
| [3. SQL data checks](03-sql-data-checks/README.md) | Synthetic SQLite database (included) | Schema and data, 14 queries, results | All 14 queries run by the agent; all match the expected rows |

### 1. Web UI testing (SauceDemo)

- **Purpose:** manual functional and negative testing of an e-commerce flow.
- **Scope:** login, sorting, product details, cart, checkout, required fields, edge cases, and special test users.
- **How to run:** follow [test-cases.md](01-web-ui-testing-saucedemo/test-cases.md) in a browser.
- **Done:** test cases written.
- **To verify:** execution, results, screenshots, and bug reports.

### 2. REST API testing (Restful-Booker)

- **Purpose:** API testing with Postman: status codes, JSON checks, authentication, and negative input.
- **Scope:** GET, POST, PUT, PATCH, DELETE; token authentication; missing fields, wrong types, invalid dates, and requests without a token.
- **How to run:** import the collection and environment ([instructions](02-api-testing-restful-booker/README.md#how-to-run)).
- **Done:** collection built and validated. The agent ran folders 1–2; it observed a 500 response for a missing field, and invalid data accepted with 200 ([results](02-api-testing-restful-booker/results.md)).
- **To verify:** a full run including authentication, and reproducing the three observations.

### 3. SQL data checks

- **Purpose:** data validation with SQL: referential integrity, duplicates, NULLs, totals, and allowed values.
- **Scope:** 14 queries using JOIN, LEFT JOIN, GROUP BY, HAVING, and aggregates.
- **How to run:** load the schema in SQLite and run [checks.sql](03-sql-data-checks/checks.sql).
- **Done:** queries executed by the agent; results recorded ([results](03-sql-data-checks/results.md)).
- **To verify:** my own run and explanation of each query.

## Planned

- [Test design: money transfer form](04-test-design-money-transfer/README.md): a fictional specification is ready; the test design is not started.

## Shared files

- [Templates](templates/README.md) for test cases, bug reports, and test summaries.
- [Verification checklist](NIKA-VERIFICATION-CHECKLIST.md): the steps I complete before publishing.

## Contact

- LinkedIn: [linkedin.com/in/nikaisaiashvili](https://www.linkedin.com/in/nikaisaiashvili)
- GitHub: [github.com/NikaIsaiashvili](https://github.com/NikaIsaiashvili)
