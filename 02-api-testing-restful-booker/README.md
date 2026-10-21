# REST API Testing (Restful-Booker)

[← Back to portfolio](../README.md)

**Status:** Collection ready; full run executed by the agent; Nika's run pending · **Type:** Independent practice

**Target:** [Restful-Booker](https://restful-booker.herokuapp.com/), a public practice API for hotel bookings. Endpoints are described in its [API documentation](https://restful-booker.herokuapp.com/apidoc/index.html).

## Files

| File | Content |
|---|---|
| [restful-booker.postman_collection.json](restful-booker.postman_collection.json) | 17 requests with Postman tests, in 3 folders |
| [restful-booker.postman_environment.json](restful-booker.postman_environment.json) | Environment template. The username and password are empty; never commit real values. |
| [results.md](results.md) | Run 2 (agent, all 17 requests), a note on Run 1, and a blank table for Nika's run (Run 3) |

## Coverage

| Folder | Requests | What is checked |
|---|---|---|
| 1. Health and read | API-01 – API-02 | Health check, list of bookings, response structure |
| 2. Create and read booking (no auth) | API-03 – API-11 | Create, read by ID, filter, not-found ID, missing required field, wrong data type, invalid date range, PUT and DELETE without a token |
| 3. Auth, update, delete | API-12 – API-17 | Token with valid and wrong credentials, PUT, PATCH, DELETE with a token, read after delete |

Each request checks the status code, and most also check JSON fields and data types. Expectations that the API documentation does not define (error codes) are marked "not documented" in the test scripts.

<a id="how-to-run"></a>
## How to run

**Postman:**
1. Import both JSON files (File → Import).
2. Select the "Restful-Booker (template)" environment.
3. Enter `username` and `password` from the API documentation (CreateToken section). Do not save them to the repository.
4. Run the collection with the Collection Runner, in order.

**Newman (command line):**
```bash
npx newman@6 run restful-booker.postman_collection.json -e restful-booker.postman_environment.json --env-var username=<from docs> --env-var password=<from docs>
```

Each run adds test bookings to the shared public API. Folder 3 deletes only the booking from API-03; the bookings created by API-08 and API-09 stay on the API.

## Completed vs to verify

- **Done:** the collection and environment are built; the whole collection (all 3 folders) was executed by the agent in Newman: 28 assertions, 24 passed, 4 failed on three negative cases (see [results.md](results.md)).
- **Nika to do:** run all 3 folders, fill in Run 3, reproduce the four observations, and write any confirmed problem as a bug report using the [bug report template](../templates/bug-report-template.md).
