

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body) VALUES ('dddb8190-b441-4d68-9219-c05e38e086d4', 'Titel 1', 'Inhoud');
INSERT INTO public.posts (id, title, body) VALUES ('f0e83176-5a1b-4bd2-969f-3662c57aee69', 'Title 2', '');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.schema_migrations DISABLE TRIGGER ALL;

INSERT INTO public.schema_migrations (revision) VALUES (1667427007);


ALTER TABLE public.schema_migrations ENABLE TRIGGER ALL;


