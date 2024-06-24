CREATE TABLE clients (
    client_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    client_name text NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now(),
    
    CONSTRAINT client_name_not_empty CHECK ( trim(client_name) <> '' )
);

REVOKE INSERT (client_id, created_at), UPDATE (client_id, created_at) ON clients FROM PUBLIC;

CREATE TABLE client_contacts (
    client_id uuid NOT NULL REFERENCES clients(client_id)
)