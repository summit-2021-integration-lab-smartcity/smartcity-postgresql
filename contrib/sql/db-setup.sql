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


SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE SEQUENCE public.toll_station_events_sequence
    START WITH 1000
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.toll_station_events_sequence OWNER TO $POSTGRESQL_USER;

CREATE TABLE public.toll_station_events (
    id bigint NOT NULL,
    toll_station character varying(255),
    license_plate character varying(255),
    lp_status character varying(255),
    lp_timestamp bigint
);

ALTER TABLE public.toll_station_events OWNER TO $POSTGRESQL_USER;

ALTER TABLE ONLY public.toll_station_events ALTER COLUMN id SET DEFAULT nextval('public.toll_station_events_sequence'::regclass);

ALTER TABLE ONLY public.toll_station_events
    ADD CONSTRAINT toll_station_events_pkey PRIMARY KEY (id);

CREATE INDEX idx_license_plate ON public.toll_station_events USING btree (license_plate);
