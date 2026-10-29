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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_visible boolean DEFAULT true NOT NULL,
    orbital_period_years numeric
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    galaxy_type character varying(50),
    distance_from_earth numeric,
    has_life boolean DEFAULT false NOT NULL,
    age_in_millions_of_years integer,
    number_of_stars integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    radius_km integer,
    is_spherical boolean DEFAULT true NOT NULL,
    has_life boolean DEFAULT false NOT NULL
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
    star_id integer NOT NULL,
    description text,
    planet_type character varying(50),
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    distance_from_earth numeric
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
    galaxy_id integer NOT NULL,
    description text,
    star_type character varying(50),
    age_in_millions_of_years integer,
    is_spherical boolean DEFAULT true NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Famous periodic comet', true, 75.3);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Great comet of 1997', true, 2534);
INSERT INTO public.comet VALUES (3, 'Encke', 'Short-period comet', true, 3.3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 0, false, 13600, 100000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large spiral galaxy', 'Spiral', 2537000, false, 10000, 1000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest galaxy in Local Group', 'Spiral', 3000000, false, 12000, 40000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting grand-design spiral galaxy', 'Spiral', 23000000, false, 400, 100000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Peculiar galaxy in Virgo', 'Elliptical', 31000000, false, 13000, 800000000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Satellite galaxy of Milky Way', 'Irregular', 163000, false, 13000, 2000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth''s natural satellite', 1737, true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Moon of Mars', 11, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Moon of Mars', 6, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Volcanic moon of Jupiter', 1821, true, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Icy moon of Jupiter', 1560, true, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon in Solar System', 2634, true, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Cratered moon of Jupiter', 2410, true, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Largest moon of Saturn', 2574, true, false);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 'Moon of Saturn', 763, true, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 'Moon of Saturn', 734, true, false);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'Moon of Saturn', 561, true, false);
INSERT INTO public.moon VALUES (12, 'Titania', 7, 'Largest moon of Uranus', 788, true, false);
INSERT INTO public.moon VALUES (13, 'Oberon', 7, 'Moon of Uranus', 761, true, false);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 'Moon of Uranus', 578, true, false);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 'Moon of Uranus', 584, true, false);
INSERT INTO public.moon VALUES (16, 'Triton', 8, 'Largest moon of Neptune', 1353, true, false);
INSERT INTO public.moon VALUES (17, 'Nereid', 8, 'Moon of Neptune', 170, false, false);
INSERT INTO public.moon VALUES (18, 'Charon', 9, 'Moon of Pluto-like object', 606, true, false);
INSERT INTO public.moon VALUES (19, 'Luna 2', 10, 'Hypothetical moon', 100, false, false);
INSERT INTO public.moon VALUES (20, 'Exomoon X', 11, 'Hypothetical exomoon', 500, true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Smallest planet in Solar System', 'Terrestrial', false, true, 0.39);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Second planet from Sun', 'Terrestrial', false, true, 0.72);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Planet with life', 'Terrestrial', true, true, 1.00);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Red planet', 'Terrestrial', false, true, 1.52);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Largest planet', 'Gas giant', false, true, 5.20);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Planet with rings', 'Gas giant', false, true, 9.58);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice giant', 'Ice giant', false, true, 19.18);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Farthest planet', 'Ice giant', false, true, 30.07);
INSERT INTO public.planet VALUES (9, 'Proxima b', 3, 'Exoplanet around Proxima Centauri', 'Terrestrial', false, true, 4.24);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 2, 'Exoplanet in habitable zone', 'Terrestrial', false, true, 500);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 4, 'Potentially habitable exoplanet', 'Terrestrial', false, true, 40);
INSERT INTO public.planet VALUES (12, '51 Pegasi b', 5, 'First exoplanet around Sun-like star', 'Gas giant', false, true, 50);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Star at center of Solar System', 'G-type', 4600, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'Brightest star in night sky', 'A-type', 242, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'Closest star system', 'G-type', 5300, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Red supergiant in Orion', 'M-type', 10, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'Bright star in Lyra', 'A-type', 455, true);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 'Blue supergiant in Orion', 'B-type', 8, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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

