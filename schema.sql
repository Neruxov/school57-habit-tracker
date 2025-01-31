CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE "user"
(
    id          UUID PRIMARY KEY       DEFAULT uuid_generate_v4(),
    telegram_id BIGINT UNIQUE NOT NULL,
    first_name  TEXT          NOT NULL,
    last_name   TEXT          NOT NULL,
    username    TEXT UNIQUE,
    created_at  DATE          NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE habit
(
    id        UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id   UUID                                                      NOT NULL REFERENCES "user" (id) ON DELETE CASCADE,
    name      TEXT                                                      NOT NULL,
    frequency VARCHAR(10) CHECK (frequency IN ('DAY', 'WEEK', 'MONTH')) NOT NULL
);

CREATE TABLE habit_completions
(
    id           UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    habit_id     UUID NOT NULL REFERENCES habit (id) ON DELETE CASCADE,
    completed_at DATE NOT NULL    DEFAULT CURRENT_DATE
);