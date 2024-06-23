-- Accounts associated with oidc
CREATE TABLE IF NOT EXISTS oidc_accounts (
    subject text PRIMARY KEY,
    email text NOT NULL,
    first_name text,
    last_name text
);

CREATE TABLE IF NOT EXISTS account_logins (
    subject text REFERENCES oidc_accounts(subject)
);