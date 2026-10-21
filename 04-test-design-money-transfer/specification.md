# Specification: "QuickSend" money transfer form (fictional)

[← Back to project](README.md)

This is a fictional specification written for test design practice. It does not describe a real product.

## 1. Form fields

| Field | Rules |
|---|---|
| Sender first name, last name | Required. 2–50 characters. Latin or Georgian letters, spaces, and hyphens only. |
| Sender phone | Required. Format `+995` followed by exactly 9 digits. |
| Receiver first name, last name | Same rules as the sender name. |
| Receiver country | Required. One of: Georgia, Armenia, Turkey, Germany. |
| Amount | Required. Currency is GEL. Minimum 10.00, maximum 5,000.00. Up to 2 decimal places. |
| Express delivery | Optional checkbox. |

## 2. Fees

| Amount (GEL) | Standard fee |
|---|---|
| 10.00 – 100.00 | 1.00 GEL flat |
| 100.01 – 1,000.00 | 1% of the amount |
| 1,000.01 – 5,000.00 | 0.8% of the amount, maximum 25.00 GEL |

- Express delivery adds 3.00 GEL to the fee.
- Transfers to Georgia have no fee, but Express delivery still costs 3.00 GEL.
- Fees are rounded to 2 decimal places (half up).
- **Total charged = amount + fee.** The same fee must be shown on the form and on the confirmation screen.

## 3. Limits

- One sender can send at most 10,000.00 GEL per calendar day (sum of amounts, without fees).
- If a new transfer would exceed the daily limit, the form shows an error and the transfer is not created.

## 4. Submission

- The **Send** button is enabled only when all required fields are valid.
- Pressing **Send** opens a confirmation screen with all entered data, the fee, and the total.
- Pressing **Confirm** creates exactly one transfer, even if the button is pressed more than once.
- The user can go back from the confirmation screen to edit the form without losing data.

## 5. Transfer statuses

| From | Event | To |
|---|---|---|
| (new) | Confirm | Submitted |
| Submitted | Compliance check passed | Sent |
| Submitted | Compliance check failed | Rejected |
| Sent | Receiver collects money | Paid |
| Sent | Sender cancels within 30 minutes of Sent | Cancelled |

- Rejected, Paid, and Cancelled are final statuses.
- A cancelled transfer is refunded in full, including the fee.

## 6. Receipt

After confirmation, a receipt shows: transfer number, date and time, sender, receiver, country, amount, fee, total, and status.
