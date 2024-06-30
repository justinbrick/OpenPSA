CREATE TABLE IF NOT EXISTS tickets (
    ticket_id uuid NOT NULL DEFAULT gen_random_uuid(),
    task_id uuid NOT NULL REFERENCES tasks(task_id),
    description text NOT NULL,
    updated_at timestamptz NOT NULL DEFAULT now(),
    created_at timestamptz NOT NULL DEFAULT now(),
    
    PRIMARY KEY (ticket_id, task_id),
    CONSTRAINT description_not_empty CHECK ( trim(description) <> '' )
);

