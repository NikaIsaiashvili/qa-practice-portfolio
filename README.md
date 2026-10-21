# QA Practice Portfolio: Nika Isaiashvili

Independent QA practice on public practice systems and synthetic data. This is not commercial work.

**Status: work in progress.** The materials were prepared with AI assistance. Where tests were run by an AI agent to validate them, the results are labeled as agent runs. My own execution is in progress; see the [verification checklist](NIKA-VERIFICATION-CHECKLIST.md).

My completed assignment work (bug reports, acceptance assessment, defect validation) is in [manual-qa-portfolio](https://github.com/NikaIsaiashvili/manual-qa-portfolio).

## Practice areas

| Area | What is here | Execution status |
|---|---|---|
| [Manual QA testing](01-web-ui-testing-saucedemo/README.md) | 33 structured test cases for the SauceDemo store: positive, negative, and boundary cases, plus 2 decision tables | **Not executed yet.** All cases are marked Not Run. |
| [REST API testing](02-api-testing-restful-booker/README.md) | Importable Postman collection: 17 requests with response assertions and negative scenarios, an environment template, and a results report | **Partly executed by the agent:** 11 of 17 requests, 19 assertions: 15 passed, 4 failed (in 3 negative requests). The 6 requests that need login are not run. My verification is pending. |
| [SQL validation](03-sql-data-checks/README.md) | 14 queries on a synthetic SQLite database: joins, aggregations, duplicate detection, referential integrity, and data consistency | **Executed by the agent** in SQLite; all 14 results match the expected rows. Available for me to reproduce. |

### Manual QA testing

- **Target:** [saucedemo.com](https://www.saucedemo.com/), a public demo store.
- **Covers:** login, sorting, product details, cart, checkout, required fields, and the special test users.
- **Techniques:** equivalence partitioning, boundary values (0, 1, and all items in the cart), decision tables, state transitions, and error guessing.
- **File:** [test-cases.md](01-web-ui-testing-saucedemo/test-cases.md)

### REST API testing

- **Target:** [Restful-Booker](https://restful-booker.herokuapp.com/), a public practice API.
- **Covers:** GET, POST, PUT, PATCH, DELETE; token authentication; missing fields, wrong data types, invalid dates, and requests without a token.
- **Agent-observed behavior** (to be reproduced by me):
  - a missing required field returns 500;
  - a text price is accepted and stored as `null`;
  - checkout before checkin is accepted.

  The API documentation does not define error responses. These are **unexpected behaviors measured against common REST expectations, not failures against documented requirements**.
- **Files:** [collection](02-api-testing-restful-booker/restful-booker.postman_collection.json) · [environment template](02-api-testing-restful-booker/restful-booker.postman_environment.json) · [results](02-api-testing-restful-booker/results.md)

### SQL validation

- **Target:** [synthetic dataset](03-sql-data-checks/schema-and-data.sql) with data problems added on purpose.
- **Covers:** missing references, total mismatches, duplicate payments and emails, NULL checks, invalid values, and a country revenue report.
- **Files:** [checks.sql](03-sql-data-checks/checks.sql) · [results](03-sql-data-checks/results.md)

## Planned

- [Test design: money transfer form](04-test-design-money-transfer/README.md): the specification is written; the test design is not started.

## Other files

- [Templates](templates/README.md) for test cases, bug reports, and test summaries.
- [Verification checklist](NIKA-VERIFICATION-CHECKLIST.md): what I run and record myself.

## Contact

LinkedIn: [linkedin.com/in/nikaisaiashvili](https://www.linkedin.com/in/nikaisaiashvili)
