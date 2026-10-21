# SauceDemo: Test Cases

[← Back to project](README.md)

- **Target:** https://www.saucedemo.com/ (public demo store for testing practice). The test users and the shared password are shown on the login page.
- **Status:** all test cases are **Not Run**. Fill in **Actual result** and **Status** only after running them yourself.
- **Status values:** Not Run · Pass · Fail · Blocked
- **Techniques:** EP = equivalence partitioning · BVA = boundary value analysis · DT = decision table · ST = state transition · EG = error guessing

Unless stated otherwise, the precondition is: the user is logged in as `standard_user` and is on the Products page.

## Decision tables

**Login fields** (used for TC-01, TC-04, TC-05, TC-06; the wrong-password case is TC-02)

| Rule | Username | Password | Expected |
|---|---|---|---|
| 1 | valid | valid | Login succeeds (TC-01) |
| 2 | empty | any | "Username is required" error (TC-04) |
| 3 | valid | empty | "Password is required" error (TC-05) |
| 4 | empty | empty | "Username is required" error (TC-06) |

**Checkout fields** (used for TC-24, TC-25, TC-26; "filled" = any non-empty text)

| Rule | First name | Last name | Postal code | Expected |
|---|---|---|---|---|
| 1 | filled | filled | filled | Continue to Overview (TC-22) |
| 2 | empty | filled | filled | First name required (TC-24) |
| 3 | filled | empty | filled | Last name required (TC-25) |
| 4 | filled | filled | empty | Postal code required (TC-26) |
| 5 | empty | empty | empty | First name required (the first missing field). Not a separate test case; check it during TC-24. |

## Login

| ID | Description | Preconditions | Steps | Expected result | Technique | Actual result | Status |
|---|---|---|---|---|---|---|---|
| TC-01 | Login with a valid user | Login page is open | 1. Enter `standard_user`. 2. Enter the password from the login page. 3. Click **Login**. | The Products page opens and shows the product list. | EP (valid) | | Not Run |
| TC-02 | Login with a wrong password | Login page is open | 1. Enter `standard_user`. 2. Enter `wrong_password`. 3. Click **Login**. | Login fails. An error message says the username and password do not match. The user stays on the login page. | EP (invalid) | | Not Run |
| TC-03 | Login with an unknown username | Login page is open | 1. Enter `unknown_user`. 2. Enter the password from the login page. 3. Click **Login**. | Login fails with the same "do not match" error as TC-02. | EP (invalid) | | Not Run |
| TC-04 | Login with empty username | Login page is open | 1. Leave Username empty. 2. Enter any password. 3. Click **Login**. | An error message says the username is required. | DT | | Not Run |
| TC-05 | Login with empty password | Login page is open | 1. Enter `standard_user`. 2. Leave Password empty. 3. Click **Login**. | An error message says the password is required. | DT | | Not Run |
| TC-06 | Login with both fields empty | Login page is open | 1. Leave both fields empty. 2. Click **Login**. | An error message says the username is required (the first missing field). | DT | | Not Run |
| TC-07 | Locked-out user cannot log in | Login page is open | 1. Enter `locked_out_user`. 2. Enter the password from the login page. 3. Click **Login**. | Login fails. An error message says the user is locked out. | EP (special user) | | Not Run |
| TC-08 | Username is case-sensitive | Login page is open | 1. Enter `Standard_User`. 2. Enter the password from the login page. 3. Click **Login**. | Login fails with the "do not match" error. | EG | | Not Run |
| TC-09 | Products page cannot be opened without login | Not logged in (new private window) | 1. Open `https://www.saucedemo.com/inventory.html` directly. | Access is refused, and the login page is shown with an error message. | EG | | Not Run |
| TC-10 | Logout ends the session | Logged in | 1. Open the menu (☰). 2. Click **Logout**. 3. Press the browser **Back** button. | The login page opens after Logout. Going back does not show the Products page without logging in again. | ST | | Not Run |

## Products and sorting

| ID | Description | Preconditions | Steps | Expected result | Technique | Actual result | Status |
|---|---|---|---|---|---|---|---|
| TC-11 | Product list is complete | Default | 1. Look at the Products page. | Every product shows an image, name, description, price, and an **Add to cart** button. Record the number of products. | — | | Not Run |
| TC-12 | Sort by Name (A to Z) | Default | 1. Check the sort order when the page first opens. 2. Select **Name (Z to A)**. 3. Select **Name (A to Z)**. | Step 1: the default sort is Name (A to Z). Step 3: products return to alphabetical order. | EP (sort option) | | Not Run |
| TC-13 | Sort by Name (Z to A) | Default | 1. Select **Name (Z to A)**. | Products are in reverse alphabetical order. | EP | | Not Run |
| TC-14 | Sort by Price (low to high) | Default | 1. Select **Price (low to high)**. | Prices go up from the first product to the last. | EP | | Not Run |
| TC-15 | Sort by Price (high to low) | Default | 1. Select **Price (high to low)**. | Prices go down from the first product to the last. | EP | | Not Run |
| TC-16 | Product details match the list | Default | 1. Note the name and price of one product. 2. Click its name. | The details page shows the same name, description, and price. **Back to products** returns to the list. | — | | Not Run |

