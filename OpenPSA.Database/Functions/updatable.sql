-- A function which will change the updated_at field when changed.
CREATE FUNCTION func_change_updated() RETURNS trigger AS $$
    BEGIN
        new.updated_at := now();
        return new;
    END;
$$ LANGUAGE plpgsql;