# REST API Testing (Restful-Booker)

[← Back to portfolio](../README.md)

**Status:** Not started · **Type:** Independent practice

**Target:** [Restful-Booker](https://restful-booker.herokuapp.com/), a public practice API for hotel bookings. Endpoints are described in its [API documentation](https://restful-booker.herokuapp.com/apidoc/index.html).

## Scope

| Area | Examples of what to check |
|---|---|
| Health check | The ping endpoint responds |
| Authentication | Create a token; call protected endpoints with a valid, missing, and invalid token |
| Create | Create a booking; check the response body and status code |
| Read | Get all bookings, filter bookings, get one booking, get a booking that does not exist |
| Update | Full and partial update, with and without authentication |
| Delete | Delete with and without authentication; read the booking after deleting |
| Negative input | Missing fields, wrong data types, invalid dates, very long values |

## Deliverables

- [ ] `restful-booker.postman_collection.json`: requests with Postman tests (status code, response fields, data types)
- [ ] `restful-booker.postman_environment.json`: base URL and variables. Do not commit real tokens.
- [ ] `results.md`: table of request, expected, actual, and pass/fail from my own run
- [ ] `bug-reports.md`: any behavior that differs from the API documentation, using the [bug report template](../templates/bug-report-template.md)

Update the status line above when work starts and when it is complete.
