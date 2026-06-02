--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

--
-- Name: users_games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users_games (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.users_games OWNER TO freecodecamp;

--
-- Name: users_games_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_games_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_games_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_games_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_games_user_id_seq OWNED BY public.users_games.user_id;


--
-- Name: users_games user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users_games ALTER COLUMN user_id SET DEFAULT nextval('public.users_games_user_id_seq'::regclass);


--
-- Data for Name: users_games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users_games VALUES (1, 'Nicolas', 2, 9);
INSERT INTO public.users_games VALUES (3, 'Sebastian', 1, 11);
INSERT INTO public.users_games VALUES (2, 'Claudia', 2, 12);
INSERT INTO public.users_games VALUES (5, 'user_1780420184239', 2, 402);
INSERT INTO public.users_games VALUES (4, 'user_1780420184240', 5, 105);
INSERT INTO public.users_games VALUES (7, 'user_1780420268621', 2, 819);
INSERT INTO public.users_games VALUES (6, 'user_1780420268622', 5, 104);


--
-- Name: users_games_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_games_user_id_seq', 7, true);


--
-- Name: users_games users_games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users_games
    ADD CONSTRAINT users_games_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

