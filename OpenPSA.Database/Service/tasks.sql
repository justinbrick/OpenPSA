-- A task is a basic unit of work that 

CREATE TABLE tasks (
    task_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    task_title text NOT NULL,
    
    CONSTRAINT task_title_not_empty CHECK ( trim(task_title) <> '' )
);

CREATE TABLE task_account_assignments (
    task_id uuid NOT NULL REFERENCES tasks(task_id),
    account_sub text NOT NULL REFERENCES oidc_accounts(subject),
    
    PRIMARY KEY (task_id, account_sub)
)