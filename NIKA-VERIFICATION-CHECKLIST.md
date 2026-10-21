# Nika's Verification Checklist

Complete these steps yourself before this repository is made public. Write down what **you** observe. Do not copy expected results into the "Actual" columns.

Estimated time: about 3–4 hours.

## 1. Web UI (SauceDemo): about 90 minutes

- [ ] Run at least these test cases from [test-cases.md](01-web-ui-testing-saucedemo/test-cases.md): **TC-01, TC-02, TC-07, TC-14, TC-17, TC-22, TC-23, TC-24, TC-27, TC-29**. They cover login, a negative case, sorting, cart boundaries, checkout, and validation.
- [ ] Fill in **Actual result** and **Status** for each one you run. Leave the others as Not Run.
- [ ] Run **TC-30 to TC-33** (special test users). For each difference from `standard_user` that you can reproduce twice, take a screenshot and write a bug report in `01-web-ui-testing-saucedemo/bug-reports.md`.
- [ ] If a test user shows no difference, record Pass. Do not create a bug.
- [ ] Fill in the run summary table (your name, date, browser).

## 2. API (Postman): about 60 minutes

- [ ] Import the collection and environment ([how to run](02-api-testing-restful-booker/README.md#how-to-run)).
- [ ] Enter the username and password from the API documentation in the environment. Do not commit them.
- [ ] Run all 17 requests and fill in **Run 2** in [results.md](02-api-testing-restful-booker/results.md).
- [ ] Reproduce API-07, API-08, and API-09 manually in Postman (one request at a time). Note the status code and response body.
- [ ] If you can reproduce one of them, write it as a bug report (expected vs actual, request, response).
- [ ] Be ready to explain: what a 201, 403, 404, and 500 mean; how the token is used in PUT/PATCH/DELETE; and why a 500 for missing input is a problem.

## 3. SQL: about 45 minutes

- [ ] Load [schema-and-data.sql](03-sql-data-checks/schema-and-data.sql) in DB Browser for SQLite.
- [ ] Run every query in [checks.sql](03-sql-data-checks/checks.sql) and fill in "Nika's result" in [results.md](03-sql-data-checks/results.md).
- [ ] For checks 1, 3, 4, 9, and 12, explain in one sentence each why the query uses LEFT JOIN, GROUP BY, or HAVING.
- [ ] Change one value in the data (for example, fix order 105's total to 75), run check 3 again, and confirm that order 105 disappears from the result.

## 4. Before publishing

- [ ] Update the status line in each project README to show what you completed.
- [ ] Make sure no credentials, tokens, or personal data are in any file.
- [ ] Ask for a final review, then decide on publication.
