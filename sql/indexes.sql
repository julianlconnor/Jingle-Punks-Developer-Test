CREATE INDEX user_address_index ON addresses(user_id);

/* users.id is already an index because it's the PK */
CREATE INDEX user_id_index ON users(id);

/* roles.id is already an index because it's the PK */
CREATE INDEX role_id_index ON roles(id)