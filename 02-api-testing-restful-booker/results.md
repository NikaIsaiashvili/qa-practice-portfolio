# Restful-Booker API: Results

[← Back to project](README.md)

## Run 1: executed by the agent (not by Nika)

| Item | Value |
|---|---|
| Executed by | AI agent, using Newman 6 (Postman command-line runner) |
| Date | 21 October 2026, 15:36 UTC |
| Scope | Folders 1 and 2 (API-01 to API-11). Folder 3 was **not run**, because it needs the login credentials. |
| Environment | `restful-booker.postman_environment.json` (template, no credentials) |
| Totals | 11 requests, 19 assertions: 15 passed, 4 failed. The failures are in 3 negative requests (API-07: 1, API-08: 2, API-09: 1). |

| ID | Request | Expected | Actual | Result |
|---|---|---|---|---|
| API-01 | GET /ping | 201 (documented) | 201 | Pass |
| API-02 | GET /booking | 200, array of `{bookingid}` | 200, as expected | Pass |
| API-03 | POST /booking (valid) | 200, booking echoed back | 200, all fields match | Pass |
| API-04 | GET /booking/{id} | 200, same data | 200, same data | Pass |
| API-05 | GET /booking?firstname&lastname | 200, includes the new ID | 200, includes the ID | Pass |
| API-06 | GET /booking/999999999 | 404 (not documented) | 404 | Pass |
| API-07 | POST /booking without `firstname` | 4xx client error (not documented) | **500 Internal Server Error** | **Fail** |
| API-08 | POST /booking, `totalprice` = "one hundred" | 4xx client error (not documented); stored price not null | **200 OK; booking created with `"totalprice": null`** (both assertions failed) | **Fail** |
| API-09 | POST /booking, checkout before checkin | 4xx client error (not documented) | **200 OK; booking created with the invalid dates** | **Fail** |
| API-10 | PUT /booking/{id} without a token | 403 | 403 | Pass |
| API-11 | DELETE /booking/{id} without a token | 403 | 403 | Pass |

API-12 to API-17 (authentication, PUT, PATCH, DELETE with a token) were not run by the agent.

## Observations

These were observed by the agent. Nika must reproduce them before writing them up as bugs.

1. A missing required field (API-07) causes a server error (500) instead of a validation error (400).
2. A text value for a numeric field (API-08) is accepted and saved as `null`. The data is lost without any error.
3. Invalid date ranges (API-09) are accepted.

**Unexpected behavior vs documented requirements:** the API documentation does not define error responses or input validation. These are unexpected behaviors measured against common REST expectations, not failures against a documented requirement. Restful-Booker is a public practice API, so some of this behavior may be intentional for training.

## Run 2: executed by Nika (to complete)

Run the **whole** collection (folders 1–3) after entering the credentials in the environment. See [README](README.md#how-to-run).

| Item | Value |
|---|---|
| Executed by | Nika Isaiashvili |
| Date | |
| Tool | Postman version … / Newman |
| Totals | requests: … · assertions: … passed / … failed |

| ID | Expected | Actual (status code and key fields) | Result |
|---|---|---|---|
| API-01 | 201 | | |
| API-02 | 200, array | | |
| API-03 | 200, echoed booking | | |
| API-04 | 200, same data | | |
| API-05 | 200, includes ID | | |
| API-06 | 404 | | |
| API-07 | 4xx | | |
| API-08 | 4xx | | |
| API-09 | 4xx | | |
| API-10 | 403 | | |
| API-11 | 403 | | |
| API-12 | 200, token | | |
| API-13 | no token | | |
| API-14 | 200, all fields updated | | |
| API-15 | 200, only firstname changed | | |
| API-16 | 201 (documented) | | |
| API-17 | 404 | | |
