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
-- Name: celestial_body; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_body (
    celestial_body_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type_of_entity character varying(30)
);


ALTER TABLE public.celestial_body OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance_from_earth_in_lightyears numeric(20,0),
    type_of_galaxy character varying(50),
    has_confirmed_life boolean
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
    name character varying(100) NOT NULL,
    planet_id integer,
    has_liquids boolean,
    type_of_moon character varying(50)
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
-- Name: other_celestial_bodies_celestial_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_celestial_bodies_celestial_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_celestial_bodies_celestial_body_id_seq OWNER TO freecodecamp;

--
-- Name: other_celestial_bodies_celestial_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_celestial_bodies_celestial_body_id_seq OWNED BY public.celestial_body.celestial_body_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    has_life boolean,
    amount_of_moons integer,
    is_gas_planet boolean,
    description text
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
    name character varying(100),
    planetary_system character varying(100),
    galaxy_id integer NOT NULL,
    confirmed_planets_in_orbit integer
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
-- Name: celestial_body celestial_body_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body ALTER COLUMN celestial_body_id SET DEFAULT nextval('public.other_celestial_bodies_celestial_body_id_seq'::regclass);


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
-- Data for Name: celestial_body; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_body VALUES (1, '(67)P/Churyumov-Gerasimenko', 'Comet');
INSERT INTO public.celestial_body VALUES (2, 'Sagittarius A (Sgr A)', 'Black Hole');
INSERT INTO public.celestial_body VALUES (3, 'Orion Nebula (M42)', 'Nebula');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 'Spiral', true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 160000, 'Irregular', false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 200000, 'Irregular', false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 53490000, 'Elliptical', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 2730000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, 'Irregular', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, 'Irregular');
INSERT INTO public.moon VALUES (2, 'Europa', 5, true, 'Regular');
INSERT INTO public.moon VALUES (3, 'Ganymede', 5, true, 'Regular');
INSERT INTO public.moon VALUES (4, 'Io', 5, true, 'Regular');
INSERT INTO public.moon VALUES (5, 'Callisto', 5, false, 'Regular');
INSERT INTO public.moon VALUES (6, 'Titan', 6, true, 'Regular');
INSERT INTO public.moon VALUES (7, 'Enceladus', 6, true, 'Regular');
INSERT INTO public.moon VALUES (8, 'Mimas', 6, false, 'Regular');
INSERT INTO public.moon VALUES (9, 'Triton', 8, true, 'Irregular');
INSERT INTO public.moon VALUES (10, 'Charon', 9, false, 'Irregular');
INSERT INTO public.moon VALUES (11, 'Phobos', 4, false, 'Irregular');
INSERT INTO public.moon VALUES (12, 'Deimos', 4, false, 'Irregular');
INSERT INTO public.moon VALUES (13, 'Lapetus', 6, false, 'Regular');
INSERT INTO public.moon VALUES (14, 'Rhea', 6, false, 'Regular');
INSERT INTO public.moon VALUES (15, 'Oberon', 7, false, 'Regular');
INSERT INTO public.moon VALUES (16, 'Titania', 7, false, 'Regular');
INSERT INTO public.moon VALUES (17, 'Miranda', 7, true, 'Regular');
INSERT INTO public.moon VALUES (18, 'Nereid', 8, true, 'Regular');
INSERT INTO public.moon VALUES (19, 'Proteus', 8, true, 'Regular');
INSERT INTO public.moon VALUES (20, 'Lysithea', 5, true, 'Regular');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 3, false, 0, false, 'Innermost planet of the Solar System, rocky surface, extreme temperature variations.');
INSERT INTO public.planet VALUES (2, 'Venus', 3, false, 0, false, 'Known for its thick atmosphere of carbon dioxide, extreme greenhouse effect, and hot surface temperatures.');
INSERT INTO public.planet VALUES (3, 'Earth', 3, true, 1, false, 'Third planet from the Sun, home to diverse ecosystems and the only known planet with life.');
INSERT INTO public.planet VALUES (4, 'Mars', 3, false, 2, false, 'Reddish appearance due to iron oxide on its surface, polar ice caps, potential for past or present microbial life.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 3, false, 79, true, 'Largest planet in the Solar System, known for its prominent bands of clouds and the Great Red Spot, composed mainly of hydrogen and helium.');
INSERT INTO public.planet VALUES (6, 'Saturn', 3, false, 82, true, 'Known for its extensive ring system, composed mainly of hydrogen and helium.');
INSERT INTO public.planet VALUES (7, 'Uranus', 3, false, 27, true, 'Tilted on its side, unique blue-green color due to methane in its atmosphere.');
INSERT INTO public.planet VALUES (8, 'Neptune', 3, false, 14, true, 'Known for its vibrant blue color, strong winds, and the Great Dark Spot, composed mainly of hydrogen, helium, and traces of methane.');
INSERT INTO public.planet VALUES (9, 'Pluto', 3, false, 5, false, 'Dwarf planet located in the Kuiper Belt, composed mainly of rock and ice.');
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 3, false, NULL, false, 'Exoplanet orbiting within the habitable zone of its host star, similar to Earth in size and potentially habitable.');
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 3, false, NULL, false, 'Exoplanet orbiting within the habitable zone of the ultracool dwarf star TRAPPIST-1, part of a system with several potentially habitable planets.');
INSERT INTO public.planet VALUES (12, 'HD 40307g', 3, false, NULL, false, 'Exoplanet located within the habitable zone of the star HD 40307, potentially capable of supporting liquid water on its surface.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Sun', 'Solar System', 1, 8);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Alpha Centauri', 1, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'Alpha Centauri', 1, 0);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 'Alpha Centauri', 1, 0);
INSERT INTO public.star VALUES (7, 'Bernard''s Star', 'Bernard''s Star System', 1, 0);
INSERT INTO public.star VALUES (8, 'Wolf 359', 'Wolf 359 System', 1, 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: other_celestial_bodies_celestial_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_celestial_bodies_celestial_body_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: celestial_body other_celestial_bodies_celestial_body_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT other_celestial_bodies_celestial_body_id_key UNIQUE (celestial_body_id);


--
-- Name: celestial_body pk_celestial_body_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT pk_celestial_body_id PRIMARY KEY (celestial_body_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: celestial_body unique_celestial_body_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT unique_celestial_body_id UNIQUE (celestial_body_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