## Cart

| ID | Description | Preconditions | Steps | Expected result | Technique | Actual result | Status |
|---|---|---|---|---|---|---|---|
| TC-17 | Cart badge with 0, 1, and all items | Cart is empty | 1. Check the cart icon. 2. Add 1 product. 3. Add every remaining product. | Step 1: no badge (0). Step 2: badge shows 1. Step 3: badge equals the number of products in TC-11. | BVA (0, 1, max) | | Not Run |
| TC-18 | Remove an item from the Products page | 2 products in the cart | 1. Click **Remove** on one of them. | The badge goes down by 1, and the button changes back to **Add to cart**. | ST | | Not Run |
| TC-19 | Cart shows the correct items | 2 products in the cart | 1. Open the cart. | The cart shows exactly those 2 products, with the same names and prices, quantity 1 each. | — | | Not Run |
| TC-20 | Remove an item inside the cart | 2 products in the cart | 1. Open the cart. 2. Click **Remove** on one product. | The product disappears from the cart, and the badge shows 1. | ST | | Not Run |
| TC-21 | Cart keeps items after navigation and reload | 1 product in the cart | 1. Open a product details page. 2. Go back. 3. Reload the page (F5). | The badge still shows 1, and the cart still contains the product. | ST | | Not Run |

## Checkout

| ID | Description | Preconditions | Steps | Expected result | Technique | Actual result | Status |
|---|---|---|---|---|---|---|---|
| TC-22 | Complete a checkout | 2 products in the cart | 1. Open the cart. 2. Click **Checkout**. 3. Enter first name, last name, and postal code. 4. Click **Continue**. 5. Click **Finish**. | The Overview page lists the 2 products. A confirmation page says the order is complete. Afterwards the cart is empty. | — | | Not Run |
| TC-23 | Order total is calculated correctly | 2 products in the cart, on the Overview page | 1. Add up the prices of the products. 2. Compare with **Item total**. 3. Check that **Total** = Item total + Tax. | Item total equals the sum of the prices, and Total = Item total + Tax. | — | | Not Run |
| TC-24 | Checkout requires first name | Your Information page | 1. Leave First Name empty, fill in the other fields. 2. Click **Continue**. | An error message says the first name is required. The user stays on the page. | DT | | Not Run |
| TC-25 | Checkout requires last name | Your Information page | 1. Leave Last Name empty, fill in the other fields. 2. Click **Continue**. | An error message says the last name is required. | DT | | Not Run |
| TC-26 | Checkout requires postal code | Your Information page | 1. Leave Postal Code empty, fill in the other fields. 2. Click **Continue**. | An error message says the postal code is required. | DT | | Not Run |
| TC-27 | Fields with only spaces | Your Information page | 1. Enter a single space in all three fields. 2. Click **Continue**. | Not specified. Expectation: spaces only should count as empty and be rejected. Record what happens. | EG | | Not Run |
| TC-28 | Cancel checkout keeps the cart | Your Information page, 1 product in the cart | 1. Click **Cancel**. | The cart page opens, and the product is still in the cart. | ST | | Not Run |
| TC-29 | Checkout with an empty cart | Cart is empty | 1. Open the cart. 2. Click **Checkout**. 3. Fill in the fields and continue. | Expectation: checkout should not be possible with an empty cart. Record what happens. | BVA (0 items) | | Not Run |

## Other test users

| ID | Description | Preconditions | Steps | Expected result | Technique | Actual result | Status |
|---|---|---|---|---|---|---|---|
| TC-30 | Main flow as `problem_user` | Login page is open | 1. Log in as `problem_user`. 2. Check product images. 3. Sort by **Price (low to high)**. 4. Add 2 products to the cart. 5. Complete checkout. | Same behavior as `standard_user` in TC-11, TC-14, TC-17, and TC-22. | EG | | Not Run |
| TC-31 | Main flow as `performance_glitch_user` | Login page is open | Same steps as TC-30, with `performance_glitch_user`. Note how long login takes. | Same results as `standard_user`. Record any delay in seconds. | EG | | Not Run |
| TC-32 | Main flow as `error_user` | Login page is open | Same steps as TC-30, with `error_user`. | Same results as `standard_user`. | EG | | Not Run |
| TC-33 | Main flow as `visual_user` | Login page is open | Same steps as TC-30, with `visual_user`. Compare the layout with `standard_user`. | Same results and same layout as `standard_user`. | EG | | Not Run |

For TC-30 to TC-33, write a bug report for each difference that you can reproduce twice. These users are designed to show problems, so several bugs are possible.

## Run summary (fill in after execution)

| Executed by | Date | Browser and version | Pass | Fail | Blocked | Not Run |
|---|---|---|---|---|---|---|
| | | | | | | 33 |
