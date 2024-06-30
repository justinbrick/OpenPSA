-- A task is a basic unit of work that 

CREATE TABLE IF NOT EXISTS tasks (
    task_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    task_title text NOT NULL,
    
    CONSTRAINT task_title_not_empty CHECK ( trim(task_title) <> '' )
);

-- Assignment of people to work on specific tickets
CREATE TABLE IF NOT EXISTS task_account_assignments (
    task_id uuid NOT NULL REFERENCES tasks(task_id) ON DELETE CASCADE,
    account_id uuid NOT NULL REFERENCES management_accounts(account_id) ON DELETE CASCADE,
    assigned_at timestamptz NOT NULL DEFAULT now(),
    PRIMARY KEY (account_id, task_id)
);

REVOKE 
    INSERT (assigned_at), 
    UPDATE 
ON task_account_assignments FROM PUBLIC;

-- Notes that exist for each task.
-- These can be put in by the user responding to ticket email, or the person working the task.
CREATE TABLE IF NOT EXISTS task_notes (
    task_id uuid NOT NULL REFERENCES tasks(task_id),
    task_note_id uuid NOT NULL DEFAULT gen_random_uuid(),
    entered_by uuid NOT NULL REFERENCES management_accounts(account_id),
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    note_text text NOT NULL,
    
    PRIMARY KEY (task_id, task_note_id)
);