CREATE DATABASE softjobs;

\c softjobs;

CREATE TABLE usuarios (
  id        SERIAL        NOT NULL,
  email     VARCHAR(50)   NOT NULL  UNIQUE,
  password  VARCHAR(60)   NOT NULL,
  rol       VARCHAR(25)   NOT NULL,
  lenguage  VARCHAR(20)   NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE usuarios ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT NOW();
ALTER TABLE usuarios ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT NOW();

-- Agregamos el TRIGGER

CREATE FUNCTION update_updated_at_usuarios()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_usuarios_updated_at
    BEFORE UPDATE
    ON
        usuarios
    FOR EACH ROW
EXECUTE PROCEDURE update_updated_at_usuarios();

-- Fin del TRIGGER

INSERT INTO usuarios values
(DEFAULT, 'user01@example.com', '123456', 'Administrador', 'English'),
(DEFAULT, 'user02@example.com', '654321', 'CEO', 'English');

SELECT * FROM usuarios;