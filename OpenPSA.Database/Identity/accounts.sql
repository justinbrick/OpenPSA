-- Accounts responsible for management & maintenance of an application.
-- This makes use of OpenID for authenticating & authorization
CREATE TABLE IF NOT EXISTS management_accounts
(
    account_id  uuid NOT NULL DEFAULT gen_random_uuid(),
    external_id text NOT NULL,
    first_name  text NOT NULL,
    last_name   text NOT NULL,
    PRIMARY KEY (account_id, external_id)
);

REVOKE
    INSERT (account_id),
    UPDATE (account_id)
ON management_accounts FROM PUBLIC;