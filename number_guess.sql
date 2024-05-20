--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    secret_number integer NOT NULL,
    number_of_guesses integer DEFAULT 0,
    game_won boolean DEFAULT false
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO freecodecamp;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 776, 777, true);
INSERT INTO public.games VALUES (2, 1, 140, 141, true);
INSERT INTO public.games VALUES (3, 2, 358, 359, true);
INSERT INTO public.games VALUES (4, 2, 422, 423, true);
INSERT INTO public.games VALUES (5, 1, 647, 650, true);
INSERT INTO public.games VALUES (6, 1, 694, 695, true);
INSERT INTO public.games VALUES (7, 1, 188, 189, true);
INSERT INTO public.games VALUES (8, 1, 364, 9, true);
INSERT INTO public.games VALUES (9, 1, 203, 0, false);
INSERT INTO public.games VALUES (10, 1, 122, 0, false);
INSERT INTO public.games VALUES (11, 1, 836, 0, false);
INSERT INTO public.games VALUES (12, 1, 163, 0, false);
INSERT INTO public.games VALUES (13, 3, 984, 14, true);
INSERT INTO public.games VALUES (14, 4, 931, 932, true);
INSERT INTO public.games VALUES (15, 4, 886, 887, true);
INSERT INTO public.games VALUES (16, 5, 879, 880, true);
INSERT INTO public.games VALUES (17, 5, 284, 285, true);
INSERT INTO public.games VALUES (18, 4, 181, 184, true);
INSERT INTO public.games VALUES (19, 4, 834, 835, true);
INSERT INTO public.games VALUES (20, 4, 1, 2, true);
INSERT INTO public.games VALUES (21, 6, 694, 0, false);
INSERT INTO public.games VALUES (22, 6, 902, 0, false);
INSERT INTO public.games VALUES (23, 6, 731, 0, false);
INSERT INTO public.games VALUES (24, 7, 275, 276, true);
INSERT INTO public.games VALUES (25, 7, 755, 756, true);
INSERT INTO public.games VALUES (26, 8, 441, 442, true);
INSERT INTO public.games VALUES (27, 8, 761, 762, true);
INSERT INTO public.games VALUES (28, 7, 189, 192, true);
INSERT INTO public.games VALUES (29, 7, 666, 667, true);
INSERT INTO public.games VALUES (30, 7, 449, 450, true);
INSERT INTO public.games VALUES (31, 9, 487, 488, true);
INSERT INTO public.games VALUES (32, 9, 386, 387, true);
INSERT INTO public.games VALUES (33, 10, 427, 428, true);
INSERT INTO public.games VALUES (34, 10, 957, 958, true);
INSERT INTO public.games VALUES (35, 9, 490, 493, true);
INSERT INTO public.games VALUES (36, 9, 210, 211, true);
INSERT INTO public.games VALUES (37, 9, 472, 473, true);
INSERT INTO public.games VALUES (38, 11, 564, 565, true);
INSERT INTO public.games VALUES (39, 11, 760, 761, true);
INSERT INTO public.games VALUES (40, 12, 38, 39, true);
INSERT INTO public.games VALUES (41, 12, 792, 793, true);
INSERT INTO public.games VALUES (42, 11, 284, 287, true);
INSERT INTO public.games VALUES (43, 11, 507, 508, true);
INSERT INTO public.games VALUES (44, 11, 818, 819, true);
INSERT INTO public.games VALUES (45, 13, 588, 589, true);
INSERT INTO public.games VALUES (46, 13, 412, 413, true);
INSERT INTO public.games VALUES (47, 14, 355, 356, true);
INSERT INTO public.games VALUES (48, 14, 179, 180, true);
INSERT INTO public.games VALUES (49, 13, 745, 748, true);
INSERT INTO public.games VALUES (50, 13, 310, 311, true);
INSERT INTO public.games VALUES (51, 13, 732, 733, true);
INSERT INTO public.games VALUES (52, 15, 940, 941, true);
INSERT INTO public.games VALUES (53, 15, 180, 181, true);
INSERT INTO public.games VALUES (54, 16, 189, 190, true);
INSERT INTO public.games VALUES (55, 16, 223, 224, true);
INSERT INTO public.games VALUES (56, 15, 821, 824, true);
INSERT INTO public.games VALUES (57, 15, 278, 279, true);
INSERT INTO public.games VALUES (58, 15, 486, 487, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1714078469536');
INSERT INTO public.users VALUES (2, 'user_1714078469535');
INSERT INTO public.users VALUES (3, 'cc');
INSERT INTO public.users VALUES (4, 'user_1716225461115');
INSERT INTO public.users VALUES (5, 'user_1716225461114');
INSERT INTO public.users VALUES (6, 'ii');
INSERT INTO public.users VALUES (7, 'user_1716226919049');
INSERT INTO public.users VALUES (8, 'user_1716226919048');
INSERT INTO public.users VALUES (9, 'user_1716227468765');
INSERT INTO public.users VALUES (10, 'user_1716227468764');
INSERT INTO public.users VALUES (11, 'user_1716228414755');
INSERT INTO public.users VALUES (12, 'user_1716228414754');
INSERT INTO public.users VALUES (13, 'user_1716228919738');
INSERT INTO public.users VALUES (14, 'user_1716228919737');
INSERT INTO public.users VALUES (15, 'user_1716229014995');
INSERT INTO public.users VALUES (16, 'user_1716229014994');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 58, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_id_seq', 16, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

