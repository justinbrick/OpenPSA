CREATE TABLE IF NOT EXISTS clients (
    client_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    client_name text NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    
    CONSTRAINT client_name_not_empty CHECK ( trim(client_name) <> '' )
);

REVOKE INSERT (client_id, created_at), UPDATE (client_id, created_at) ON clients FROM PUBLIC;

-- Contacts associated with the client.
CREATE TABLE IF NOT EXISTS client_contacts (
    client_id uuid NOT NULL REFERENCES clients(client_id),
    contact_id uuid NOT NULL DEFAULT gen_random_uuid(),
    external_id text NOT NULL,
    first_name text NOT NULL,
    last_name text,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    PRIMARY KEY (client_id, contact_id, external_id)
);

REVOKE 
    INSERT (contact_id, created_at, updated_at),
    UPDATE (contact_id, created_at, updated_at)
ON client_contacts FROM PUBLIC;