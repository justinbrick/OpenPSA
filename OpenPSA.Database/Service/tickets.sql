CREATE TABLE IF NOT EXISTS work_order (
    ticket_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    title text NOT NULL,
    updated_at timestamptz NOT NULL DEFAULT now(),
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT title_not_empty CHECK ( trim(title) <> '' )
);

