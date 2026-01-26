# 0x00 Web Fundamentals

## Target Information

- Application URL: http://web0x00.hbtn
- Login Endpoint: /login

---

## Reconnaissance

The target web application provides a customer login portal.
The login form uses the POST method and sends user credentials
directly to the /login endpoint.

Observed parameters:
- username
- password

No CSRF protection or client-side validation was identified.

---

## Authentication Testing

Basic authentication tests were performed using invalid credentials.

Result:
- The application correctly rejects invalid login attempts.
- No authentication bypass was observed.

---

## User Enumeration Vulnerability

During further testing, different error messages were returned
based on the validity of the username.

Observed behavior:
- When an invalid username is provided, the application returns:
  "Invalid username provided"
- When a valid username with an incorrect password is provided, the application returns:
  "Wrong username or password provided"

This behavior allows an attacker to enumerate valid usernames
based on the server response.

---

## Impact

User enumeration can assist attackers in identifying valid accounts,
which can later be targeted using brute-force or password spraying attacks.

---

## Conclusion

The application does not suffer from an authentication bypass;
however, it is vulnerable to user enumeration due to improper
error message handling during login attempts.

