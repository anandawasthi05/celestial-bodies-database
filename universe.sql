--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    hubble_type text NOT NULL,
    size integer,
    color character varying(50),
    h_presence boolean,
    magnitude numeric(10,3),
    internal_velocity integer,
    he_presence boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    no_of_galaxies_in_million integer NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size integer NOT NULL,
    temp integer,
    mass numeric(20,3),
    life_presence boolean,
    water_presence boolean,
    planet text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size integer NOT NULL,
    temp integer,
    mass numeric(20,3),
    life_presence boolean,
    water_presence boolean,
    solar_system text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    temperature integer NOT NULL,
    size integer,
    mass numeric(20,3),
    spectrum text,
    c_presence boolean,
    he_presence boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 'spiral', 220000, 'blue', false, 20.500, 80, true);
INSERT INTO public.galaxy VALUES (2, 'pinwheel', 'spiral', 170000, 'grey-yellow', false, 21.500, 60, true);
INSERT INTO public.galaxy VALUES (3, 'tadpole', 'elliptical', 390000, 'grey-yellow', true, 19.500, 90, false);
INSERT INTO public.galaxy VALUES (4, 'milky way', 'irregular', 105700, 'yellow', true, 30.500, 100, true);
INSERT INTO public.galaxy VALUES (5, 'whirlpool', 'spiral', 60000, 'yellow', false, 25.600, 50, false);
INSERT INTO public.galaxy VALUES (6, 'sunflower', 'elliptical', 98000, 'grey-yellow', true, 24.300, 60, true);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'spiral', 10);
INSERT INTO public.galaxy_type VALUES (2, 'elliptical', 5);
INSERT INTO public.galaxy_type VALUES (3, 'lenticular', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'himalia', 2256, -326, 1.800, false, false, 'kepler-186f', 1);
INSERT INTO public.moon VALUES (2, 'Jupiter LIX', 1856, -254, 1.200, false, false, 'kepler-11', 2);
INSERT INTO public.moon VALUES (3, 'Pasiphae', 1245, -223, 1.100, false, false, 'kepler-22b', 5);
INSERT INTO public.moon VALUES (4, 'Jupiter LXVIII', 1234, -220, 1.300, false, false, 'HD 209458 B', 4);
INSERT INTO public.moon VALUES (5, 'Elara', 1964, -180, 1.800, false, false, 'kepler-62f', 6);
INSERT INTO public.moon VALUES (6, 'himalia 52', 2256, -326, 1.800, false, false, 'kepler-186f', 1);
INSERT INTO public.moon VALUES (7, 'Jupiter LI', 1856, -254, 1.200, false, false, 'kepler-11', 2);
INSERT INTO public.moon VALUES (8, 'Pasiphae 4', 1245, -223, 1.100, false, false, 'kepler-22b', 5);
INSERT INTO public.moon VALUES (9, 'Jupiter LXVII', 1234, -220, 1.300, false, false, 'HD 209458 B', 4);
INSERT INTO public.moon VALUES (10, 'Elara 10', 1964, -180, 1.800, false, false, 'kepler-62f', 6);
INSERT INTO public.moon VALUES (11, 'himalia 54', 2256, -326, 1.800, false, false, 'kepler-186f', 1);
INSERT INTO public.moon VALUES (12, 'Jupiter LIA', 1856, -254, 1.200, false, false, 'kepler-11', 2);
INSERT INTO public.moon VALUES (13, 'Pasiphae 5', 1245, -223, 1.100, false, false, 'kepler-22b', 5);
INSERT INTO public.moon VALUES (14, 'Jupiter LXV', 1234, -220, 1.300, false, false, 'HD 209458 B', 4);
INSERT INTO public.moon VALUES (15, 'Elara 15', 1964, -180, 1.800, false, false, 'kepler-62f', 6);
INSERT INTO public.moon VALUES (16, 'him64ia 54', 2256, -326, 1.800, false, false, 'kepler-186f', 1);
INSERT INTO public.moon VALUES (17, 'Jupiter L', 1856, -254, 1.200, false, false, 'kepler-11', 2);
INSERT INTO public.moon VALUES (18, 'Pasiphae 1', 1245, -223, 1.100, false, false, 'kepler-22b', 5);
INSERT INTO public.moon VALUES (19, 'Jupiter LX', 1234, -220, 1.300, false, false, 'HD 209458 B', 4);
INSERT INTO public.moon VALUES (20, 'Elara 17', 1964, -180, 1.800, false, false, 'kepler-62f', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'kepler-186f', 4485, 450, 6.400, false, false, 'algol', 6);
INSERT INTO public.planet VALUES (2, 'kepler-11', 4200, 350, 5.200, false, false, 'alpha centauri', 5);
INSERT INTO public.planet VALUES (3, 'gliese 667 Cc', 3200, 250, 4.800, false, false, 'sirius', 1);
INSERT INTO public.planet VALUES (4, 'HD 209458 B', 4425, 250, 6.200, false, false, 'canopus', 2);
INSERT INTO public.planet VALUES (5, 'Kepler-22b', 2252, 150, 6.800, false, false, 'alpha centauri b', 3);
INSERT INTO public.planet VALUES (6, 'Kepler-62f', 1256, 125, 5.400, false, false, 'altair', 4);
INSERT INTO public.planet VALUES (7, 'HD 209458 C', 4425, 250, 6.200, false, false, 'canopus', 2);
INSERT INTO public.planet VALUES (8, 'Kepler-32b', 2252, 150, 6.800, false, false, 'alpha centauri b', 3);
INSERT INTO public.planet VALUES (9, 'Kepler-61f', 1256, 125, 5.400, false, false, 'altair', 4);
INSERT INTO public.planet VALUES (10, 'HD 209458 E', 4425, 250, 6.200, false, false, 'canopus', 2);
INSERT INTO public.planet VALUES (11, 'Kepler-32h', 2252, 150, 6.800, false, false, 'alpha centauri b', 3);
INSERT INTO public.planet VALUES (12, 'Kepler-61g', 1256, 125, 5.400, false, false, 'altair', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sirius', 24, 6, 2.400, 'infrared', false, true, 2);
INSERT INTO public.star VALUES (2, 'canopus', 23, 7, 2.700, 'infrared', false, true, 2);
INSERT INTO public.star VALUES (3, 'alpha centauri B', 22, 5, 2.200, 'visible and infrared', true, true, 4);
INSERT INTO public.star VALUES (4, 'altair', 21, 4, 3.200, 'visible', false, false, 5);
INSERT INTO public.star VALUES (5, 'alpha centauri', 20, 2, 6.400, 'visible', true, true, 4);
INSERT INTO public.star VALUES (6, 'algol', 18, 9, 9.200, 'infrared', false, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_ame_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_ame_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_ame_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_ame_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

