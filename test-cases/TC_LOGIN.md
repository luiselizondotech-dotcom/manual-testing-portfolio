\# Test Cases — Login Module



\*\*Application\*\*: OpenCart Demo (https://demo.opencart.com)

\*\*Module\*\*: User Login

\*\*Author\*\*: Luis Elizondo

\*\*Total Test Cases\*\*: 8



---



\## TC-LOGIN-001 — Successful login with valid credentials



| Field | Detail |

|-------|--------|

| \*\*ID\*\* | TC-LOGIN-001 |

| \*\*Priority\*\* | High |

| \*\*Type\*\* | Positive |

| \*\*Preconditions\*\* | Registered account exists |



\*\*Steps:\*\*

1\. Navigate to https://demo.opencart.com

2\. Click "My Account" in the top navigation

3\. Select "Login" from the dropdown

4\. Enter valid email and password

5\. Click the "Login" button



\*\*Expected Result:\*\* User is redirected to account dashboard.

\*\*Status:\*\* PASS



---



\## TC-LOGIN-002 — Login with incorrect password



| Field | Detail |

|-------|--------|

| \*\*ID\*\* | TC-LOGIN-002 |

| \*\*Priority\*\* | High |

| \*\*Type\*\* | Negative |



\*\*Steps:\*\*

1\. Navigate to the login page

2\. Enter valid email

3\. Enter wrong password

4\. Click Login



\*\*Expected Result:\*\* Error message displayed.

\*\*Status:\*\* PASS



---



\## TC-LOGIN-003 — Login with empty email



| Field | Detail |

|-------|--------|

| \*\*ID\*\* | TC-LOGIN-003 |

| \*\*Priority\*\* | Medium |

| \*\*Type\*\* | Negative |



\*\*Steps:\*\*

1\. Leave email empty

2\. Enter any password

3\. Click Login



\*\*Expected Result:\*\* Validation error shown.

\*\*Status:\*\* PASS



---



\## TC-LOGIN-004 — Login with empty password



| Field | Detail |

|-------|--------|

| \*\*ID\*\* | TC-LOGIN-004 |

| \*\*Priority\*\* | Medium |

| \*\*Type\*\* | Negative |



\*\*Steps:\*\*

1\. Enter valid email

2\. Leave password empty

3\. Click Login



\*\*Expected Result:\*\* Validation error shown.

\*\*Status:\*\* PASS



---



\## TC-LOGIN-005 — Login with unregistered email



| Field | Detail |

|-------|--------|

| \*\*ID\*\* | TC-LOGIN-005 |

| \*\*Priority\*\* | High |

| \*\*Type\*\* | Negative |



\*\*Steps:\*\*

1\. Enter unregistered email

2\. Enter any password

3\. Click Login



\*\*Expected Result:\*\* Error message displayed. User not logged in.

\*\*Status:\*\* PASS



---



\## TC-LOGIN-006 — SQL injection in email field



| Field | Detail |

|-------|--------|

| \*\*ID\*\* | TC-LOGIN-006 |

| \*\*Priority\*\* | Critical |

| \*\*Type\*\* | Security |



\*\*Steps:\*\*

1\. Enter in email: ' OR '1'='1

2\. Enter any password

3\. Click Login



\*\*Expected Result:\*\* Login fails. No unauthorized access.

\*\*Status:\*\* PASS



---



\## TC-LOGIN-007 — Remember Me checkbox



| Field | Detail |

|-------|--------|

| \*\*ID\*\* | TC-LOGIN-007 |

| \*\*Priority\*\* | Low |

| \*\*Type\*\* | Functional |



\*\*Steps:\*\*

1\. Enter valid credentials

2\. Check Remember Me

3\. Click Login

4\. Close and reopen browser



\*\*Expected Result:\*\* User remains logged in.

\*\*Status:\*\* N/A



---



\## TC-LOGIN-008 — Logout functionality



| Field | Detail |

|-------|--------|

| \*\*ID\*\* | TC-LOGIN-008 |

| \*\*Priority\*\* | High |

| \*\*Type\*\* | Positive |

| \*\*Preconditions\*\* | User is logged in |



\*\*Steps:\*\*

1\. Log in with valid credentials

2\. Click My Account

3\. Click Logout



\*\*Expected Result:\*\* Session cleared. User redirected to logout page.

\*\*Status:\*\* PASS

