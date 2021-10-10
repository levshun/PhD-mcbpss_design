--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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

--
-- Name: design_db; Type: DATABASE; Schema: -; Owner: design_admin
--

CREATE DATABASE design_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';


ALTER DATABASE design_db OWNER TO design_admin;

\connect design_db

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
-- Name: abstract_elements; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_elements (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.abstract_elements OWNER TO design_admin;

--
-- Name: abstract_elements_and_base; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_elements_and_base (
    id integer NOT NULL,
    element_id integer,
    base_id integer
);


ALTER TABLE public.abstract_elements_and_base OWNER TO design_admin;

--
-- Name: abstract_elements_and_base_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_elements_and_base_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_elements_and_base_id_seq OWNER TO design_admin;

--
-- Name: abstract_elements_and_base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_elements_and_base_id_seq OWNED BY public.abstract_elements_and_base.id;


--
-- Name: abstract_elements_and_dependencies; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_elements_and_dependencies (
    id integer NOT NULL,
    element_1 integer,
    element_2 integer
);


ALTER TABLE public.abstract_elements_and_dependencies OWNER TO design_admin;

--
-- Name: abstract_elements_and_dependencies_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_elements_and_dependencies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_elements_and_dependencies_id_seq OWNER TO design_admin;

--
-- Name: abstract_elements_and_dependencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_elements_and_dependencies_id_seq OWNED BY public.abstract_elements_and_dependencies.id;


--
-- Name: abstract_elements_and_elements; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_elements_and_elements (
    id integer NOT NULL,
    element_1 integer,
    element_2 integer
);


ALTER TABLE public.abstract_elements_and_elements OWNER TO design_admin;

--
-- Name: abstract_elements_and_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_elements_and_elements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_elements_and_elements_id_seq OWNER TO design_admin;

--
-- Name: abstract_elements_and_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_elements_and_elements_id_seq OWNED BY public.abstract_elements_and_elements.id;


--
-- Name: abstract_elements_and_pins; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_elements_and_pins (
    id integer NOT NULL,
    element_id integer,
    count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.abstract_elements_and_pins OWNER TO design_admin;

--
-- Name: abstract_elements_and_pins_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_elements_and_pins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_elements_and_pins_id_seq OWNER TO design_admin;

--
-- Name: abstract_elements_and_pins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_elements_and_pins_id_seq OWNED BY public.abstract_elements_and_pins.id;


--
-- Name: abstract_elements_and_requirements; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_elements_and_requirements (
    id integer NOT NULL,
    element_id integer,
    requirement_id integer
);


ALTER TABLE public.abstract_elements_and_requirements OWNER TO design_admin;

--
-- Name: abstract_elements_and_requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_elements_and_requirements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_elements_and_requirements_id_seq OWNER TO design_admin;

--
-- Name: abstract_elements_and_requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_elements_and_requirements_id_seq OWNED BY public.abstract_elements_and_requirements.id;


--
-- Name: abstract_elements_and_security; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_elements_and_security (
    id integer NOT NULL,
    element_1 integer,
    element_2 integer
);


ALTER TABLE public.abstract_elements_and_security OWNER TO design_admin;

--
-- Name: abstract_elements_and_security_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_elements_and_security_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_elements_and_security_id_seq OWNER TO design_admin;

--
-- Name: abstract_elements_and_security_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_elements_and_security_id_seq OWNED BY public.abstract_elements_and_security.id;


--
-- Name: abstract_elements_and_subelements; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_elements_and_subelements (
    id integer NOT NULL,
    requirement_id integer,
    element_id integer,
    subelement_id integer
);


ALTER TABLE public.abstract_elements_and_subelements OWNER TO design_admin;

--
-- Name: abstract_elements_and_subelements_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_elements_and_subelements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_elements_and_subelements_id_seq OWNER TO design_admin;

--
-- Name: abstract_elements_and_subelements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_elements_and_subelements_id_seq OWNED BY public.abstract_elements_and_subelements.id;


--
-- Name: abstract_elements_and_types; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_elements_and_types (
    id integer NOT NULL,
    element_id integer,
    type_id integer
);


ALTER TABLE public.abstract_elements_and_types OWNER TO design_admin;

--
-- Name: abstract_elements_and_types_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_elements_and_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_elements_and_types_id_seq OWNER TO design_admin;

--
-- Name: abstract_elements_and_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_elements_and_types_id_seq OWNED BY public.abstract_elements_and_types.id;


--
-- Name: abstract_elements_combination; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_elements_combination (
    id integer NOT NULL,
    element_1 integer,
    element_2 integer
);


ALTER TABLE public.abstract_elements_combination OWNER TO design_admin;

--
-- Name: abstract_elements_combination_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_elements_combination_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_elements_combination_id_seq OWNER TO design_admin;

--
-- Name: abstract_elements_combination_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_elements_combination_id_seq OWNED BY public.abstract_elements_combination.id;


--
-- Name: abstract_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_elements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_elements_id_seq OWNER TO design_admin;

--
-- Name: abstract_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_elements_id_seq OWNED BY public.abstract_elements.id;


--
-- Name: abstract_links; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_links (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.abstract_links OWNER TO design_admin;

--
-- Name: abstract_links_and_abilities; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_links_and_abilities (
    id integer NOT NULL,
    link_id integer,
    ability_id integer
);


ALTER TABLE public.abstract_links_and_abilities OWNER TO design_admin;

--
-- Name: abstract_links_and_abilities_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_links_and_abilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_links_and_abilities_id_seq OWNER TO design_admin;

--
-- Name: abstract_links_and_abilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_links_and_abilities_id_seq OWNED BY public.abstract_links_and_abilities.id;


--
-- Name: abstract_links_and_elements; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_links_and_elements (
    id integer NOT NULL,
    element_1 integer,
    element_2 integer,
    link_id integer
);


ALTER TABLE public.abstract_links_and_elements OWNER TO design_admin;

--
-- Name: abstract_links_and_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_links_and_elements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_links_and_elements_id_seq OWNER TO design_admin;

--
-- Name: abstract_links_and_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_links_and_elements_id_seq OWNED BY public.abstract_links_and_elements.id;


--
-- Name: abstract_links_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_links_id_seq OWNER TO design_admin;

--
-- Name: abstract_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_links_id_seq OWNED BY public.abstract_links.id;


--
-- Name: abstract_subelements; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_subelements (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.abstract_subelements OWNER TO design_admin;

--
-- Name: abstract_subelements_and_base; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_subelements_and_base (
    id integer NOT NULL,
    element_id integer,
    subelement_id integer,
    base_id integer
);


ALTER TABLE public.abstract_subelements_and_base OWNER TO design_admin;

--
-- Name: abstract_subelements_and_base_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_subelements_and_base_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_subelements_and_base_id_seq OWNER TO design_admin;

--
-- Name: abstract_subelements_and_base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_subelements_and_base_id_seq OWNED BY public.abstract_subelements_and_base.id;


--
-- Name: abstract_subelements_and_flash_memory; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_subelements_and_flash_memory (
    id integer NOT NULL,
    element_id integer,
    value integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.abstract_subelements_and_flash_memory OWNER TO design_admin;

--
-- Name: abstract_subelements_and_flash_memory_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_subelements_and_flash_memory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_subelements_and_flash_memory_id_seq OWNER TO design_admin;

--
-- Name: abstract_subelements_and_flash_memory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_subelements_and_flash_memory_id_seq OWNED BY public.abstract_subelements_and_flash_memory.id;


--
-- Name: abstract_subelements_and_security; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.abstract_subelements_and_security (
    id integer NOT NULL,
    element_id integer,
    subelement_id integer,
    security_id integer
);


ALTER TABLE public.abstract_subelements_and_security OWNER TO design_admin;

--
-- Name: abstract_subelements_and_security_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_subelements_and_security_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_subelements_and_security_id_seq OWNER TO design_admin;

--
-- Name: abstract_subelements_and_security_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_subelements_and_security_id_seq OWNED BY public.abstract_subelements_and_security.id;


--
-- Name: abstract_subelements_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.abstract_subelements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abstract_subelements_id_seq OWNER TO design_admin;

--
-- Name: abstract_subelements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.abstract_subelements_id_seq OWNED BY public.abstract_subelements.id;


--
-- Name: access_types; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.access_types (
    id integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.access_types OWNER TO design_admin;

--
-- Name: access_types_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.access_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_types_id_seq OWNER TO design_admin;

--
-- Name: access_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.access_types_id_seq OWNED BY public.access_types.id;


--
-- Name: attack_actions; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.attack_actions (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.attack_actions OWNER TO design_admin;

--
-- Name: attack_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.attack_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attack_actions_id_seq OWNER TO design_admin;

--
-- Name: attack_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.attack_actions_id_seq OWNED BY public.attack_actions.id;


--
-- Name: attack_levels; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.attack_levels (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.attack_levels OWNER TO design_admin;

--
-- Name: attack_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.attack_levels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attack_levels_id_seq OWNER TO design_admin;

--
-- Name: attack_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.attack_levels_id_seq OWNED BY public.attack_levels.id;


--
-- Name: attackers_and_actions; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.attackers_and_actions (
    id integer NOT NULL,
    action_id integer,
    access_id integer,
    knowledge_id integer,
    resources_id integer
);


ALTER TABLE public.attackers_and_actions OWNER TO design_admin;

--
-- Name: attackers_and_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.attackers_and_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attackers_and_actions_id_seq OWNER TO design_admin;

--
-- Name: attackers_and_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.attackers_and_actions_id_seq OWNED BY public.attackers_and_actions.id;


--
-- Name: base_and_communication; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.base_and_communication (
    id integer NOT NULL,
    base_id integer,
    type_id integer
);


ALTER TABLE public.base_and_communication OWNER TO design_admin;

--
-- Name: base_and_communication_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.base_and_communication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_and_communication_id_seq OWNER TO design_admin;

--
-- Name: base_and_communication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.base_and_communication_id_seq OWNED BY public.base_and_communication.id;


--
-- Name: batteries; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.batteries (
    id integer NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    capacity_mah integer NOT NULL,
    current_a double precision NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    weight_g integer NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.batteries OWNER TO design_admin;

--
-- Name: batteries_and_links_between_devices; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.batteries_and_links_between_devices (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.batteries_and_links_between_devices OWNER TO design_admin;

--
-- Name: batteries_and_links_between_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.batteries_and_links_between_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.batteries_and_links_between_devices_id_seq OWNER TO design_admin;

--
-- Name: batteries_and_links_between_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.batteries_and_links_between_devices_id_seq OWNED BY public.batteries_and_links_between_devices.id;


--
-- Name: batteries_and_microcontrollers_for_electronic_components; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.batteries_and_microcontrollers_for_electronic_components (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.batteries_and_microcontrollers_for_electronic_components OWNER TO design_admin;

--
-- Name: batteries_and_microcontrollers_for_electronic_components_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.batteries_and_microcontrollers_for_electronic_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.batteries_and_microcontrollers_for_electronic_components_id_seq OWNER TO design_admin;

--
-- Name: batteries_and_microcontrollers_for_electronic_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.batteries_and_microcontrollers_for_electronic_components_id_seq OWNED BY public.batteries_and_microcontrollers_for_electronic_components.id;


--
-- Name: batteries_and_motor_shields; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.batteries_and_motor_shields (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.batteries_and_motor_shields OWNER TO design_admin;

--
-- Name: batteries_and_motor_shields_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.batteries_and_motor_shields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.batteries_and_motor_shields_id_seq OWNER TO design_admin;

--
-- Name: batteries_and_motor_shields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.batteries_and_motor_shields_id_seq OWNED BY public.batteries_and_motor_shields.id;


--
-- Name: batteries_and_oneboard_computers; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.batteries_and_oneboard_computers (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.batteries_and_oneboard_computers OWNER TO design_admin;

--
-- Name: batteries_and_oneboard_computers_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.batteries_and_oneboard_computers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.batteries_and_oneboard_computers_id_seq OWNER TO design_admin;

--
-- Name: batteries_and_oneboard_computers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.batteries_and_oneboard_computers_id_seq OWNED BY public.batteries_and_oneboard_computers.id;


--
-- Name: batteries_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.batteries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.batteries_id_seq OWNER TO design_admin;

--
-- Name: batteries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.batteries_id_seq OWNED BY public.batteries.id;


--
-- Name: collector_motors; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.collector_motors (
    id integer NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    voltage_v double precision NOT NULL,
    speed_rpm integer NOT NULL,
    energy_ma integer NOT NULL,
    ratio integer NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    weight_g integer NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.collector_motors OWNER TO design_admin;

--
-- Name: collector_motors_and_motor_shields; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.collector_motors_and_motor_shields (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.collector_motors_and_motor_shields OWNER TO design_admin;

--
-- Name: collector_motors_and_motor_shields_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.collector_motors_and_motor_shields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collector_motors_and_motor_shields_id_seq OWNER TO design_admin;

--
-- Name: collector_motors_and_motor_shields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.collector_motors_and_motor_shields_id_seq OWNED BY public.collector_motors_and_motor_shields.id;


--
-- Name: collector_motors_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.collector_motors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collector_motors_id_seq OWNER TO design_admin;

--
-- Name: collector_motors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.collector_motors_id_seq OWNED BY public.collector_motors.id;


--
-- Name: communication_and_actions; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.communication_and_actions (
    id integer NOT NULL,
    type_id integer,
    action_id integer
);


ALTER TABLE public.communication_and_actions OWNER TO design_admin;

--
-- Name: communication_and_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.communication_and_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communication_and_actions_id_seq OWNER TO design_admin;

--
-- Name: communication_and_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.communication_and_actions_id_seq OWNED BY public.communication_and_actions.id;


--
-- Name: communication_levels; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.communication_levels (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.communication_levels OWNER TO design_admin;

--
-- Name: communication_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.communication_levels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communication_levels_id_seq OWNER TO design_admin;

--
-- Name: communication_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.communication_levels_id_seq OWNED BY public.communication_levels.id;


--
-- Name: device_abilities; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.device_abilities (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.device_abilities OWNER TO design_admin;

--
-- Name: device_abilities_and_requirements; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.device_abilities_and_requirements (
    id integer NOT NULL,
    ability_id integer,
    requirement_id integer
);


ALTER TABLE public.device_abilities_and_requirements OWNER TO design_admin;

--
-- Name: device_abilities_and_requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.device_abilities_and_requirements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_abilities_and_requirements_id_seq OWNER TO design_admin;

--
-- Name: device_abilities_and_requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.device_abilities_and_requirements_id_seq OWNED BY public.device_abilities_and_requirements.id;


--
-- Name: device_abilities_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.device_abilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_abilities_id_seq OWNER TO design_admin;

--
-- Name: device_abilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.device_abilities_id_seq OWNED BY public.device_abilities.id;


--
-- Name: device_base; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.device_base (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.device_base OWNER TO design_admin;

--
-- Name: device_base_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.device_base_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_base_id_seq OWNER TO design_admin;

--
-- Name: device_base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.device_base_id_seq OWNED BY public.device_base.id;


--
-- Name: device_recommendations; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.device_recommendations (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.device_recommendations OWNER TO design_admin;

--
-- Name: device_recommendations_and_security; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.device_recommendations_and_security (
    id integer NOT NULL,
    recommendation_id integer,
    security_id integer
);


ALTER TABLE public.device_recommendations_and_security OWNER TO design_admin;

--
-- Name: device_recommendations_and_security_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.device_recommendations_and_security_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_recommendations_and_security_id_seq OWNER TO design_admin;

--
-- Name: device_recommendations_and_security_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.device_recommendations_and_security_id_seq OWNED BY public.device_recommendations_and_security.id;


--
-- Name: device_recommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.device_recommendations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_recommendations_id_seq OWNER TO design_admin;

--
-- Name: device_recommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.device_recommendations_id_seq OWNED BY public.device_recommendations.id;


--
-- Name: device_requirements; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.device_requirements (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.device_requirements OWNER TO design_admin;

--
-- Name: device_requirements_and_base; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.device_requirements_and_base (
    id integer NOT NULL,
    requirement_id integer,
    base_id integer
);


ALTER TABLE public.device_requirements_and_base OWNER TO design_admin;

--
-- Name: device_requirements_and_base_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.device_requirements_and_base_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_requirements_and_base_id_seq OWNER TO design_admin;

--
-- Name: device_requirements_and_base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.device_requirements_and_base_id_seq OWNED BY public.device_requirements_and_base.id;


--
-- Name: device_requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.device_requirements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_requirements_id_seq OWNER TO design_admin;

--
-- Name: device_requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.device_requirements_id_seq OWNED BY public.device_requirements.id;


--
-- Name: device_tasks; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.device_tasks (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.device_tasks OWNER TO design_admin;

--
-- Name: device_tasks_and_abilities; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.device_tasks_and_abilities (
    id integer NOT NULL,
    task_id integer,
    ability_id integer,
    requirement_id integer
);


ALTER TABLE public.device_tasks_and_abilities OWNER TO design_admin;

--
-- Name: device_tasks_and_abilities_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.device_tasks_and_abilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_tasks_and_abilities_id_seq OWNER TO design_admin;

--
-- Name: device_tasks_and_abilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.device_tasks_and_abilities_id_seq OWNED BY public.device_tasks_and_abilities.id;


--
-- Name: device_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.device_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_tasks_id_seq OWNER TO design_admin;

--
-- Name: device_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.device_tasks_id_seq OWNED BY public.device_tasks.id;


--
-- Name: devices_are_linked; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.devices_are_linked (
    id integer NOT NULL,
    ability_1 integer,
    ability_2 integer
);


ALTER TABLE public.devices_are_linked OWNER TO design_admin;

--
-- Name: devices_are_linked_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.devices_are_linked_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_are_linked_id_seq OWNER TO design_admin;

--
-- Name: devices_are_linked_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.devices_are_linked_id_seq OWNED BY public.devices_are_linked.id;


--
-- Name: distance_sensors; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.distance_sensors (
    id integer NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    code text NOT NULL,
    distance_sm integer NOT NULL,
    angle_dg integer NOT NULL,
    voltage_v double precision NOT NULL,
    energy_ma integer NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    weight_g integer NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.distance_sensors OWNER TO design_admin;

--
-- Name: distance_sensors_and_troyka_shields; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.distance_sensors_and_troyka_shields (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.distance_sensors_and_troyka_shields OWNER TO design_admin;

--
-- Name: distance_sensors_and_troyka_shields_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.distance_sensors_and_troyka_shields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distance_sensors_and_troyka_shields_id_seq OWNER TO design_admin;

--
-- Name: distance_sensors_and_troyka_shields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.distance_sensors_and_troyka_shields_id_seq OWNED BY public.distance_sensors_and_troyka_shields.id;


--
-- Name: distance_sensors_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.distance_sensors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distance_sensors_id_seq OWNER TO design_admin;

--
-- Name: distance_sensors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.distance_sensors_id_seq OWNED BY public.distance_sensors.id;


--
-- Name: elements_and_actions; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.elements_and_actions (
    id integer NOT NULL,
    type_id integer,
    action_id integer
);


ALTER TABLE public.elements_and_actions OWNER TO design_admin;

--
-- Name: elements_and_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.elements_and_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elements_and_actions_id_seq OWNER TO design_admin;

--
-- Name: elements_and_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.elements_and_actions_id_seq OWNED BY public.elements_and_actions.id;


--
-- Name: elements_types; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.elements_types (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.elements_types OWNER TO design_admin;

--
-- Name: elements_types_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.elements_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elements_types_id_seq OWNER TO design_admin;

--
-- Name: elements_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.elements_types_id_seq OWNED BY public.elements_types.id;


--
-- Name: encoders; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.encoders (
    id integer NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    voltage_v double precision NOT NULL,
    energy_ma integer NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.encoders OWNER TO design_admin;

--
-- Name: encoders_and_troyka_shields; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.encoders_and_troyka_shields (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.encoders_and_troyka_shields OWNER TO design_admin;

--
-- Name: encoders_and_troyka_shields_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.encoders_and_troyka_shields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encoders_and_troyka_shields_id_seq OWNER TO design_admin;

--
-- Name: encoders_and_troyka_shields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.encoders_and_troyka_shields_id_seq OWNED BY public.encoders_and_troyka_shields.id;


--
-- Name: encoders_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.encoders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.encoders_id_seq OWNER TO design_admin;

--
-- Name: encoders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.encoders_id_seq OWNED BY public.encoders.id;


--
-- Name: knowledge_types; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.knowledge_types (
    id integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.knowledge_types OWNER TO design_admin;

--
-- Name: knowledge_types_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.knowledge_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knowledge_types_id_seq OWNER TO design_admin;

--
-- Name: knowledge_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.knowledge_types_id_seq OWNED BY public.knowledge_types.id;


--
-- Name: levels_and_actions; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.levels_and_actions (
    id integer NOT NULL,
    level_id integer,
    action_id integer
);


ALTER TABLE public.levels_and_actions OWNER TO design_admin;

--
-- Name: levels_and_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.levels_and_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.levels_and_actions_id_seq OWNER TO design_admin;

--
-- Name: levels_and_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.levels_and_actions_id_seq OWNED BY public.levels_and_actions.id;


--
-- Name: links_and_dependencies; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.links_and_dependencies (
    id integer NOT NULL,
    ability_1 integer,
    ability_2 integer,
    element_id integer
);


ALTER TABLE public.links_and_dependencies OWNER TO design_admin;

--
-- Name: links_and_dependencies_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.links_and_dependencies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.links_and_dependencies_id_seq OWNER TO design_admin;

--
-- Name: links_and_dependencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.links_and_dependencies_id_seq OWNED BY public.links_and_dependencies.id;


--
-- Name: links_between_devices; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.links_between_devices (
    id integer NOT NULL,
    name text NOT NULL,
    interface text NOT NULL,
    protocol text NOT NULL,
    wireless boolean NOT NULL,
    directed boolean NOT NULL,
    data boolean NOT NULL,
    charge boolean NOT NULL,
    signal boolean NOT NULL,
    access_point boolean NOT NULL,
    encryption boolean NOT NULL,
    authentication boolean NOT NULL,
    range integer NOT NULL,
    speed integer NOT NULL
);


ALTER TABLE public.links_between_devices OWNER TO design_admin;

--
-- Name: links_between_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.links_between_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.links_between_devices_id_seq OWNER TO design_admin;

--
-- Name: links_between_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.links_between_devices_id_seq OWNED BY public.links_between_devices.id;


--
-- Name: mcs_for_ws_communication; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.mcs_for_ws_communication (
    id integer NOT NULL,
    name text NOT NULL,
    interface text NOT NULL,
    type text NOT NULL,
    code text NOT NULL,
    frequency_ghz double precision NOT NULL,
    flash_kb integer NOT NULL,
    voltage_v double precision NOT NULL,
    energy_ma integer NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.mcs_for_ws_communication OWNER TO design_admin;

--
-- Name: mcs_for_ws_communication_and_compatibility; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.mcs_for_ws_communication_and_compatibility (
    id integer NOT NULL,
    option_id integer,
    requirement_id integer
);


ALTER TABLE public.mcs_for_ws_communication_and_compatibility OWNER TO design_admin;

--
-- Name: mcs_for_ws_communication_and_compatibility_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.mcs_for_ws_communication_and_compatibility_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mcs_for_ws_communication_and_compatibility_id_seq OWNER TO design_admin;

--
-- Name: mcs_for_ws_communication_and_compatibility_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.mcs_for_ws_communication_and_compatibility_id_seq OWNED BY public.mcs_for_ws_communication_and_compatibility.id;


--
-- Name: mcs_for_ws_communication_and_links_between_devices; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.mcs_for_ws_communication_and_links_between_devices (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.mcs_for_ws_communication_and_links_between_devices OWNER TO design_admin;

--
-- Name: mcs_for_ws_communication_and_links_between_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.mcs_for_ws_communication_and_links_between_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mcs_for_ws_communication_and_links_between_devices_id_seq OWNER TO design_admin;

--
-- Name: mcs_for_ws_communication_and_links_between_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.mcs_for_ws_communication_and_links_between_devices_id_seq OWNED BY public.mcs_for_ws_communication_and_links_between_devices.id;


--
-- Name: mcs_for_ws_communication_and_troyka_shields; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.mcs_for_ws_communication_and_troyka_shields (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.mcs_for_ws_communication_and_troyka_shields OWNER TO design_admin;

--
-- Name: mcs_for_ws_communication_and_troyka_shields_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.mcs_for_ws_communication_and_troyka_shields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mcs_for_ws_communication_and_troyka_shields_id_seq OWNER TO design_admin;

--
-- Name: mcs_for_ws_communication_and_troyka_shields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.mcs_for_ws_communication_and_troyka_shields_id_seq OWNED BY public.mcs_for_ws_communication_and_troyka_shields.id;


--
-- Name: mcs_for_ws_communication_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.mcs_for_ws_communication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mcs_for_ws_communication_id_seq OWNER TO design_admin;

--
-- Name: mcs_for_ws_communication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.mcs_for_ws_communication_id_seq OWNED BY public.mcs_for_ws_communication.id;


--
-- Name: micro_sds; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.micro_sds (
    id integer NOT NULL,
    name text NOT NULL,
    memory_gb integer NOT NULL,
    class integer NOT NULL,
    speed_mbs integer NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.micro_sds OWNER TO design_admin;

--
-- Name: micro_sds_and_oneboard_computers; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.micro_sds_and_oneboard_computers (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.micro_sds_and_oneboard_computers OWNER TO design_admin;

--
-- Name: micro_sds_and_oneboard_computers_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.micro_sds_and_oneboard_computers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.micro_sds_and_oneboard_computers_id_seq OWNER TO design_admin;

--
-- Name: micro_sds_and_oneboard_computers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.micro_sds_and_oneboard_computers_id_seq OWNED BY public.micro_sds_and_oneboard_computers.id;


--
-- Name: micro_sds_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.micro_sds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.micro_sds_id_seq OWNER TO design_admin;

--
-- Name: micro_sds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.micro_sds_id_seq OWNED BY public.micro_sds.id;


--
-- Name: microcontrollers_for_electronic_components; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.microcontrollers_for_electronic_components (
    id integer NOT NULL,
    name text NOT NULL,
    cpu text NOT NULL,
    clock_fq_mhz integer NOT NULL,
    flash_kb integer NOT NULL,
    voltage_v double precision NOT NULL,
    current_a double precision NOT NULL,
    pins integer NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.microcontrollers_for_electronic_components OWNER TO design_admin;

--
-- Name: microcontrollers_for_electronic_components_and_compatibility; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.microcontrollers_for_electronic_components_and_compatibility (
    id integer NOT NULL,
    option_id integer,
    requirement_id integer
);


ALTER TABLE public.microcontrollers_for_electronic_components_and_compatibility OWNER TO design_admin;

--
-- Name: microcontrollers_for_electronic_components_and_compatibi_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.microcontrollers_for_electronic_components_and_compatibi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.microcontrollers_for_electronic_components_and_compatibi_id_seq OWNER TO design_admin;

--
-- Name: microcontrollers_for_electronic_components_and_compatibi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.microcontrollers_for_electronic_components_and_compatibi_id_seq OWNED BY public.microcontrollers_for_electronic_components_and_compatibility.id;


--
-- Name: microcontrollers_for_electronic_components_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.microcontrollers_for_electronic_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.microcontrollers_for_electronic_components_id_seq OWNER TO design_admin;

--
-- Name: microcontrollers_for_electronic_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.microcontrollers_for_electronic_components_id_seq OWNED BY public.microcontrollers_for_electronic_components.id;


--
-- Name: motion_sensors; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.motion_sensors (
    id integer NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    code text NOT NULL,
    voltage_v double precision NOT NULL,
    energy_ma double precision NOT NULL,
    angle_g integer NOT NULL,
    range_m integer NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    weight_g integer NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.motion_sensors OWNER TO design_admin;

--
-- Name: motion_sensors_and_troyka_shields; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.motion_sensors_and_troyka_shields (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.motion_sensors_and_troyka_shields OWNER TO design_admin;

--
-- Name: motion_sensors_and_troyka_shields_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.motion_sensors_and_troyka_shields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motion_sensors_and_troyka_shields_id_seq OWNER TO design_admin;

--
-- Name: motion_sensors_and_troyka_shields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.motion_sensors_and_troyka_shields_id_seq OWNED BY public.motion_sensors_and_troyka_shields.id;


--
-- Name: motion_sensors_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.motion_sensors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motion_sensors_id_seq OWNER TO design_admin;

--
-- Name: motion_sensors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.motion_sensors_id_seq OWNED BY public.motion_sensors.id;


--
-- Name: motor_shields; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.motor_shields (
    id integer NOT NULL,
    name text NOT NULL,
    driver text NOT NULL,
    motors integer NOT NULL,
    voltage_v double precision NOT NULL,
    current_a double precision NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.motor_shields OWNER TO design_admin;

--
-- Name: motor_shields_and_microcontrollers_for_electronic_components; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.motor_shields_and_microcontrollers_for_electronic_components (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.motor_shields_and_microcontrollers_for_electronic_components OWNER TO design_admin;

--
-- Name: motor_shields_and_microcontrollers_for_electronic_compon_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.motor_shields_and_microcontrollers_for_electronic_compon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motor_shields_and_microcontrollers_for_electronic_compon_id_seq OWNER TO design_admin;

--
-- Name: motor_shields_and_microcontrollers_for_electronic_compon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.motor_shields_and_microcontrollers_for_electronic_compon_id_seq OWNED BY public.motor_shields_and_microcontrollers_for_electronic_components.id;


--
-- Name: motor_shields_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.motor_shields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.motor_shields_id_seq OWNER TO design_admin;

--
-- Name: motor_shields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.motor_shields_id_seq OWNED BY public.motor_shields.id;


--
-- Name: noise_sensors; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.noise_sensors (
    id integer NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    code text NOT NULL,
    voltage_v double precision NOT NULL,
    energy_ma integer NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.noise_sensors OWNER TO design_admin;

--
-- Name: noise_sensors_and_troyka_shields; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.noise_sensors_and_troyka_shields (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.noise_sensors_and_troyka_shields OWNER TO design_admin;

--
-- Name: noise_sensors_and_troyka_shields_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.noise_sensors_and_troyka_shields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.noise_sensors_and_troyka_shields_id_seq OWNER TO design_admin;

--
-- Name: noise_sensors_and_troyka_shields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.noise_sensors_and_troyka_shields_id_seq OWNED BY public.noise_sensors_and_troyka_shields.id;


--
-- Name: noise_sensors_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.noise_sensors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.noise_sensors_id_seq OWNER TO design_admin;

--
-- Name: noise_sensors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.noise_sensors_id_seq OWNED BY public.noise_sensors.id;


--
-- Name: oneboard_computers; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.oneboard_computers (
    id integer NOT NULL,
    name text NOT NULL,
    soc text NOT NULL,
    arm text NOT NULL,
    soc_fq_ghz double precision NOT NULL,
    ram_gb double precision NOT NULL,
    voltage_v double precision NOT NULL,
    current_a double precision NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    price_rub double precision NOT NULL,
    energy_ma double precision NOT NULL
);


ALTER TABLE public.oneboard_computers OWNER TO design_admin;

--
-- Name: oneboard_computers_and_compatibility; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.oneboard_computers_and_compatibility (
    id integer NOT NULL,
    option_id integer,
    requirement_id integer
);


ALTER TABLE public.oneboard_computers_and_compatibility OWNER TO design_admin;

--
-- Name: oneboard_computers_and_compatibility_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.oneboard_computers_and_compatibility_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oneboard_computers_and_compatibility_id_seq OWNER TO design_admin;

--
-- Name: oneboard_computers_and_compatibility_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.oneboard_computers_and_compatibility_id_seq OWNED BY public.oneboard_computers_and_compatibility.id;


--
-- Name: oneboard_computers_and_links_between_devices; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.oneboard_computers_and_links_between_devices (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.oneboard_computers_and_links_between_devices OWNER TO design_admin;

--
-- Name: oneboard_computers_and_links_between_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.oneboard_computers_and_links_between_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oneboard_computers_and_links_between_devices_id_seq OWNER TO design_admin;

--
-- Name: oneboard_computers_and_links_between_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.oneboard_computers_and_links_between_devices_id_seq OWNED BY public.oneboard_computers_and_links_between_devices.id;


--
-- Name: oneboard_computers_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.oneboard_computers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oneboard_computers_id_seq OWNER TO design_admin;

--
-- Name: oneboard_computers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.oneboard_computers_id_seq OWNED BY public.oneboard_computers.id;


--
-- Name: operating_systems_32bit; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.operating_systems_32bit (
    id integer NOT NULL,
    name text NOT NULL,
    extra text NOT NULL,
    version text NOT NULL,
    size_mb integer NOT NULL
);


ALTER TABLE public.operating_systems_32bit OWNER TO design_admin;

--
-- Name: operating_systems_32bit_and_compatibility; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.operating_systems_32bit_and_compatibility (
    id integer NOT NULL,
    option_id integer,
    requirement_id integer
);


ALTER TABLE public.operating_systems_32bit_and_compatibility OWNER TO design_admin;

--
-- Name: operating_systems_32bit_and_compatibility_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.operating_systems_32bit_and_compatibility_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operating_systems_32bit_and_compatibility_id_seq OWNER TO design_admin;

--
-- Name: operating_systems_32bit_and_compatibility_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.operating_systems_32bit_and_compatibility_id_seq OWNED BY public.operating_systems_32bit_and_compatibility.id;


--
-- Name: operating_systems_32bit_and_oneboard_computers; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.operating_systems_32bit_and_oneboard_computers (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.operating_systems_32bit_and_oneboard_computers OWNER TO design_admin;

--
-- Name: operating_systems_32bit_and_oneboard_computers_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.operating_systems_32bit_and_oneboard_computers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operating_systems_32bit_and_oneboard_computers_id_seq OWNER TO design_admin;

--
-- Name: operating_systems_32bit_and_oneboard_computers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.operating_systems_32bit_and_oneboard_computers_id_seq OWNED BY public.operating_systems_32bit_and_oneboard_computers.id;


--
-- Name: operating_systems_32bit_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.operating_systems_32bit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operating_systems_32bit_id_seq OWNER TO design_admin;

--
-- Name: operating_systems_32bit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.operating_systems_32bit_id_seq OWNED BY public.operating_systems_32bit.id;


--
-- Name: resources_types; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.resources_types (
    id integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.resources_types OWNER TO design_admin;

--
-- Name: resources_types_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.resources_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resources_types_id_seq OWNER TO design_admin;

--
-- Name: resources_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.resources_types_id_seq OWNED BY public.resources_types.id;


--
-- Name: security_and_actions; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.security_and_actions (
    id integer NOT NULL,
    element_id integer,
    action_id integer
);


ALTER TABLE public.security_and_actions OWNER TO design_admin;

--
-- Name: security_and_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.security_and_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.security_and_actions_id_seq OWNER TO design_admin;

--
-- Name: security_and_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.security_and_actions_id_seq OWNED BY public.security_and_actions.id;


--
-- Name: security_and_levels; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.security_and_levels (
    id integer NOT NULL,
    element_id integer,
    level_id integer
);


ALTER TABLE public.security_and_levels OWNER TO design_admin;

--
-- Name: security_and_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.security_and_levels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.security_and_levels_id_seq OWNER TO design_admin;

--
-- Name: security_and_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.security_and_levels_id_seq OWNED BY public.security_and_levels.id;


--
-- Name: security_elements; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.security_elements (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.security_elements OWNER TO design_admin;

--
-- Name: security_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.security_elements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.security_elements_id_seq OWNER TO design_admin;

--
-- Name: security_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.security_elements_id_seq OWNED BY public.security_elements.id;


--
-- Name: selectable_elements; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.selectable_elements (
    id integer NOT NULL,
    element_id integer
);


ALTER TABLE public.selectable_elements OWNER TO design_admin;

--
-- Name: selectable_elements_and_db_tables; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.selectable_elements_and_db_tables (
    id integer NOT NULL,
    element_id integer,
    table_name text NOT NULL
);


ALTER TABLE public.selectable_elements_and_db_tables OWNER TO design_admin;

--
-- Name: selectable_elements_and_db_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.selectable_elements_and_db_tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.selectable_elements_and_db_tables_id_seq OWNER TO design_admin;

--
-- Name: selectable_elements_and_db_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.selectable_elements_and_db_tables_id_seq OWNED BY public.selectable_elements_and_db_tables.id;


--
-- Name: selectable_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.selectable_elements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.selectable_elements_id_seq OWNER TO design_admin;

--
-- Name: selectable_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.selectable_elements_id_seq OWNED BY public.selectable_elements.id;


--
-- Name: servo_drives; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.servo_drives (
    id integer NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    rotation_dg integer NOT NULL,
    rot_mom_kgsm double precision NOT NULL,
    rot_speed_s double precision NOT NULL,
    voltage_v double precision NOT NULL,
    energy_ma integer NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    weight_g integer NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.servo_drives OWNER TO design_admin;

--
-- Name: servo_drives_and_troyka_shields; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.servo_drives_and_troyka_shields (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.servo_drives_and_troyka_shields OWNER TO design_admin;

--
-- Name: servo_drives_and_troyka_shields_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.servo_drives_and_troyka_shields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servo_drives_and_troyka_shields_id_seq OWNER TO design_admin;

--
-- Name: servo_drives_and_troyka_shields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.servo_drives_and_troyka_shields_id_seq OWNED BY public.servo_drives_and_troyka_shields.id;


--
-- Name: servo_drives_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.servo_drives_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servo_drives_id_seq OWNER TO design_admin;

--
-- Name: servo_drives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.servo_drives_id_seq OWNED BY public.servo_drives.id;


--
-- Name: sql_databases; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.sql_databases (
    id integer NOT NULL,
    name text NOT NULL,
    os text NOT NULL,
    "bit" integer NOT NULL,
    version text NOT NULL,
    size_mb integer NOT NULL
);


ALTER TABLE public.sql_databases OWNER TO design_admin;

--
-- Name: sql_databases_and_compatibility; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.sql_databases_and_compatibility (
    id integer NOT NULL,
    option_id integer,
    requirement_id integer
);


ALTER TABLE public.sql_databases_and_compatibility OWNER TO design_admin;

--
-- Name: sql_databases_and_compatibility_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.sql_databases_and_compatibility_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sql_databases_and_compatibility_id_seq OWNER TO design_admin;

--
-- Name: sql_databases_and_compatibility_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.sql_databases_and_compatibility_id_seq OWNED BY public.sql_databases_and_compatibility.id;


--
-- Name: sql_databases_and_operating_systems_32bit; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.sql_databases_and_operating_systems_32bit (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.sql_databases_and_operating_systems_32bit OWNER TO design_admin;

--
-- Name: sql_databases_and_operating_systems_32bit_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.sql_databases_and_operating_systems_32bit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sql_databases_and_operating_systems_32bit_id_seq OWNER TO design_admin;

--
-- Name: sql_databases_and_operating_systems_32bit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.sql_databases_and_operating_systems_32bit_id_seq OWNED BY public.sql_databases_and_operating_systems_32bit.id;


--
-- Name: sql_databases_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.sql_databases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sql_databases_id_seq OWNER TO design_admin;

--
-- Name: sql_databases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.sql_databases_id_seq OWNED BY public.sql_databases.id;


--
-- Name: system_abilities; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.system_abilities (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.system_abilities OWNER TO design_admin;

--
-- Name: system_abilities_and_requirements; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.system_abilities_and_requirements (
    id integer NOT NULL,
    ability_id integer,
    requirement_id integer
);


ALTER TABLE public.system_abilities_and_requirements OWNER TO design_admin;

--
-- Name: system_abilities_and_requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.system_abilities_and_requirements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_abilities_and_requirements_id_seq OWNER TO design_admin;

--
-- Name: system_abilities_and_requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.system_abilities_and_requirements_id_seq OWNED BY public.system_abilities_and_requirements.id;


--
-- Name: system_abilities_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.system_abilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_abilities_id_seq OWNER TO design_admin;

--
-- Name: system_abilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.system_abilities_id_seq OWNED BY public.system_abilities.id;


--
-- Name: system_recommendations; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.system_recommendations (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.system_recommendations OWNER TO design_admin;

--
-- Name: system_recommendations_and_security; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.system_recommendations_and_security (
    id integer NOT NULL,
    recommendation_id integer,
    security_id integer
);


ALTER TABLE public.system_recommendations_and_security OWNER TO design_admin;

--
-- Name: system_recommendations_and_security_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.system_recommendations_and_security_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_recommendations_and_security_id_seq OWNER TO design_admin;

--
-- Name: system_recommendations_and_security_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.system_recommendations_and_security_id_seq OWNED BY public.system_recommendations_and_security.id;


--
-- Name: system_recommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.system_recommendations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_recommendations_id_seq OWNER TO design_admin;

--
-- Name: system_recommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.system_recommendations_id_seq OWNED BY public.system_recommendations.id;


--
-- Name: system_requirements; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.system_requirements (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.system_requirements OWNER TO design_admin;

--
-- Name: system_requirements_and_tasks; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.system_requirements_and_tasks (
    id integer NOT NULL,
    requirement_id integer,
    task_id integer
);


ALTER TABLE public.system_requirements_and_tasks OWNER TO design_admin;

--
-- Name: system_requirements_and_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.system_requirements_and_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_requirements_and_tasks_id_seq OWNER TO design_admin;

--
-- Name: system_requirements_and_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.system_requirements_and_tasks_id_seq OWNED BY public.system_requirements_and_tasks.id;


--
-- Name: system_requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.system_requirements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_requirements_id_seq OWNER TO design_admin;

--
-- Name: system_requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.system_requirements_id_seq OWNED BY public.system_requirements.id;


--
-- Name: system_tasks; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.system_tasks (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.system_tasks OWNER TO design_admin;

--
-- Name: system_tasks_and_abilities; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.system_tasks_and_abilities (
    id integer NOT NULL,
    task_id integer,
    ability_id integer
);


ALTER TABLE public.system_tasks_and_abilities OWNER TO design_admin;

--
-- Name: system_tasks_and_abilities_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.system_tasks_and_abilities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_tasks_and_abilities_id_seq OWNER TO design_admin;

--
-- Name: system_tasks_and_abilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.system_tasks_and_abilities_id_seq OWNED BY public.system_tasks_and_abilities.id;


--
-- Name: system_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.system_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_tasks_id_seq OWNER TO design_admin;

--
-- Name: system_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.system_tasks_id_seq OWNED BY public.system_tasks.id;


--
-- Name: touch_sensors; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.touch_sensors (
    id integer NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    code text NOT NULL,
    voltage_v double precision NOT NULL,
    energy_ma integer NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.touch_sensors OWNER TO design_admin;

--
-- Name: touch_sensors_and_troyka_shields; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.touch_sensors_and_troyka_shields (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.touch_sensors_and_troyka_shields OWNER TO design_admin;

--
-- Name: touch_sensors_and_troyka_shields_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.touch_sensors_and_troyka_shields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.touch_sensors_and_troyka_shields_id_seq OWNER TO design_admin;

--
-- Name: touch_sensors_and_troyka_shields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.touch_sensors_and_troyka_shields_id_seq OWNED BY public.touch_sensors_and_troyka_shields.id;


--
-- Name: touch_sensors_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.touch_sensors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.touch_sensors_id_seq OWNER TO design_admin;

--
-- Name: touch_sensors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.touch_sensors_id_seq OWNED BY public.touch_sensors.id;


--
-- Name: troyka_shields; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.troyka_shields (
    id integer NOT NULL,
    name text NOT NULL,
    svg integer NOT NULL,
    i2c integer NOT NULL,
    spi integer NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.troyka_shields OWNER TO design_admin;

--
-- Name: troyka_shields_and_microcontrollers_for_electronic_components; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.troyka_shields_and_microcontrollers_for_electronic_components (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.troyka_shields_and_microcontrollers_for_electronic_components OWNER TO design_admin;

--
-- Name: troyka_shields_and_microcontrollers_for_electronic_compo_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.troyka_shields_and_microcontrollers_for_electronic_compo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.troyka_shields_and_microcontrollers_for_electronic_compo_id_seq OWNER TO design_admin;

--
-- Name: troyka_shields_and_microcontrollers_for_electronic_compo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.troyka_shields_and_microcontrollers_for_electronic_compo_id_seq OWNED BY public.troyka_shields_and_microcontrollers_for_electronic_components.id;


--
-- Name: troyka_shields_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.troyka_shields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.troyka_shields_id_seq OWNER TO design_admin;

--
-- Name: troyka_shields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.troyka_shields_id_seq OWNED BY public.troyka_shields.id;


--
-- Name: wireless_charge_receivers; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.wireless_charge_receivers (
    id integer NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    voltage_v double precision NOT NULL,
    current_ma integer NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.wireless_charge_receivers OWNER TO design_admin;

--
-- Name: wireless_charge_receivers_and_batteries; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.wireless_charge_receivers_and_batteries (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.wireless_charge_receivers_and_batteries OWNER TO design_admin;

--
-- Name: wireless_charge_receivers_and_batteries_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.wireless_charge_receivers_and_batteries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_charge_receivers_and_batteries_id_seq OWNER TO design_admin;

--
-- Name: wireless_charge_receivers_and_batteries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.wireless_charge_receivers_and_batteries_id_seq OWNED BY public.wireless_charge_receivers_and_batteries.id;


--
-- Name: wireless_charge_receivers_and_links_between_devices; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.wireless_charge_receivers_and_links_between_devices (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.wireless_charge_receivers_and_links_between_devices OWNER TO design_admin;

--
-- Name: wireless_charge_receivers_and_links_between_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.wireless_charge_receivers_and_links_between_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_charge_receivers_and_links_between_devices_id_seq OWNER TO design_admin;

--
-- Name: wireless_charge_receivers_and_links_between_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.wireless_charge_receivers_and_links_between_devices_id_seq OWNED BY public.wireless_charge_receivers_and_links_between_devices.id;


--
-- Name: wireless_charge_receivers_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.wireless_charge_receivers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_charge_receivers_id_seq OWNER TO design_admin;

--
-- Name: wireless_charge_receivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.wireless_charge_receivers_id_seq OWNED BY public.wireless_charge_receivers.id;


--
-- Name: wireless_charge_transmitters; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.wireless_charge_transmitters (
    id integer NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    voltage_v double precision NOT NULL,
    current_ma integer NOT NULL,
    distance_mm integer NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    weight_g integer NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.wireless_charge_transmitters OWNER TO design_admin;

--
-- Name: wireless_charge_transmitters_and_batteries; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.wireless_charge_transmitters_and_batteries (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.wireless_charge_transmitters_and_batteries OWNER TO design_admin;

--
-- Name: wireless_charge_transmitters_and_batteries_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.wireless_charge_transmitters_and_batteries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_charge_transmitters_and_batteries_id_seq OWNER TO design_admin;

--
-- Name: wireless_charge_transmitters_and_batteries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.wireless_charge_transmitters_and_batteries_id_seq OWNED BY public.wireless_charge_transmitters_and_batteries.id;


--
-- Name: wireless_charge_transmitters_and_links_between_devices; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.wireless_charge_transmitters_and_links_between_devices (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.wireless_charge_transmitters_and_links_between_devices OWNER TO design_admin;

--
-- Name: wireless_charge_transmitters_and_links_between_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.wireless_charge_transmitters_and_links_between_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_charge_transmitters_and_links_between_devices_id_seq OWNER TO design_admin;

--
-- Name: wireless_charge_transmitters_and_links_between_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.wireless_charge_transmitters_and_links_between_devices_id_seq OWNED BY public.wireless_charge_transmitters_and_links_between_devices.id;


--
-- Name: wireless_charge_transmitters_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.wireless_charge_transmitters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_charge_transmitters_id_seq OWNER TO design_admin;

--
-- Name: wireless_charge_transmitters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.wireless_charge_transmitters_id_seq OWNED BY public.wireless_charge_transmitters.id;


--
-- Name: wireless_signal_receivers; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.wireless_signal_receivers (
    id integer NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    code text NOT NULL,
    frequency_khz integer NOT NULL,
    voltage_v integer NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.wireless_signal_receivers OWNER TO design_admin;

--
-- Name: wireless_signal_receivers_and_links_between_devices; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.wireless_signal_receivers_and_links_between_devices (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.wireless_signal_receivers_and_links_between_devices OWNER TO design_admin;

--
-- Name: wireless_signal_receivers_and_links_between_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.wireless_signal_receivers_and_links_between_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_signal_receivers_and_links_between_devices_id_seq OWNER TO design_admin;

--
-- Name: wireless_signal_receivers_and_links_between_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.wireless_signal_receivers_and_links_between_devices_id_seq OWNED BY public.wireless_signal_receivers_and_links_between_devices.id;


--
-- Name: wireless_signal_receivers_and_troyka_shields; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.wireless_signal_receivers_and_troyka_shields (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.wireless_signal_receivers_and_troyka_shields OWNER TO design_admin;

--
-- Name: wireless_signal_receivers_and_troyka_shields_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.wireless_signal_receivers_and_troyka_shields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_signal_receivers_and_troyka_shields_id_seq OWNER TO design_admin;

--
-- Name: wireless_signal_receivers_and_troyka_shields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.wireless_signal_receivers_and_troyka_shields_id_seq OWNED BY public.wireless_signal_receivers_and_troyka_shields.id;


--
-- Name: wireless_signal_receivers_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.wireless_signal_receivers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_signal_receivers_id_seq OWNER TO design_admin;

--
-- Name: wireless_signal_receivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.wireless_signal_receivers_id_seq OWNED BY public.wireless_signal_receivers.id;


--
-- Name: wireless_signal_transmitters; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.wireless_signal_transmitters (
    id integer NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    code text NOT NULL,
    frequency_khz integer NOT NULL,
    angle_dg integer NOT NULL,
    voltage_v integer NOT NULL,
    length_mm double precision NOT NULL,
    width_mm double precision NOT NULL,
    height_mm double precision NOT NULL,
    price_rub integer NOT NULL
);


ALTER TABLE public.wireless_signal_transmitters OWNER TO design_admin;

--
-- Name: wireless_signal_transmitters_and_links_between_devices; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.wireless_signal_transmitters_and_links_between_devices (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.wireless_signal_transmitters_and_links_between_devices OWNER TO design_admin;

--
-- Name: wireless_signal_transmitters_and_links_between_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.wireless_signal_transmitters_and_links_between_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_signal_transmitters_and_links_between_devices_id_seq OWNER TO design_admin;

--
-- Name: wireless_signal_transmitters_and_links_between_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.wireless_signal_transmitters_and_links_between_devices_id_seq OWNED BY public.wireless_signal_transmitters_and_links_between_devices.id;


--
-- Name: wireless_signal_transmitters_and_troyka_shields; Type: TABLE; Schema: public; Owner: design_admin
--

CREATE TABLE public.wireless_signal_transmitters_and_troyka_shields (
    id integer NOT NULL,
    option_1 integer,
    option_2 integer
);


ALTER TABLE public.wireless_signal_transmitters_and_troyka_shields OWNER TO design_admin;

--
-- Name: wireless_signal_transmitters_and_troyka_shields_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.wireless_signal_transmitters_and_troyka_shields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_signal_transmitters_and_troyka_shields_id_seq OWNER TO design_admin;

--
-- Name: wireless_signal_transmitters_and_troyka_shields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.wireless_signal_transmitters_and_troyka_shields_id_seq OWNED BY public.wireless_signal_transmitters_and_troyka_shields.id;


--
-- Name: wireless_signal_transmitters_id_seq; Type: SEQUENCE; Schema: public; Owner: design_admin
--

CREATE SEQUENCE public.wireless_signal_transmitters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wireless_signal_transmitters_id_seq OWNER TO design_admin;

--
-- Name: wireless_signal_transmitters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: design_admin
--

ALTER SEQUENCE public.wireless_signal_transmitters_id_seq OWNED BY public.wireless_signal_transmitters.id;


--
-- Name: abstract_elements id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements ALTER COLUMN id SET DEFAULT nextval('public.abstract_elements_id_seq'::regclass);


--
-- Name: abstract_elements_and_base id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_base ALTER COLUMN id SET DEFAULT nextval('public.abstract_elements_and_base_id_seq'::regclass);


--
-- Name: abstract_elements_and_dependencies id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_dependencies ALTER COLUMN id SET DEFAULT nextval('public.abstract_elements_and_dependencies_id_seq'::regclass);


--
-- Name: abstract_elements_and_elements id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_elements ALTER COLUMN id SET DEFAULT nextval('public.abstract_elements_and_elements_id_seq'::regclass);


--
-- Name: abstract_elements_and_pins id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_pins ALTER COLUMN id SET DEFAULT nextval('public.abstract_elements_and_pins_id_seq'::regclass);


--
-- Name: abstract_elements_and_requirements id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_requirements ALTER COLUMN id SET DEFAULT nextval('public.abstract_elements_and_requirements_id_seq'::regclass);


--
-- Name: abstract_elements_and_security id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_security ALTER COLUMN id SET DEFAULT nextval('public.abstract_elements_and_security_id_seq'::regclass);


--
-- Name: abstract_elements_and_subelements id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_subelements ALTER COLUMN id SET DEFAULT nextval('public.abstract_elements_and_subelements_id_seq'::regclass);


--
-- Name: abstract_elements_and_types id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_types ALTER COLUMN id SET DEFAULT nextval('public.abstract_elements_and_types_id_seq'::regclass);


--
-- Name: abstract_elements_combination id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_combination ALTER COLUMN id SET DEFAULT nextval('public.abstract_elements_combination_id_seq'::regclass);


--
-- Name: abstract_links id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_links ALTER COLUMN id SET DEFAULT nextval('public.abstract_links_id_seq'::regclass);


--
-- Name: abstract_links_and_abilities id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_links_and_abilities ALTER COLUMN id SET DEFAULT nextval('public.abstract_links_and_abilities_id_seq'::regclass);


--
-- Name: abstract_links_and_elements id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_links_and_elements ALTER COLUMN id SET DEFAULT nextval('public.abstract_links_and_elements_id_seq'::regclass);


--
-- Name: abstract_subelements id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements ALTER COLUMN id SET DEFAULT nextval('public.abstract_subelements_id_seq'::regclass);


--
-- Name: abstract_subelements_and_base id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_base ALTER COLUMN id SET DEFAULT nextval('public.abstract_subelements_and_base_id_seq'::regclass);


--
-- Name: abstract_subelements_and_flash_memory id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_flash_memory ALTER COLUMN id SET DEFAULT nextval('public.abstract_subelements_and_flash_memory_id_seq'::regclass);


--
-- Name: abstract_subelements_and_security id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_security ALTER COLUMN id SET DEFAULT nextval('public.abstract_subelements_and_security_id_seq'::regclass);


--
-- Name: access_types id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.access_types ALTER COLUMN id SET DEFAULT nextval('public.access_types_id_seq'::regclass);


--
-- Name: attack_actions id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attack_actions ALTER COLUMN id SET DEFAULT nextval('public.attack_actions_id_seq'::regclass);


--
-- Name: attack_levels id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attack_levels ALTER COLUMN id SET DEFAULT nextval('public.attack_levels_id_seq'::regclass);


--
-- Name: attackers_and_actions id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attackers_and_actions ALTER COLUMN id SET DEFAULT nextval('public.attackers_and_actions_id_seq'::regclass);


--
-- Name: base_and_communication id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.base_and_communication ALTER COLUMN id SET DEFAULT nextval('public.base_and_communication_id_seq'::regclass);


--
-- Name: batteries id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries ALTER COLUMN id SET DEFAULT nextval('public.batteries_id_seq'::regclass);


--
-- Name: batteries_and_links_between_devices id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_links_between_devices ALTER COLUMN id SET DEFAULT nextval('public.batteries_and_links_between_devices_id_seq'::regclass);


--
-- Name: batteries_and_microcontrollers_for_electronic_components id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_microcontrollers_for_electronic_components ALTER COLUMN id SET DEFAULT nextval('public.batteries_and_microcontrollers_for_electronic_components_id_seq'::regclass);


--
-- Name: batteries_and_motor_shields id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_motor_shields ALTER COLUMN id SET DEFAULT nextval('public.batteries_and_motor_shields_id_seq'::regclass);


--
-- Name: batteries_and_oneboard_computers id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_oneboard_computers ALTER COLUMN id SET DEFAULT nextval('public.batteries_and_oneboard_computers_id_seq'::regclass);


--
-- Name: collector_motors id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.collector_motors ALTER COLUMN id SET DEFAULT nextval('public.collector_motors_id_seq'::regclass);


--
-- Name: collector_motors_and_motor_shields id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.collector_motors_and_motor_shields ALTER COLUMN id SET DEFAULT nextval('public.collector_motors_and_motor_shields_id_seq'::regclass);


--
-- Name: communication_and_actions id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.communication_and_actions ALTER COLUMN id SET DEFAULT nextval('public.communication_and_actions_id_seq'::regclass);


--
-- Name: communication_levels id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.communication_levels ALTER COLUMN id SET DEFAULT nextval('public.communication_levels_id_seq'::regclass);


--
-- Name: device_abilities id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_abilities ALTER COLUMN id SET DEFAULT nextval('public.device_abilities_id_seq'::regclass);


--
-- Name: device_abilities_and_requirements id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_abilities_and_requirements ALTER COLUMN id SET DEFAULT nextval('public.device_abilities_and_requirements_id_seq'::regclass);


--
-- Name: device_base id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_base ALTER COLUMN id SET DEFAULT nextval('public.device_base_id_seq'::regclass);


--
-- Name: device_recommendations id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_recommendations ALTER COLUMN id SET DEFAULT nextval('public.device_recommendations_id_seq'::regclass);


--
-- Name: device_recommendations_and_security id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_recommendations_and_security ALTER COLUMN id SET DEFAULT nextval('public.device_recommendations_and_security_id_seq'::regclass);


--
-- Name: device_requirements id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_requirements ALTER COLUMN id SET DEFAULT nextval('public.device_requirements_id_seq'::regclass);


--
-- Name: device_requirements_and_base id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_requirements_and_base ALTER COLUMN id SET DEFAULT nextval('public.device_requirements_and_base_id_seq'::regclass);


--
-- Name: device_tasks id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_tasks ALTER COLUMN id SET DEFAULT nextval('public.device_tasks_id_seq'::regclass);


--
-- Name: device_tasks_and_abilities id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_tasks_and_abilities ALTER COLUMN id SET DEFAULT nextval('public.device_tasks_and_abilities_id_seq'::regclass);


--
-- Name: devices_are_linked id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.devices_are_linked ALTER COLUMN id SET DEFAULT nextval('public.devices_are_linked_id_seq'::regclass);


--
-- Name: distance_sensors id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.distance_sensors ALTER COLUMN id SET DEFAULT nextval('public.distance_sensors_id_seq'::regclass);


--
-- Name: distance_sensors_and_troyka_shields id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.distance_sensors_and_troyka_shields ALTER COLUMN id SET DEFAULT nextval('public.distance_sensors_and_troyka_shields_id_seq'::regclass);


--
-- Name: elements_and_actions id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.elements_and_actions ALTER COLUMN id SET DEFAULT nextval('public.elements_and_actions_id_seq'::regclass);


--
-- Name: elements_types id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.elements_types ALTER COLUMN id SET DEFAULT nextval('public.elements_types_id_seq'::regclass);


--
-- Name: encoders id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.encoders ALTER COLUMN id SET DEFAULT nextval('public.encoders_id_seq'::regclass);


--
-- Name: encoders_and_troyka_shields id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.encoders_and_troyka_shields ALTER COLUMN id SET DEFAULT nextval('public.encoders_and_troyka_shields_id_seq'::regclass);


--
-- Name: knowledge_types id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.knowledge_types ALTER COLUMN id SET DEFAULT nextval('public.knowledge_types_id_seq'::regclass);


--
-- Name: levels_and_actions id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.levels_and_actions ALTER COLUMN id SET DEFAULT nextval('public.levels_and_actions_id_seq'::regclass);


--
-- Name: links_and_dependencies id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.links_and_dependencies ALTER COLUMN id SET DEFAULT nextval('public.links_and_dependencies_id_seq'::regclass);


--
-- Name: links_between_devices id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.links_between_devices ALTER COLUMN id SET DEFAULT nextval('public.links_between_devices_id_seq'::regclass);


--
-- Name: mcs_for_ws_communication id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication ALTER COLUMN id SET DEFAULT nextval('public.mcs_for_ws_communication_id_seq'::regclass);


--
-- Name: mcs_for_ws_communication_and_compatibility id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_compatibility ALTER COLUMN id SET DEFAULT nextval('public.mcs_for_ws_communication_and_compatibility_id_seq'::regclass);


--
-- Name: mcs_for_ws_communication_and_links_between_devices id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_links_between_devices ALTER COLUMN id SET DEFAULT nextval('public.mcs_for_ws_communication_and_links_between_devices_id_seq'::regclass);


--
-- Name: mcs_for_ws_communication_and_troyka_shields id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_troyka_shields ALTER COLUMN id SET DEFAULT nextval('public.mcs_for_ws_communication_and_troyka_shields_id_seq'::regclass);


--
-- Name: micro_sds id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.micro_sds ALTER COLUMN id SET DEFAULT nextval('public.micro_sds_id_seq'::regclass);


--
-- Name: micro_sds_and_oneboard_computers id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.micro_sds_and_oneboard_computers ALTER COLUMN id SET DEFAULT nextval('public.micro_sds_and_oneboard_computers_id_seq'::regclass);


--
-- Name: microcontrollers_for_electronic_components id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.microcontrollers_for_electronic_components ALTER COLUMN id SET DEFAULT nextval('public.microcontrollers_for_electronic_components_id_seq'::regclass);


--
-- Name: microcontrollers_for_electronic_components_and_compatibility id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.microcontrollers_for_electronic_components_and_compatibility ALTER COLUMN id SET DEFAULT nextval('public.microcontrollers_for_electronic_components_and_compatibi_id_seq'::regclass);


--
-- Name: motion_sensors id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motion_sensors ALTER COLUMN id SET DEFAULT nextval('public.motion_sensors_id_seq'::regclass);


--
-- Name: motion_sensors_and_troyka_shields id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motion_sensors_and_troyka_shields ALTER COLUMN id SET DEFAULT nextval('public.motion_sensors_and_troyka_shields_id_seq'::regclass);


--
-- Name: motor_shields id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motor_shields ALTER COLUMN id SET DEFAULT nextval('public.motor_shields_id_seq'::regclass);


--
-- Name: motor_shields_and_microcontrollers_for_electronic_components id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motor_shields_and_microcontrollers_for_electronic_components ALTER COLUMN id SET DEFAULT nextval('public.motor_shields_and_microcontrollers_for_electronic_compon_id_seq'::regclass);


--
-- Name: noise_sensors id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.noise_sensors ALTER COLUMN id SET DEFAULT nextval('public.noise_sensors_id_seq'::regclass);


--
-- Name: noise_sensors_and_troyka_shields id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.noise_sensors_and_troyka_shields ALTER COLUMN id SET DEFAULT nextval('public.noise_sensors_and_troyka_shields_id_seq'::regclass);


--
-- Name: oneboard_computers id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.oneboard_computers ALTER COLUMN id SET DEFAULT nextval('public.oneboard_computers_id_seq'::regclass);


--
-- Name: oneboard_computers_and_compatibility id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.oneboard_computers_and_compatibility ALTER COLUMN id SET DEFAULT nextval('public.oneboard_computers_and_compatibility_id_seq'::regclass);


--
-- Name: oneboard_computers_and_links_between_devices id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.oneboard_computers_and_links_between_devices ALTER COLUMN id SET DEFAULT nextval('public.oneboard_computers_and_links_between_devices_id_seq'::regclass);


--
-- Name: operating_systems_32bit id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.operating_systems_32bit ALTER COLUMN id SET DEFAULT nextval('public.operating_systems_32bit_id_seq'::regclass);


--
-- Name: operating_systems_32bit_and_compatibility id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.operating_systems_32bit_and_compatibility ALTER COLUMN id SET DEFAULT nextval('public.operating_systems_32bit_and_compatibility_id_seq'::regclass);


--
-- Name: operating_systems_32bit_and_oneboard_computers id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.operating_systems_32bit_and_oneboard_computers ALTER COLUMN id SET DEFAULT nextval('public.operating_systems_32bit_and_oneboard_computers_id_seq'::regclass);


--
-- Name: resources_types id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.resources_types ALTER COLUMN id SET DEFAULT nextval('public.resources_types_id_seq'::regclass);


--
-- Name: security_and_actions id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.security_and_actions ALTER COLUMN id SET DEFAULT nextval('public.security_and_actions_id_seq'::regclass);


--
-- Name: security_and_levels id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.security_and_levels ALTER COLUMN id SET DEFAULT nextval('public.security_and_levels_id_seq'::regclass);


--
-- Name: security_elements id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.security_elements ALTER COLUMN id SET DEFAULT nextval('public.security_elements_id_seq'::regclass);


--
-- Name: selectable_elements id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.selectable_elements ALTER COLUMN id SET DEFAULT nextval('public.selectable_elements_id_seq'::regclass);


--
-- Name: selectable_elements_and_db_tables id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.selectable_elements_and_db_tables ALTER COLUMN id SET DEFAULT nextval('public.selectable_elements_and_db_tables_id_seq'::regclass);


--
-- Name: servo_drives id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.servo_drives ALTER COLUMN id SET DEFAULT nextval('public.servo_drives_id_seq'::regclass);


--
-- Name: servo_drives_and_troyka_shields id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.servo_drives_and_troyka_shields ALTER COLUMN id SET DEFAULT nextval('public.servo_drives_and_troyka_shields_id_seq'::regclass);


--
-- Name: sql_databases id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.sql_databases ALTER COLUMN id SET DEFAULT nextval('public.sql_databases_id_seq'::regclass);


--
-- Name: sql_databases_and_compatibility id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.sql_databases_and_compatibility ALTER COLUMN id SET DEFAULT nextval('public.sql_databases_and_compatibility_id_seq'::regclass);


--
-- Name: sql_databases_and_operating_systems_32bit id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.sql_databases_and_operating_systems_32bit ALTER COLUMN id SET DEFAULT nextval('public.sql_databases_and_operating_systems_32bit_id_seq'::regclass);


--
-- Name: system_abilities id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_abilities ALTER COLUMN id SET DEFAULT nextval('public.system_abilities_id_seq'::regclass);


--
-- Name: system_abilities_and_requirements id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_abilities_and_requirements ALTER COLUMN id SET DEFAULT nextval('public.system_abilities_and_requirements_id_seq'::regclass);


--
-- Name: system_recommendations id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_recommendations ALTER COLUMN id SET DEFAULT nextval('public.system_recommendations_id_seq'::regclass);


--
-- Name: system_recommendations_and_security id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_recommendations_and_security ALTER COLUMN id SET DEFAULT nextval('public.system_recommendations_and_security_id_seq'::regclass);


--
-- Name: system_requirements id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_requirements ALTER COLUMN id SET DEFAULT nextval('public.system_requirements_id_seq'::regclass);


--
-- Name: system_requirements_and_tasks id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_requirements_and_tasks ALTER COLUMN id SET DEFAULT nextval('public.system_requirements_and_tasks_id_seq'::regclass);


--
-- Name: system_tasks id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_tasks ALTER COLUMN id SET DEFAULT nextval('public.system_tasks_id_seq'::regclass);


--
-- Name: system_tasks_and_abilities id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_tasks_and_abilities ALTER COLUMN id SET DEFAULT nextval('public.system_tasks_and_abilities_id_seq'::regclass);


--
-- Name: touch_sensors id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.touch_sensors ALTER COLUMN id SET DEFAULT nextval('public.touch_sensors_id_seq'::regclass);


--
-- Name: touch_sensors_and_troyka_shields id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.touch_sensors_and_troyka_shields ALTER COLUMN id SET DEFAULT nextval('public.touch_sensors_and_troyka_shields_id_seq'::regclass);


--
-- Name: troyka_shields id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.troyka_shields ALTER COLUMN id SET DEFAULT nextval('public.troyka_shields_id_seq'::regclass);


--
-- Name: troyka_shields_and_microcontrollers_for_electronic_components id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.troyka_shields_and_microcontrollers_for_electronic_components ALTER COLUMN id SET DEFAULT nextval('public.troyka_shields_and_microcontrollers_for_electronic_compo_id_seq'::regclass);


--
-- Name: wireless_charge_receivers id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_receivers ALTER COLUMN id SET DEFAULT nextval('public.wireless_charge_receivers_id_seq'::regclass);


--
-- Name: wireless_charge_receivers_and_batteries id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_receivers_and_batteries ALTER COLUMN id SET DEFAULT nextval('public.wireless_charge_receivers_and_batteries_id_seq'::regclass);


--
-- Name: wireless_charge_receivers_and_links_between_devices id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_receivers_and_links_between_devices ALTER COLUMN id SET DEFAULT nextval('public.wireless_charge_receivers_and_links_between_devices_id_seq'::regclass);


--
-- Name: wireless_charge_transmitters id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_transmitters ALTER COLUMN id SET DEFAULT nextval('public.wireless_charge_transmitters_id_seq'::regclass);


--
-- Name: wireless_charge_transmitters_and_batteries id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_transmitters_and_batteries ALTER COLUMN id SET DEFAULT nextval('public.wireless_charge_transmitters_and_batteries_id_seq'::regclass);


--
-- Name: wireless_charge_transmitters_and_links_between_devices id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_transmitters_and_links_between_devices ALTER COLUMN id SET DEFAULT nextval('public.wireless_charge_transmitters_and_links_between_devices_id_seq'::regclass);


--
-- Name: wireless_signal_receivers id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_receivers ALTER COLUMN id SET DEFAULT nextval('public.wireless_signal_receivers_id_seq'::regclass);


--
-- Name: wireless_signal_receivers_and_links_between_devices id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_receivers_and_links_between_devices ALTER COLUMN id SET DEFAULT nextval('public.wireless_signal_receivers_and_links_between_devices_id_seq'::regclass);


--
-- Name: wireless_signal_receivers_and_troyka_shields id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_receivers_and_troyka_shields ALTER COLUMN id SET DEFAULT nextval('public.wireless_signal_receivers_and_troyka_shields_id_seq'::regclass);


--
-- Name: wireless_signal_transmitters id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_transmitters ALTER COLUMN id SET DEFAULT nextval('public.wireless_signal_transmitters_id_seq'::regclass);


--
-- Name: wireless_signal_transmitters_and_links_between_devices id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_transmitters_and_links_between_devices ALTER COLUMN id SET DEFAULT nextval('public.wireless_signal_transmitters_and_links_between_devices_id_seq'::regclass);


--
-- Name: wireless_signal_transmitters_and_troyka_shields id; Type: DEFAULT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_transmitters_and_troyka_shields ALTER COLUMN id SET DEFAULT nextval('public.wireless_signal_transmitters_and_troyka_shields_id_seq'::regclass);


--
-- Data for Name: abstract_elements; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_elements (id, name) FROM stdin;
1	32-bit operating system
2	sql database
3	application with graphical user interface
4	wireless charge receiver
5	battery
6	collector motor
7	distance sensor
8	touch sensor
9	servo drive
10	motion sensor
11	noise sensor
12	wireless signal receiver
13	wireless charge transmitter
14	wireless signal transmitter
15	encoder
16	one-board computer
17	microcontroller for electronic components
18	microcontroller for wireless communication
19	firmware for electronic components
20	firmware for wireless communication
21	micro SD
22	motor shield
23	troyka shield
24	vandal-proof device case
25	wireless access point
\.


--
-- Data for Name: abstract_elements_and_base; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_elements_and_base (id, element_id, base_id) FROM stdin;
1	16	1
2	17	2
3	18	2
4	19	2
5	20	2
6	17	3
7	19	3
\.


--
-- Data for Name: abstract_elements_and_dependencies; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_elements_and_dependencies (id, element_1, element_2) FROM stdin;
1	1	2
2	1	3
3	5	4
4	5	13
5	16	1
6	16	21
7	16	5
8	17	22
9	17	23
10	17	5
11	22	6
12	22	5
13	23	7
14	23	8
15	23	9
16	23	10
17	23	12
18	23	18
19	23	11
20	23	15
21	23	14
\.


--
-- Data for Name: abstract_elements_and_elements; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_elements_and_elements (id, element_1, element_2) FROM stdin;
1	16	21
2	6	22
3	17	23
\.


--
-- Data for Name: abstract_elements_and_pins; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_elements_and_pins (id, element_id, count) FROM stdin;
1	7	1
2	8	1
3	9	1
4	10	1
5	11	1
6	15	1
7	22	4
8	12	1
9	14	1
10	18	4
\.


--
-- Data for Name: abstract_elements_and_requirements; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_elements_and_requirements (id, element_id, requirement_id) FROM stdin;
1	1	1
2	2	2
3	3	8
4	4	15
5	5	16
6	6	18
7	7	20
8	8	21
9	9	22
10	10	27
11	11	28
12	12	31
13	13	34
14	14	35
15	15	37
16	25	7
\.


--
-- Data for Name: abstract_elements_and_security; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_elements_and_security (id, element_1, element_2) FROM stdin;
1	24	4
2	5	19
3	5	20
\.


--
-- Data for Name: abstract_elements_and_subelements; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_elements_and_subelements (id, requirement_id, element_id, subelement_id) FROM stdin;
1	3	16	1
2	4	1	2
3	5	1	3
4	6	16	4
5	7	1	5
6	9	3	6
7	10	3	7
8	11	3	8
9	12	3	9
10	13	17	10
11	13	18	10
12	14	19	11
13	14	20	11
14	17	19	12
15	19	19	13
16	23	19	14
17	24	19	15
18	25	19	16
19	26	19	17
20	29	19	18
21	30	19	19
22	32	19	20
23	33	19	21
24	33	20	21
25	36	19	22
\.


--
-- Data for Name: abstract_elements_and_types; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_elements_and_types (id, element_id, type_id) FROM stdin;
1	7	1
2	8	1
3	15	1
4	10	2
5	11	2
6	12	3
7	4	4
8	5	4
9	6	4
10	7	4
11	8	4
12	9	4
13	10	4
14	11	4
15	12	4
16	13	4
17	14	4
18	15	4
19	21	4
20	22	4
21	23	4
22	17	5
23	18	5
24	17	6
25	18	6
26	16	7
27	17	7
28	18	7
29	16	8
30	18	8
31	3	10
32	16	11
33	13	11
34	2	13
\.


--
-- Data for Name: abstract_elements_combination; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_elements_combination (id, element_1, element_2) FROM stdin;
1	1	2
2	1	3
3	1	25
4	5	4
5	5	13
6	16	21
7	16	5
8	17	22
9	17	23
10	17	19
11	17	5
12	18	20
13	21	1
14	22	6
15	22	23
16	22	5
17	23	7
18	23	8
19	23	9
20	23	10
21	23	11
22	23	12
23	23	14
24	23	15
25	23	18
26	24	16
27	24	17
\.


--
-- Data for Name: abstract_links; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_links (id, name) FROM stdin;
1	pin-to-pin
2	SVG
3	VG
4	method
5	database
6	API
7	install
8	flashing
9	wire
10	wireless
11	configure
12	slot
13	placement
14	TxRx
\.


--
-- Data for Name: abstract_links_and_abilities; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_links_and_abilities (id, link_id, ability_id) FROM stdin;
1	10	6
2	10	8
3	10	14
4	10	15
5	10	16
6	10	17
\.


--
-- Data for Name: abstract_links_and_elements; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_links_and_elements (id, element_1, element_2, link_id) FROM stdin;
1	1	3	7
2	1	2	7
3	1	25	11
4	5	4	3
5	5	13	3
6	16	5	3
7	16	21	12
8	17	22	1
9	17	19	8
10	17	23	1
11	17	5	3
12	18	20	8
13	21	1	7
14	22	23	1
15	22	6	3
16	22	5	3
17	23	18	14
18	23	15	2
19	23	12	2
20	23	11	2
21	23	10	2
22	23	7	2
23	23	9	2
24	23	8	2
25	23	14	2
26	24	16	13
27	24	17	13
\.


--
-- Data for Name: abstract_subelements; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_subelements (id, name) FROM stdin;
1	wire network interface
2	software update server
3	software update mechanism
4	wireless network interface
5	access point configuration mechanism
6	application-database connection
7	data processing algorithm
8	data presentation algorithm
9	devices communication algorithm
10	bootloader
11	firmware update mechanism
12	charge monitoring algorithm
13	movement algorithm
14	obstacles detection algorithm
15	obstacles avoidance algorithm
16	map construction algorithm
17	path construction algorithm
18	intruders detection algorithm
19	intruders chase algorithm
20	parking algorithm
21	server communication algorithm
22	parking direction algorithm
23	microcontrollers communication algorithm
24	electronic components interaction algorithm
25	sensors anomaly detection algorithm
26	data collection algorithm for anomaly detection
27	events correlation algorithm
28	hardware authentication algorithm
29	firmware encryption algorithm
30	firmware decryption algorithm
31	bootloader encryption algorithm
32	bootloader decryption algorithm
33	communication data encryption and decryption algorithm
34	mutual authentication algorithm
35	strong login credentials
36	secure password policy
37	brute-force protection algorithm
38	secure key distribution mechanism
39	devices behaviour-based anomaly detection algorithm
40	devices isolation / limitation algorithm
41	firewall
42	logging mechanism
43	backup mechanism
44	input data validation algorithm
45	strict access policy
46	separate users for different operations
\.


--
-- Data for Name: abstract_subelements_and_base; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_subelements_and_base (id, element_id, subelement_id, base_id) FROM stdin;
1	19	23	2
2	20	23	2
3	19	24	2
4	19	24	3
\.


--
-- Data for Name: abstract_subelements_and_flash_memory; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_subelements_and_flash_memory (id, element_id, value) FROM stdin;
1	11	20
2	12	10
3	13	20
4	14	20
5	15	30
6	16	30
7	17	40
8	18	20
9	19	40
10	20	20
11	21	30
12	22	40
13	23	40
14	26	40
15	33	100
16	34	20
\.


--
-- Data for Name: abstract_subelements_and_security; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.abstract_subelements_and_security (id, element_id, subelement_id, security_id) FROM stdin;
1	19	25	1
2	19	27	3
3	19	30	6
4	19	33	9
5	19	34	10
6	20	30	6
7	20	33	9
8	20	34	10
9	20	26	15
10	3	29	6
11	3	31	7
12	3	32	7
13	25	33	9
14	25	35	11
15	25	37	13
16	25	38	14
17	1	41	21
18	1	3	22
19	1	46	23
20	1	42	24
21	2	35	11
22	2	43	25
23	2	44	26
24	2	45	27
25	3	39	15
26	3	40	16
\.


--
-- Data for Name: access_types; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.access_types (id, description) FROM stdin;
1	No access to the system
2	Access to the system through global networks
3	Access to the system, its devices and interfaces through local networks
4	Physical access to the system, its devices and interfaces
5	Full access to the system and its elements
\.


--
-- Data for Name: attack_actions; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.attack_actions (id, name, description) FROM stdin;
1	gie	generation of incorrect sensor events
2	bsd	bypassing sensor detection algorithms
3	rpt	replacement of the electronic component
4	rmt	removement of the electronic component
5	rfw	replacement of the firmware
6	rbl	reinstallation of the bootloader
7	mup	malfunction of the update system
8	imw	interception, modification or termination of wired communications
9	vau	violation of the authentication system
10	cad	cryptographic analysis of transmitted data
11	iec	increased energy consumption
12	iws	interception, modification or termination of wireless communications
13	soc	social engineering
14	pwr	power failure
15	web	disruption of web services
16	dbd	database disruption
\.


--
-- Data for Name: attack_levels; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.attack_levels (id, name, description) FROM stdin;
1	ec	Level of electronic components and their communications with microcontrollers
2	mc	Level of microcontrollers and their communications with other microcontrollers
3	dv	Level of devices and their communications with other devices
4	st	Level of the whole system
\.


--
-- Data for Name: attackers_and_actions; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.attackers_and_actions (id, action_id, access_id, knowledge_id, resources_id) FROM stdin;
1	1	3	2	3
2	2	3	3	2
3	3	4	2	1
4	4	4	1	1
5	5	4	4	3
6	6	4	4	3
7	7	3	3	2
8	8	4	1	1
9	9	3	3	2
10	10	3	3	2
11	11	3	2	1
12	12	3	1	2
13	13	1	1	1
14	14	4	1	1
15	15	2	2	1
16	16	2	2	1
\.


--
-- Data for Name: base_and_communication; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.base_and_communication (id, base_id, type_id) FROM stdin;
1	1	4
2	2	1
3	2	2
4	2	3
5	2	4
6	3	1
7	3	2
\.


--
-- Data for Name: batteries; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.batteries (id, name, code, capacity_mah, current_a, length_mm, width_mm, height_mm, weight_g, price_rub) FROM stdin;
1	Xiaomi Mi Power Bank 3 Pro	PLM07ZM	20000	3	73.5	153.5	27.5	440	2554
2	ZMI AURA Power Bank	QB822	20000	3	69.9	149.5	23.9	374	2618
3	Xiaomi Mi Power Bank 3	PLM12ZM	10000	3	71.2	147	14.2	223	1130
4	HIPER ForcePower	100W	20000	3	70	140	20	500	5490
5	HIPER	MPX20000	20000	3	67	13	24.7	386	2990
6	Baseus Amblight Power Bank	PPALL-LG01/02	20000	3	65	144	26	340	1690
7	Accesstyle Charcoal II	10MPQP	10000	3	66	140	66	140	16
8	Power Bank v2	AMP-B188	2000	0.6	55	33	20	80	1490
9	Power Shield	AMP-B088	2000	0.7	69	53	20	100	1490
\.


--
-- Data for Name: batteries_and_links_between_devices; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.batteries_and_links_between_devices (id, option_1, option_2) FROM stdin;
1	1	6
2	2	6
3	3	6
4	4	6
5	5	6
6	6	6
7	7	6
8	8	6
9	9	6
\.


--
-- Data for Name: batteries_and_microcontrollers_for_electronic_components; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.batteries_and_microcontrollers_for_electronic_components (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	2	1
8	2	2
9	2	3
10	2	4
11	2	5
12	2	6
13	3	1
14	3	2
15	3	3
16	3	4
17	3	5
18	3	6
19	4	1
20	4	2
21	4	3
22	4	4
23	4	5
24	4	6
25	5	1
26	5	2
27	5	3
28	5	4
29	5	5
30	5	6
31	6	1
32	6	2
33	6	3
34	6	4
35	6	5
36	6	6
37	7	1
38	7	2
39	7	3
40	7	4
41	7	5
42	7	6
43	8	1
44	8	2
45	8	3
46	8	4
47	8	5
48	8	6
49	9	1
50	9	2
51	9	3
52	9	4
53	9	5
54	9	6
\.


--
-- Data for Name: batteries_and_motor_shields; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.batteries_and_motor_shields (id, option_1, option_2) FROM stdin;
1	8	1
2	8	2
3	8	3
4	9	1
5	9	2
6	9	3
\.


--
-- Data for Name: batteries_and_oneboard_computers; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.batteries_and_oneboard_computers (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	2	1
11	2	2
12	2	3
13	2	4
14	2	5
15	2	6
16	2	7
17	2	8
18	2	9
19	3	1
20	3	2
21	3	3
22	3	4
23	3	5
24	3	6
25	3	7
26	3	8
27	3	9
28	4	1
29	4	2
30	4	3
31	4	4
32	4	5
33	4	6
34	4	7
35	4	8
36	4	9
37	5	1
38	5	2
39	5	3
40	5	4
41	5	5
42	5	6
43	5	7
44	5	8
45	5	9
46	6	1
47	6	2
48	6	3
49	6	4
50	6	5
51	6	6
52	6	7
53	6	8
54	6	9
55	7	1
56	7	2
57	7	3
58	7	4
59	7	5
60	7	6
61	7	7
62	7	8
63	7	9
\.


--
-- Data for Name: collector_motors; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.collector_motors (id, name, type, voltage_v, speed_rpm, energy_ma, ratio, length_mm, width_mm, height_mm, weight_g, price_rub) FROM stdin;
1	Motor	Collector	5	300	70	100	36	12	10	10	590
2	Motor	Collector	9	300	50	100	36	12	10	10	590
3	Motor	Collector	9	80	50	298	36	12	10	10	590
4	Motor	Collector	12	600	50	50	36	12	10	10	740
5	Motor	Collector	12	160	50	150	36	12	10	10	740
6	Motor	Collector	12	80	50	298	36	12	10	10	590
\.


--
-- Data for Name: collector_motors_and_motor_shields; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.collector_motors_and_motor_shields (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	2
6	2	3
7	3	1
8	3	2
9	3	3
10	4	1
11	4	2
12	4	3
13	5	1
14	5	2
15	5	3
16	6	1
17	6	2
18	6	3
\.


--
-- Data for Name: communication_and_actions; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.communication_and_actions (id, type_id, action_id) FROM stdin;
1	1	8
2	2	8
3	3	8
4	4	9
5	4	10
6	4	12
\.


--
-- Data for Name: communication_levels; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.communication_levels (id, name) FROM stdin;
1	electronic component to microcontroller
2	microcontroller to electronic component
3	microcontroller to microcontroller
4	device to device
\.


--
-- Data for Name: device_abilities; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.device_abilities (id, name) FROM stdin;
1	to store data
2	to update software
3	to run applications
4	to create wireless access points
5	to provide graphical user interface
6	to communicate with other devices
7	to update firmware
8	to be charged in a wireless way
9	to move
10	to avoid obstacles
11	to navigate
12	to detect intruders
13	to chase intruders
14	to park near charging stations
15	to communicate with the server
16	to charge parked devices 
17	to help mobile robots to park near
\.


--
-- Data for Name: device_abilities_and_requirements; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.device_abilities_and_requirements (id, ability_id, requirement_id) FROM stdin;
1	1	1
2	1	2
3	2	3
4	2	4
5	2	5
6	3	1
7	4	1
8	4	6
9	4	7
10	5	8
11	5	9
12	5	10
13	5	11
14	6	6
15	6	12
16	7	6
17	7	13
18	7	14
19	8	15
20	8	16
21	8	17
22	9	18
23	9	19
24	10	20
25	10	21
26	10	22
27	10	23
28	10	24
29	11	25
30	11	26
31	11	37
32	12	27
33	12	28
34	12	22
35	12	29
36	13	20
37	13	30
38	14	31
39	14	32
40	15	6
41	15	33
42	16	34
43	17	35
44	17	36
\.


--
-- Data for Name: device_base; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.device_base (id, name) FROM stdin;
1	one-board computer
2	connected microcontrollers
3	microcontroller
\.


--
-- Data for Name: device_recommendations; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.device_recommendations (id, name) FROM stdin;
1	to hide monitoring sensors of this device
2	to remove physical update interfaces from this device
\.


--
-- Data for Name: device_recommendations_and_security; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.device_recommendations_and_security (id, recommendation_id, security_id) FROM stdin;
1	1	2
2	2	8
\.


--
-- Data for Name: device_requirements; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.device_requirements (id, name) FROM stdin;
1	32-bit operating system
2	sql database
3	wire network interface
4	software update server
5	software update mechanism
6	wireless network interface
7	access point configuration mechanism
8	application with graphical user interface
9	application-database connection
10	data processing algorithm
11	data presentation algorithm
12	devices communication algorithm
13	bootloader
14	firmware update mechanism
15	wireless charge receiver
16	battery
17	charge monitoring algorithm
18	collector motor
19	movement algorithm
20	distance sensor
21	touch sensor
22	servo drive
23	obstacles detection algorithm
24	obstacles avoidance algorithm
25	encoder
26	map construction algorithm
27	path construction algorithm
28	motion sensor
29	noise sensor
30	intruders detection algorithm
31	intruders chase algorithm
32	wireless signal receiver
33	parking algorithm
34	server communication algorithm
35	wireless charge transmitter
36	wireless signal transmitter
37	parking direction algorithm
\.


--
-- Data for Name: device_requirements_and_base; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.device_requirements_and_base (id, requirement_id, base_id) FROM stdin;
1	1	1
2	2	1
3	3	2
4	4	1
5	5	1
6	6	2
7	7	2
8	8	1
9	9	1
10	10	3
11	11	3
12	12	3
13	13	3
14	14	3
15	15	3
16	16	3
17	17	3
18	18	3
19	19	3
20	20	3
21	21	3
22	22	3
23	23	3
24	24	3
25	25	3
26	26	3
27	27	3
28	28	3
29	29	3
30	30	3
31	31	3
32	32	3
33	33	3
34	34	3
35	35	3
36	36	3
37	37	3
\.


--
-- Data for Name: device_tasks; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.device_tasks (id, name) FROM stdin;
1	work cycle support
2	interaction with operators
3	interaction with other devices
4	navigation through the perimeter
5	interaction with intruders
6	interaction with charging stations
7	interaction with the server
8	interaction with mobile robots
\.


--
-- Data for Name: device_tasks_and_abilities; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.device_tasks_and_abilities (id, task_id, ability_id, requirement_id) FROM stdin;
1	1	1	1
2	1	2	1
3	1	3	1
4	1	4	1
5	2	5	1
6	3	6	1
7	1	7	2
8	1	16	2
9	5	12	2
10	8	17	2
11	7	15	2
12	1	7	3
13	1	8	3
14	4	9	3
15	4	10	3
16	4	11	3
17	5	12	3
18	5	13	3
19	6	14	3
20	7	15	3
\.


--
-- Data for Name: devices_are_linked; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.devices_are_linked (id, ability_1, ability_2) FROM stdin;
1	6	15
2	8	16
3	14	17
4	15	6
5	16	8
6	17	14
\.


--
-- Data for Name: distance_sensors; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.distance_sensors (id, name, type, code, distance_sm, angle_dg, voltage_v, energy_ma, length_mm, width_mm, height_mm, weight_g, price_rub) FROM stdin;
1	Ultrasonic Rangefinder	HC-SR04	AMP-X142-U2	400	30	5	15	40	20	15	20	650
2	Infrared Rangefinder	Sharp	AMP-X129	80	30	5	40	30	20	20	15	1040
3	Ultrasonic Rangefinder	URM37	SEN0001	800	30	3.3	20	22	51	15	30	1690
4	Infrared Rangefinder	Sharp	AMP-X033	150	30	5	50	30	20	30	15	1290
\.


--
-- Data for Name: distance_sensors_and_troyka_shields; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.distance_sensors_and_troyka_shields (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	2
6	2	3
7	3	1
8	3	2
9	3	3
10	4	1
11	4	2
12	4	3
\.


--
-- Data for Name: elements_and_actions; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.elements_and_actions (id, type_id, action_id) FROM stdin;
1	1	1
2	2	2
3	3	1
4	4	3
5	4	4
6	5	5
7	6	6
8	7	7
9	8	11
10	9	8
11	10	13
12	11	14
13	12	15
14	13	16
\.


--
-- Data for Name: elements_types; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.elements_types (id, name) FROM stdin;
1	environment sensors
2	monitoring sensors
3	environment receivers
4	electronic component
5	microcontroller with rewritable firmware
6	microcontroller with rewritable bootloader
7	microcontroller with update system
8	device with wireless interface
9	device with sleep mode
10	system with users
11	system that relies on power grid
12	system with web-services
13	system with database
\.


--
-- Data for Name: encoders; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.encoders (id, name, code, voltage_v, energy_ma, length_mm, width_mm, height_mm, price_rub) FROM stdin;
1	Analog line-sensor	AMP-B012	3	10	30	10	10	360
2	Digital line-sensor	AMP-B018	3	10	30	10	10	420
3	MiniQ Chassis Encoder	SEN0116	5	14	50	50	15	840
\.


--
-- Data for Name: encoders_and_troyka_shields; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.encoders_and_troyka_shields (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	2
6	2	3
\.


--
-- Data for Name: knowledge_types; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.knowledge_types (id, description) FROM stdin;
1	Knowledge about the system from publicly available sources
2	Knowledge about system parameters
3	Knowledge about means of protection of the system
4	Knowledge about system software and hardware
\.


--
-- Data for Name: levels_and_actions; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.levels_and_actions (id, level_id, action_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	2	5
6	2	6
7	2	7
8	2	8
9	3	9
10	3	10
11	3	11
12	3	12
13	4	13
14	4	14
15	4	15
16	4	16
\.


--
-- Data for Name: links_and_dependencies; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.links_and_dependencies (id, ability_1, ability_2, element_id) FROM stdin;
1	6	15	16
2	6	15	18
3	6	15	25
4	15	6	16
5	15	6	18
6	15	6	25
7	8	16	4
8	8	16	5
9	8	16	13
10	16	8	4
11	16	8	5
12	16	8	13
13	14	17	12
14	14	17	14
15	17	14	12
16	17	14	14
\.


--
-- Data for Name: links_between_devices; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.links_between_devices (id, name, interface, protocol, wireless, directed, data, charge, signal, access_point, encryption, authentication, range, speed) FROM stdin;
1	Wi-Fi	IEEE 800.11	wireless 2.4 GHz	t	f	t	f	f	t	t	t	40	20
2	ZigBee	IEEE 802.15.4	wireless 2.4 GHz	t	f	t	f	f	t	t	t	50	0
3	Bluetooth	IEEE 802.15.1	wireless 2.4 GHz	t	f	t	f	f	t	t	t	10	2
4	nRF24L01+	ESB	wireless 2.4 GHz	t	f	t	f	f	t	f	f	100	2
5	Infrared	NEC	wireless 38 kHz	t	t	f	f	t	f	f	f	8	0
6	Qi	WPS	wireless 200 kHz	t	f	f	t	f	f	f	f	0	0
\.


--
-- Data for Name: mcs_for_ws_communication; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.mcs_for_ws_communication (id, name, interface, type, code, frequency_ghz, flash_kb, voltage_v, energy_ma, length_mm, width_mm, height_mm, price_rub) FROM stdin;
1	Wi-Fi	802.11 b/g/n	Troyka-module	AMP-B081	2.4	512	3.3	250	50.8	25.4	5	850
2	Wi-Fi	802.11 b/g/n	ESP8266	AMP-X195	2.4	512	3.3	220	21	13	5	540
3	Bluetooth Low Energy	ISM	Troyka-module	AMP-B117	2.4	256	3.3	10	25.4	25.4	5	1040
4	Bluetooth HC-05	BC417143	Troyka-module	AMP-B065	2.4	256	3.3	50	50.8	25.4	5	890
5	nRF24L01+	MIRF	SPI	AMP-X141	2.4	0	3.3	70	50.8	25.4	5	240
6	XBee	ZigBee	Digi	AMP-X124	2.4	512	3.3	50	40	40	5	3190
\.


--
-- Data for Name: mcs_for_ws_communication_and_compatibility; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.mcs_for_ws_communication_and_compatibility (id, option_id, requirement_id) FROM stdin;
1	1	10
2	2	10
3	3	10
4	4	10
5	6	10
\.


--
-- Data for Name: mcs_for_ws_communication_and_links_between_devices; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.mcs_for_ws_communication_and_links_between_devices (id, option_1, option_2) FROM stdin;
1	1	1
2	2	1
3	3	3
4	4	3
5	5	4
6	6	2
\.


--
-- Data for Name: mcs_for_ws_communication_and_troyka_shields; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.mcs_for_ws_communication_and_troyka_shields (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	2
6	2	3
7	3	1
8	3	2
9	3	3
10	4	1
11	4	2
12	4	3
13	5	1
14	5	2
15	5	3
16	6	1
17	6	2
18	6	3
\.


--
-- Data for Name: micro_sds; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.micro_sds (id, name, memory_gb, class, speed_mbs, price_rub) FROM stdin;
1	Perfeo	32	10	20	560
2	Perfeo	16	10	20	500
3	SanDisk	32	10	20	850
4	Kingston	32	10	100	800
5	Samsung	32	10	20	490
6	EXPLOYD	16	10	20	290
7	Mirex	16	10	45	262
\.


--
-- Data for Name: micro_sds_and_oneboard_computers; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.micro_sds_and_oneboard_computers (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	4
4	1	5
5	1	6
6	1	7
7	1	8
8	1	9
9	2	1
10	2	2
11	2	4
12	2	5
13	2	6
14	2	7
15	2	8
16	2	9
17	3	1
18	3	2
19	3	4
20	3	5
21	3	6
22	3	7
23	3	8
24	3	9
25	4	1
26	4	2
27	4	4
28	4	5
29	4	6
30	4	7
31	4	8
32	4	9
33	5	1
34	5	2
35	5	4
36	5	5
37	5	6
38	5	7
39	5	8
40	5	9
41	6	1
42	6	2
43	6	4
44	6	5
45	6	6
46	6	7
47	6	8
48	6	9
49	7	1
50	7	2
51	7	4
52	7	5
53	7	6
54	7	7
55	7	8
56	7	9
\.


--
-- Data for Name: microcontrollers_for_electronic_components; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.microcontrollers_for_electronic_components (id, name, cpu, clock_fq_mhz, flash_kb, voltage_v, current_a, pins, length_mm, width_mm, height_mm, price_rub) FROM stdin;
1	Iskra JS	ARM Cortex M4 32bit	168	1024	3.3	0.4	26	69	53	20	1490
2	Arduino Mega 2560	ATmega2560	16	256	5	0.4	70	102	53	20	3540
3	Arduino Uno	ATmega328	16	32	5	0.4	20	69	53	20	2140
4	Iskra Uno	ATmega328P	16	32	3.3	0.4	20	69	53	20	980
5	Arduino Leonardo	ATmega32u4	16	32	5	0.4	20	69	53	20	2040
6	Iskra Neo	ATmega32U4	16	32	5	0.4	20	69	53	20	1060
\.


--
-- Data for Name: microcontrollers_for_electronic_components_and_compatibility; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.microcontrollers_for_electronic_components_and_compatibility (id, option_id, requirement_id) FROM stdin;
1	1	10
2	2	10
3	3	10
4	4	10
5	5	10
6	6	10
\.


--
-- Data for Name: motion_sensors; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.motion_sensors (id, name, type, code, voltage_v, energy_ma, angle_g, range_m, length_mm, width_mm, height_mm, weight_g, price_rub) FROM stdin;
1	Infrared Motion Sensor		SEN0018	3	0.5	110	7	28	36	15	25	840
2	Infrared Motion Sensor	Troyka-module	AMP-B127	3.3	0.5	110	7	25.4	25.4	15	30	530
3	Infrared Motion Sensor	Zelo-module	AMP-B116	3.3	0.5	110	7	45	26	15	35	530
\.


--
-- Data for Name: motion_sensors_and_troyka_shields; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.motion_sensors_and_troyka_shields (id, option_1, option_2) FROM stdin;
1	2	1
2	2	2
3	2	3
\.


--
-- Data for Name: motor_shields; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.motor_shields (id, name, driver, motors, voltage_v, current_a, length_mm, width_mm, height_mm, price_rub) FROM stdin;
1	Motor Shield Plus	L6206Q	2	3.3	2.5	69	53	20	1590
2	Motor Shield	L298P	2	3.3	2	69	53	20	1040
3	Motor Control Shield	L293D	2	5	0.6	69	53	20	950
\.


--
-- Data for Name: motor_shields_and_microcontrollers_for_electronic_components; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.motor_shields_and_microcontrollers_for_electronic_components (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	2	1
8	2	2
9	2	3
10	2	4
11	2	5
12	2	6
13	3	2
14	3	3
15	3	5
16	3	6
\.


--
-- Data for Name: noise_sensors; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.noise_sensors (id, name, type, code, voltage_v, energy_ma, length_mm, width_mm, height_mm, price_rub) FROM stdin;
1	Noise Sensor	Troyka-module	AMP-B087	3.3	10	25.4	25.4	5	740
\.


--
-- Data for Name: noise_sensors_and_troyka_shields; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.noise_sensors_and_troyka_shields (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	3
\.


--
-- Data for Name: oneboard_computers; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.oneboard_computers (id, name, soc, arm, soc_fq_ghz, ram_gb, voltage_v, current_a, length_mm, width_mm, height_mm, price_rub, energy_ma) FROM stdin;
1	Raspberry Pi 4 Model B 2GB	Broadcom BCM2711	Cortex A72 4-core 64-bit	1.5	2	5	3	85	56	17	5890	540
2	Raspberry Pi 3 Model A+	Broadcom BCM2837B0	Cortex-A53 4-core 64-bit (ARMv8)	1.4	0.5	5	2.5	67	58	12	3190	400
3	Raspberry Pi Compute Module 3+	Broadcom BCM2837B0	Cortex-A53 64bit ARMv8	1.2	1	5	0.7	67.6	31	3.8	5890	250
4	Raspberry Pi Zero	Broadcom BCM2835	ARM1176JZ-F	1	0.5	3.3	0.7	66	32	5	2790	120
5	Raspberry Pi Zero W	Broadcom BCM2835	ARM1176JZ-F	1	0.5	3.3	0.7	66	32	5	2890	200
6	Raspberry Pi 4 Model B 4GB	Broadcom BCM2711	Cortex A72 4-core 64-bit	1.5	4	5	3	85	56	17	7140	640
7	Raspberry Pi 4 Model B 8GB	Broadcom BCM2711	Cortex A72 4-core 64-bit	1.5	8	5	3	85	56	17	8890	740
8	Raspberry Pi 3 Model B	Broadcom BCM2837	ARM Cortex-A53 4-core 64-bit	1.2	1	5	3	85	56	17	4250	300
9	Raspberry Pi 3 Model B+	Broadcom BCM2837	ARM Cortex-A53 4-core 64-bit	1.4	1	5	3	85	56	17	5000	400
\.


--
-- Data for Name: oneboard_computers_and_compatibility; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.oneboard_computers_and_compatibility (id, option_id, requirement_id) FROM stdin;
1	1	1
2	1	4
3	2	4
4	5	4
5	6	1
6	6	4
7	7	1
8	7	4
9	8	1
10	8	4
11	9	1
12	9	4
\.


--
-- Data for Name: oneboard_computers_and_links_between_devices; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.oneboard_computers_and_links_between_devices (id, option_1, option_2) FROM stdin;
1	1	1
2	1	3
3	2	1
4	2	3
5	5	1
6	5	3
7	6	1
8	6	3
9	7	1
10	7	3
11	8	1
12	8	3
13	9	1
14	9	3
\.


--
-- Data for Name: operating_systems_32bit; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.operating_systems_32bit (id, name, extra, version, size_mb) FROM stdin;
1	Raspberry Pi OS	with desktop and recommended software	5.10	2868
2	Raspberry Pi OS	with desktop	5.10	1175
3	Raspberry Pi OS	Lite	5.10	442
\.


--
-- Data for Name: operating_systems_32bit_and_compatibility; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.operating_systems_32bit_and_compatibility (id, option_id, requirement_id) FROM stdin;
1	1	2
2	1	3
3	1	5
4	2	2
5	2	3
6	2	5
7	3	2
8	3	3
9	3	5
\.


--
-- Data for Name: operating_systems_32bit_and_oneboard_computers; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.operating_systems_32bit_and_oneboard_computers (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	4
4	1	5
5	1	6
6	1	7
7	1	8
8	1	9
9	2	1
10	2	2
11	2	4
12	2	5
13	2	6
14	2	7
15	2	8
16	2	9
17	3	1
18	3	2
19	3	4
20	3	5
21	3	6
22	3	7
23	3	8
24	3	9
\.


--
-- Data for Name: resources_types; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.resources_types (id, description) FROM stdin;
1	An attacker can use only widely-spread software tools and exploit only known vulnerabilities
2	An attacker can use specialized software tools and exploit previously non-used vulnerabilities
3	An attacker has a possibility to investigate the system
\.


--
-- Data for Name: security_and_actions; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.security_and_actions (id, element_id, action_id) FROM stdin;
1	1	1
2	2	1
3	3	2
4	2	2
5	4	3
6	5	3
7	4	4
8	4	5
9	6	5
10	4	6
11	7	6
12	4	7
13	8	7
14	4	8
15	9	8
16	10	8
17	11	9
18	12	9
19	13	9
20	9	10
21	14	10
22	15	11
23	16	11
24	9	12
25	11	12
26	14	12
27	17	13
28	18	13
29	19	14
30	20	14
31	21	15
32	22	15
33	23	15
34	24	15
35	25	16
36	26	16
37	27	16
38	11	16
\.


--
-- Data for Name: security_and_levels; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.security_and_levels (id, element_id, level_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
6	4	2
7	6	2
8	7	2
9	8	2
10	9	2
11	10	2
12	11	3
13	12	3
14	13	3
15	9	3
16	14	3
17	15	3
18	16	3
19	10	3
20	17	4
21	18	4
22	19	4
23	20	4
24	21	4
25	22	4
26	23	4
27	24	4
28	25	4
29	26	4
30	27	4
31	11	4
\.


--
-- Data for Name: security_elements; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.security_elements (id, name) FROM stdin;
1	anomaly detection algorithm
2	hidden placement of sensors
3	events correlation algorithm
4	vandal-proof device case
5	hardware authentication
6	firmware encryption
7	bootloader encryption
8	removement of physical update interface
9	data encryption
10	mutual authentication
11	strong login credentials
12	password policy
13	brute-force protection
14	secure key distribution mechanism
15	behaviour-based anomaly detection
16	devices isolation / limitation
17	training of operators and users
18	security policy
19	uninterruptible power supplies
20	backup power supply
21	firewall
22	update mechanism
23	backup mechanism
24	logging mechanism
25	input validation
26	strict access policy
27	separate users for different operations
\.


--
-- Data for Name: selectable_elements; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.selectable_elements (id, element_id) FROM stdin;
1	1
2	2
3	4
4	5
5	6
6	7
7	8
8	9
9	10
10	11
11	12
12	13
13	14
14	15
15	16
16	17
17	18
18	21
19	22
20	23
\.


--
-- Data for Name: selectable_elements_and_db_tables; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.selectable_elements_and_db_tables (id, element_id, table_name) FROM stdin;
1	1	operating_systems_32bit
2	2	sql_databases
3	4	wireless_charge_receivers
4	5	batteries
5	6	collector_motors
6	7	distance_sensors
7	8	touch_sensors
8	9	servo_drives
9	10	motion_sensors
10	11	noise_sensors
11	12	wireless_signal_receivers
12	13	wireless_charge_transmitters
13	14	wireless_signal_transmitters
14	15	encoders
15	16	oneboard_computers
16	17	microcontrollers_for_electronic_components
17	18	mcs_for_ws_communication
18	21	micro_sds
19	22	motor_shields
20	23	troyka_shields
\.


--
-- Data for Name: servo_drives; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.servo_drives (id, name, code, rotation_dg, rot_mom_kgsm, rot_speed_s, voltage_v, energy_ma, length_mm, width_mm, height_mm, weight_g, price_rub) FROM stdin;
1	Feetech FS90	AMP-F001-U2	180	1.3	0.275	5	150	32	13	32	9	390
2	Feetech FS90R	AMP-F024	360	1.3	0.54	5	130	32	13	32	9	590
3	Feetech FS5106B	AMP-F004	180	6	0.4	5	150	54	20	47	40	840
4	Feetech FS5519M	AMP-F008	180	19	0.6	5	200	54	20	47	56	3190
5	Feetech FS5109M	AMP-F005	180	10	0.8	5	170	54	20	47	56	1390
\.


--
-- Data for Name: servo_drives_and_troyka_shields; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.servo_drives_and_troyka_shields (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	2
6	2	3
7	3	1
8	3	2
9	3	3
10	4	1
11	4	2
12	4	3
13	5	1
14	5	2
15	5	3
\.


--
-- Data for Name: sql_databases; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.sql_databases (id, name, os, "bit", version, size_mb) FROM stdin;
1	PostgreSQL	Windows	64	13	729
2	PostgreSQL	Windows	32	10	600
3	PostgreSQL	Debian	64	12	500
4	MySQL	Windows	32	8.0.25	450
\.


--
-- Data for Name: sql_databases_and_compatibility; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.sql_databases_and_compatibility (id, option_id, requirement_id) FROM stdin;
1	1	35
2	1	43
3	1	44
4	1	45
5	2	35
6	2	43
7	2	44
8	2	45
9	3	35
10	3	43
11	3	44
12	3	45
13	4	35
14	4	43
15	4	44
16	4	45
\.


--
-- Data for Name: sql_databases_and_operating_systems_32bit; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.sql_databases_and_operating_systems_32bit (id, option_1, option_2) FROM stdin;
1	3	1
2	3	2
3	3	3
\.


--
-- Data for Name: system_abilities; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.system_abilities (id, name) FROM stdin;
1	to store and process system data
2	to run executable applications
3	to download and install software updates
4	to create wireless access points
5	to communicate with mobile robots of the system
6	to communicate with charging stations of the system
7	to provide user interface for operators of the system
8	to provide wireless charging
9	to monitor the perimeter nearby
10	to communicate with the server of the system
11	to be charged in a wireless way
12	to navigate through the perimeter
13	to detect and chase intruders
\.


--
-- Data for Name: system_abilities_and_requirements; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.system_abilities_and_requirements (id, ability_id, requirement_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
6	6	1
7	7	1
8	8	2
9	9	2
10	5	2
11	10	2
12	11	3
13	12	3
14	13	3
15	6	3
16	10	3
\.


--
-- Data for Name: system_recommendations; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.system_recommendations (id, name) FROM stdin;
1	to develop and use strong password policy for all login credentials of the system
2	to educate operators and users of the system about social engineering attacks
3	to develop and use security policy regarding working with this system
\.


--
-- Data for Name: system_recommendations_and_security; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.system_recommendations_and_security (id, recommendation_id, security_id) FROM stdin;
1	1	12
2	2	17
3	3	18
\.


--
-- Data for Name: system_requirements; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.system_requirements (id, name) FROM stdin;
1	device that represents the server of the system
2	device that represents the charging stations of the system
3	device that represents the mobile robots of the system
\.


--
-- Data for Name: system_requirements_and_tasks; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.system_requirements_and_tasks (id, requirement_id, task_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	5
6	2	8
7	2	7
8	3	1
9	3	4
10	3	5
11	3	6
12	3	7
\.


--
-- Data for Name: system_tasks; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.system_tasks (id, name) FROM stdin;
1	centralized system management
2	static perimeter monitoring
3	mobile perimeter monitoring
\.


--
-- Data for Name: system_tasks_and_abilities; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.system_tasks_and_abilities (id, task_id, ability_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	2	8
9	2	9
10	2	5
11	2	10
12	3	11
13	3	12
14	3	13
15	3	6
16	3	10
\.


--
-- Data for Name: touch_sensors; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.touch_sensors (id, name, type, code, voltage_v, energy_ma, length_mm, width_mm, height_mm, price_rub) FROM stdin;
1	Clock Button	Troyka-module	AMP-B009	12	50	25.4	25.4	10	130
2	Clock Button	with Cap	AMP-X026-Y	12	50	10	10	10	60
3	Clock Button	without Cap	AMP-X017	12	50	10	10	5	20
4	Button with LED	Troyka-module	AMP-B077-R	3.3	50	25.4	25.4	10	260
\.


--
-- Data for Name: touch_sensors_and_troyka_shields; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.touch_sensors_and_troyka_shields (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	3
4	4	1
5	4	2
6	4	3
\.


--
-- Data for Name: troyka_shields; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.troyka_shields (id, name, svg, i2c, spi, length_mm, width_mm, height_mm, price_rub) FROM stdin;
1	Troyka Shield	20	3	1	69	53	19	740
2	Troyka Mega Tail Shield	49	0	0	43	53	19	740
3	Troyka Shield LP	20	2	2	69	53	19	1060
\.


--
-- Data for Name: troyka_shields_and_microcontrollers_for_electronic_components; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.troyka_shields_and_microcontrollers_for_electronic_components (id, option_1, option_2) FROM stdin;
1	1	1
2	1	3
3	1	4
4	1	5
5	1	6
6	2	1
7	2	3
8	2	4
9	2	5
10	2	6
11	3	1
12	3	3
13	3	4
14	3	5
15	3	6
\.


--
-- Data for Name: wireless_charge_receivers; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.wireless_charge_receivers (id, name, code, voltage_v, current_ma, length_mm, width_mm, height_mm, price_rub) FROM stdin;
1	Qi Receiver	234027318	5	800	70	43	3	397
2	Qi Receiver	231437087	5	1000	70	43	3	500
3	Qi Receiver	268685529	5	1000	70	43	1	490
\.


--
-- Data for Name: wireless_charge_receivers_and_batteries; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.wireless_charge_receivers_and_batteries (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	2	1
11	2	2
12	2	3
13	2	4
14	2	5
15	2	6
16	2	7
17	2	8
18	2	9
19	3	1
20	3	2
21	3	3
22	3	4
23	3	5
24	3	6
25	3	7
26	3	8
27	3	9
\.


--
-- Data for Name: wireless_charge_receivers_and_links_between_devices; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.wireless_charge_receivers_and_links_between_devices (id, option_1, option_2) FROM stdin;
1	1	6
2	2	6
3	3	6
\.


--
-- Data for Name: wireless_charge_transmitters; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.wireless_charge_transmitters (id, name, code, voltage_v, current_ma, distance_mm, length_mm, width_mm, height_mm, weight_g, price_rub) FROM stdin;
1	Wireless Charging Module	106990004	5	600	20	17	12	4	20	550
2	Wireless Charging Module	106990017	5	1200	10	22.1	13.1	3.2	20	780
3	Qi fast wireless charger	384169539659	5	2000	10	25	14	4	20	680
\.


--
-- Data for Name: wireless_charge_transmitters_and_batteries; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.wireless_charge_transmitters_and_batteries (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	2	1
11	2	2
12	2	3
13	2	4
14	2	5
15	2	6
16	2	7
17	2	8
18	2	9
19	3	1
20	3	2
21	3	3
22	3	4
23	3	5
24	3	6
25	3	7
26	3	8
27	3	9
\.


--
-- Data for Name: wireless_charge_transmitters_and_links_between_devices; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.wireless_charge_transmitters_and_links_between_devices (id, option_1, option_2) FROM stdin;
1	1	6
2	2	6
3	3	6
\.


--
-- Data for Name: wireless_signal_receivers; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.wireless_signal_receivers (id, name, type, code, frequency_khz, voltage_v, length_mm, width_mm, height_mm, price_rub) FROM stdin;
1	Infrared Receiver	Troyka-module	AMP-B006	38	3	25.4	25.4	15	200
2	Infrared Receiver		AMP-X023	38	3	16	10	10	140
3	Infrared Receiver		AMP-X022	36	3	16	10	10	140
4	Wireless Receiver		WRL-10532	433000	5	40	20	20	340
\.


--
-- Data for Name: wireless_signal_receivers_and_links_between_devices; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.wireless_signal_receivers_and_links_between_devices (id, option_1, option_2) FROM stdin;
1	1	5
2	2	5
3	3	5
\.


--
-- Data for Name: wireless_signal_receivers_and_troyka_shields; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.wireless_signal_receivers_and_troyka_shields (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	3
\.


--
-- Data for Name: wireless_signal_transmitters; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.wireless_signal_transmitters (id, name, type, code, frequency_khz, angle_dg, voltage_v, length_mm, width_mm, height_mm, price_rub) FROM stdin;
1	Infrared Transmitter	Troyka-module	AMP-B062-IR	38	30	3	25.4	25.4	5	150
2	Infrared LED		AMP-X010	38	30	1	2	2	2	30
3	Wireless Transmitter		WRL-10534	433000	360	3	20	20	5	290
\.


--
-- Data for Name: wireless_signal_transmitters_and_links_between_devices; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.wireless_signal_transmitters_and_links_between_devices (id, option_1, option_2) FROM stdin;
1	1	5
2	2	5
\.


--
-- Data for Name: wireless_signal_transmitters_and_troyka_shields; Type: TABLE DATA; Schema: public; Owner: design_admin
--

COPY public.wireless_signal_transmitters_and_troyka_shields (id, option_1, option_2) FROM stdin;
1	1	1
2	1	2
3	1	3
\.


--
-- Name: abstract_elements_and_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_elements_and_base_id_seq', 7, true);


--
-- Name: abstract_elements_and_dependencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_elements_and_dependencies_id_seq', 21, true);


--
-- Name: abstract_elements_and_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_elements_and_elements_id_seq', 3, true);


--
-- Name: abstract_elements_and_pins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_elements_and_pins_id_seq', 10, true);


--
-- Name: abstract_elements_and_requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_elements_and_requirements_id_seq', 16, true);


--
-- Name: abstract_elements_and_security_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_elements_and_security_id_seq', 3, true);


--
-- Name: abstract_elements_and_subelements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_elements_and_subelements_id_seq', 25, true);


--
-- Name: abstract_elements_and_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_elements_and_types_id_seq', 34, true);


--
-- Name: abstract_elements_combination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_elements_combination_id_seq', 27, true);


--
-- Name: abstract_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_elements_id_seq', 25, true);


--
-- Name: abstract_links_and_abilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_links_and_abilities_id_seq', 6, true);


--
-- Name: abstract_links_and_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_links_and_elements_id_seq', 27, true);


--
-- Name: abstract_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_links_id_seq', 14, true);


--
-- Name: abstract_subelements_and_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_subelements_and_base_id_seq', 4, true);


--
-- Name: abstract_subelements_and_flash_memory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_subelements_and_flash_memory_id_seq', 16, true);


--
-- Name: abstract_subelements_and_security_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_subelements_and_security_id_seq', 26, true);


--
-- Name: abstract_subelements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.abstract_subelements_id_seq', 46, true);


--
-- Name: access_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.access_types_id_seq', 5, true);


--
-- Name: attack_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.attack_actions_id_seq', 16, true);


--
-- Name: attack_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.attack_levels_id_seq', 4, true);


--
-- Name: attackers_and_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.attackers_and_actions_id_seq', 16, true);


--
-- Name: base_and_communication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.base_and_communication_id_seq', 7, true);


--
-- Name: batteries_and_links_between_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.batteries_and_links_between_devices_id_seq', 9, true);


--
-- Name: batteries_and_microcontrollers_for_electronic_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.batteries_and_microcontrollers_for_electronic_components_id_seq', 54, true);


--
-- Name: batteries_and_motor_shields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.batteries_and_motor_shields_id_seq', 6, true);


--
-- Name: batteries_and_oneboard_computers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.batteries_and_oneboard_computers_id_seq', 63, true);


--
-- Name: batteries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.batteries_id_seq', 9, true);


--
-- Name: collector_motors_and_motor_shields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.collector_motors_and_motor_shields_id_seq', 18, true);


--
-- Name: collector_motors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.collector_motors_id_seq', 6, true);


--
-- Name: communication_and_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.communication_and_actions_id_seq', 6, true);


--
-- Name: communication_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.communication_levels_id_seq', 4, true);


--
-- Name: device_abilities_and_requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.device_abilities_and_requirements_id_seq', 44, true);


--
-- Name: device_abilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.device_abilities_id_seq', 17, true);


--
-- Name: device_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.device_base_id_seq', 3, true);


--
-- Name: device_recommendations_and_security_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.device_recommendations_and_security_id_seq', 2, true);


--
-- Name: device_recommendations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.device_recommendations_id_seq', 2, true);


--
-- Name: device_requirements_and_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.device_requirements_and_base_id_seq', 37, true);


--
-- Name: device_requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.device_requirements_id_seq', 37, true);


--
-- Name: device_tasks_and_abilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.device_tasks_and_abilities_id_seq', 20, true);


--
-- Name: device_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.device_tasks_id_seq', 8, true);


--
-- Name: devices_are_linked_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.devices_are_linked_id_seq', 6, true);


--
-- Name: distance_sensors_and_troyka_shields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.distance_sensors_and_troyka_shields_id_seq', 12, true);


--
-- Name: distance_sensors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.distance_sensors_id_seq', 4, true);


--
-- Name: elements_and_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.elements_and_actions_id_seq', 14, true);


--
-- Name: elements_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.elements_types_id_seq', 13, true);


--
-- Name: encoders_and_troyka_shields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.encoders_and_troyka_shields_id_seq', 6, true);


--
-- Name: encoders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.encoders_id_seq', 3, true);


--
-- Name: knowledge_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.knowledge_types_id_seq', 4, true);


--
-- Name: levels_and_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.levels_and_actions_id_seq', 16, true);


--
-- Name: links_and_dependencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.links_and_dependencies_id_seq', 16, true);


--
-- Name: links_between_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.links_between_devices_id_seq', 6, true);


--
-- Name: mcs_for_ws_communication_and_compatibility_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.mcs_for_ws_communication_and_compatibility_id_seq', 5, true);


--
-- Name: mcs_for_ws_communication_and_links_between_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.mcs_for_ws_communication_and_links_between_devices_id_seq', 6, true);


--
-- Name: mcs_for_ws_communication_and_troyka_shields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.mcs_for_ws_communication_and_troyka_shields_id_seq', 18, true);


--
-- Name: mcs_for_ws_communication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.mcs_for_ws_communication_id_seq', 6, true);


--
-- Name: micro_sds_and_oneboard_computers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.micro_sds_and_oneboard_computers_id_seq', 56, true);


--
-- Name: micro_sds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.micro_sds_id_seq', 7, true);


--
-- Name: microcontrollers_for_electronic_components_and_compatibi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.microcontrollers_for_electronic_components_and_compatibi_id_seq', 6, true);


--
-- Name: microcontrollers_for_electronic_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.microcontrollers_for_electronic_components_id_seq', 6, true);


--
-- Name: motion_sensors_and_troyka_shields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.motion_sensors_and_troyka_shields_id_seq', 3, true);


--
-- Name: motion_sensors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.motion_sensors_id_seq', 3, true);


--
-- Name: motor_shields_and_microcontrollers_for_electronic_compon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.motor_shields_and_microcontrollers_for_electronic_compon_id_seq', 16, true);


--
-- Name: motor_shields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.motor_shields_id_seq', 3, true);


--
-- Name: noise_sensors_and_troyka_shields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.noise_sensors_and_troyka_shields_id_seq', 3, true);


--
-- Name: noise_sensors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.noise_sensors_id_seq', 1, true);


--
-- Name: oneboard_computers_and_compatibility_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.oneboard_computers_and_compatibility_id_seq', 12, true);


--
-- Name: oneboard_computers_and_links_between_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.oneboard_computers_and_links_between_devices_id_seq', 14, true);


--
-- Name: oneboard_computers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.oneboard_computers_id_seq', 9, true);


--
-- Name: operating_systems_32bit_and_compatibility_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.operating_systems_32bit_and_compatibility_id_seq', 9, true);


--
-- Name: operating_systems_32bit_and_oneboard_computers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.operating_systems_32bit_and_oneboard_computers_id_seq', 24, true);


--
-- Name: operating_systems_32bit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.operating_systems_32bit_id_seq', 3, true);


--
-- Name: resources_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.resources_types_id_seq', 3, true);


--
-- Name: security_and_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.security_and_actions_id_seq', 38, true);


--
-- Name: security_and_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.security_and_levels_id_seq', 31, true);


--
-- Name: security_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.security_elements_id_seq', 27, true);


--
-- Name: selectable_elements_and_db_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.selectable_elements_and_db_tables_id_seq', 20, true);


--
-- Name: selectable_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.selectable_elements_id_seq', 20, true);


--
-- Name: servo_drives_and_troyka_shields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.servo_drives_and_troyka_shields_id_seq', 15, true);


--
-- Name: servo_drives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.servo_drives_id_seq', 5, true);


--
-- Name: sql_databases_and_compatibility_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.sql_databases_and_compatibility_id_seq', 16, true);


--
-- Name: sql_databases_and_operating_systems_32bit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.sql_databases_and_operating_systems_32bit_id_seq', 3, true);


--
-- Name: sql_databases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.sql_databases_id_seq', 4, true);


--
-- Name: system_abilities_and_requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.system_abilities_and_requirements_id_seq', 16, true);


--
-- Name: system_abilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.system_abilities_id_seq', 13, true);


--
-- Name: system_recommendations_and_security_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.system_recommendations_and_security_id_seq', 3, true);


--
-- Name: system_recommendations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.system_recommendations_id_seq', 3, true);


--
-- Name: system_requirements_and_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.system_requirements_and_tasks_id_seq', 12, true);


--
-- Name: system_requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.system_requirements_id_seq', 3, true);


--
-- Name: system_tasks_and_abilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.system_tasks_and_abilities_id_seq', 16, true);


--
-- Name: system_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.system_tasks_id_seq', 3, true);


--
-- Name: touch_sensors_and_troyka_shields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.touch_sensors_and_troyka_shields_id_seq', 6, true);


--
-- Name: touch_sensors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.touch_sensors_id_seq', 4, true);


--
-- Name: troyka_shields_and_microcontrollers_for_electronic_compo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.troyka_shields_and_microcontrollers_for_electronic_compo_id_seq', 15, true);


--
-- Name: troyka_shields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.troyka_shields_id_seq', 3, true);


--
-- Name: wireless_charge_receivers_and_batteries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.wireless_charge_receivers_and_batteries_id_seq', 27, true);


--
-- Name: wireless_charge_receivers_and_links_between_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.wireless_charge_receivers_and_links_between_devices_id_seq', 3, true);


--
-- Name: wireless_charge_receivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.wireless_charge_receivers_id_seq', 3, true);


--
-- Name: wireless_charge_transmitters_and_batteries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.wireless_charge_transmitters_and_batteries_id_seq', 27, true);


--
-- Name: wireless_charge_transmitters_and_links_between_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.wireless_charge_transmitters_and_links_between_devices_id_seq', 3, true);


--
-- Name: wireless_charge_transmitters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.wireless_charge_transmitters_id_seq', 3, true);


--
-- Name: wireless_signal_receivers_and_links_between_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.wireless_signal_receivers_and_links_between_devices_id_seq', 3, true);


--
-- Name: wireless_signal_receivers_and_troyka_shields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.wireless_signal_receivers_and_troyka_shields_id_seq', 3, true);


--
-- Name: wireless_signal_receivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.wireless_signal_receivers_id_seq', 4, true);


--
-- Name: wireless_signal_transmitters_and_links_between_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.wireless_signal_transmitters_and_links_between_devices_id_seq', 2, true);


--
-- Name: wireless_signal_transmitters_and_troyka_shields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.wireless_signal_transmitters_and_troyka_shields_id_seq', 3, true);


--
-- Name: wireless_signal_transmitters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: design_admin
--

SELECT pg_catalog.setval('public.wireless_signal_transmitters_id_seq', 3, true);


--
-- Name: abstract_elements_and_base abstract_elements_and_base_element_id_base_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_base
    ADD CONSTRAINT abstract_elements_and_base_element_id_base_id_key UNIQUE (element_id, base_id);


--
-- Name: abstract_elements_and_base abstract_elements_and_base_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_base
    ADD CONSTRAINT abstract_elements_and_base_pkey PRIMARY KEY (id);


--
-- Name: abstract_elements_and_dependencies abstract_elements_and_dependencies_element_1_element_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_dependencies
    ADD CONSTRAINT abstract_elements_and_dependencies_element_1_element_2_key UNIQUE (element_1, element_2);


--
-- Name: abstract_elements_and_dependencies abstract_elements_and_dependencies_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_dependencies
    ADD CONSTRAINT abstract_elements_and_dependencies_pkey PRIMARY KEY (id);


--
-- Name: abstract_elements_and_elements abstract_elements_and_elements_element_1_element_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_elements
    ADD CONSTRAINT abstract_elements_and_elements_element_1_element_2_key UNIQUE (element_1, element_2);


--
-- Name: abstract_elements_and_elements abstract_elements_and_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_elements
    ADD CONSTRAINT abstract_elements_and_elements_pkey PRIMARY KEY (id);


--
-- Name: abstract_elements_and_pins abstract_elements_and_pins_element_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_pins
    ADD CONSTRAINT abstract_elements_and_pins_element_id_key UNIQUE (element_id);


--
-- Name: abstract_elements_and_pins abstract_elements_and_pins_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_pins
    ADD CONSTRAINT abstract_elements_and_pins_pkey PRIMARY KEY (id);


--
-- Name: abstract_elements_and_requirements abstract_elements_and_requirement_element_id_requirement_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_requirements
    ADD CONSTRAINT abstract_elements_and_requirement_element_id_requirement_id_key UNIQUE (element_id, requirement_id);


--
-- Name: abstract_elements_and_requirements abstract_elements_and_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_requirements
    ADD CONSTRAINT abstract_elements_and_requirements_pkey PRIMARY KEY (id);


--
-- Name: abstract_elements_and_security abstract_elements_and_security_element_1_element_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_security
    ADD CONSTRAINT abstract_elements_and_security_element_1_element_2_key UNIQUE (element_1, element_2);


--
-- Name: abstract_elements_and_security abstract_elements_and_security_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_security
    ADD CONSTRAINT abstract_elements_and_security_pkey PRIMARY KEY (id);


--
-- Name: abstract_elements_and_subelements abstract_elements_and_subelem_requirement_id_element_id_sub_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_subelements
    ADD CONSTRAINT abstract_elements_and_subelem_requirement_id_element_id_sub_key UNIQUE (requirement_id, element_id, subelement_id);


--
-- Name: abstract_elements_and_subelements abstract_elements_and_subelements_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_subelements
    ADD CONSTRAINT abstract_elements_and_subelements_pkey PRIMARY KEY (id);


--
-- Name: abstract_elements_and_types abstract_elements_and_types_element_id_type_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_types
    ADD CONSTRAINT abstract_elements_and_types_element_id_type_id_key UNIQUE (element_id, type_id);


--
-- Name: abstract_elements_and_types abstract_elements_and_types_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_types
    ADD CONSTRAINT abstract_elements_and_types_pkey PRIMARY KEY (id);


--
-- Name: abstract_elements_combination abstract_elements_combination_element_1_element_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_combination
    ADD CONSTRAINT abstract_elements_combination_element_1_element_2_key UNIQUE (element_1, element_2);


--
-- Name: abstract_elements_combination abstract_elements_combination_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_combination
    ADD CONSTRAINT abstract_elements_combination_pkey PRIMARY KEY (id);


--
-- Name: abstract_elements abstract_elements_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements
    ADD CONSTRAINT abstract_elements_name_key UNIQUE (name);


--
-- Name: abstract_elements abstract_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements
    ADD CONSTRAINT abstract_elements_pkey PRIMARY KEY (id);


--
-- Name: abstract_links_and_abilities abstract_links_and_abilities_link_id_ability_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_links_and_abilities
    ADD CONSTRAINT abstract_links_and_abilities_link_id_ability_id_key UNIQUE (link_id, ability_id);


--
-- Name: abstract_links_and_abilities abstract_links_and_abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_links_and_abilities
    ADD CONSTRAINT abstract_links_and_abilities_pkey PRIMARY KEY (id);


--
-- Name: abstract_links_and_elements abstract_links_and_elements_element_1_element_2_link_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_links_and_elements
    ADD CONSTRAINT abstract_links_and_elements_element_1_element_2_link_id_key UNIQUE (element_1, element_2, link_id);


--
-- Name: abstract_links_and_elements abstract_links_and_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_links_and_elements
    ADD CONSTRAINT abstract_links_and_elements_pkey PRIMARY KEY (id);


--
-- Name: abstract_links abstract_links_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_links
    ADD CONSTRAINT abstract_links_name_key UNIQUE (name);


--
-- Name: abstract_links abstract_links_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_links
    ADD CONSTRAINT abstract_links_pkey PRIMARY KEY (id);


--
-- Name: abstract_subelements_and_base abstract_subelements_and_base_element_id_subelement_id_base_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_base
    ADD CONSTRAINT abstract_subelements_and_base_element_id_subelement_id_base_key UNIQUE (element_id, subelement_id, base_id);


--
-- Name: abstract_subelements_and_base abstract_subelements_and_base_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_base
    ADD CONSTRAINT abstract_subelements_and_base_pkey PRIMARY KEY (id);


--
-- Name: abstract_subelements_and_flash_memory abstract_subelements_and_flash_memory_element_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_flash_memory
    ADD CONSTRAINT abstract_subelements_and_flash_memory_element_id_key UNIQUE (element_id);


--
-- Name: abstract_subelements_and_flash_memory abstract_subelements_and_flash_memory_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_flash_memory
    ADD CONSTRAINT abstract_subelements_and_flash_memory_pkey PRIMARY KEY (id);


--
-- Name: abstract_subelements_and_security abstract_subelements_and_secu_element_id_subelement_id_secu_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_security
    ADD CONSTRAINT abstract_subelements_and_secu_element_id_subelement_id_secu_key UNIQUE (element_id, subelement_id, security_id);


--
-- Name: abstract_subelements_and_security abstract_subelements_and_security_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_security
    ADD CONSTRAINT abstract_subelements_and_security_pkey PRIMARY KEY (id);


--
-- Name: abstract_subelements abstract_subelements_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements
    ADD CONSTRAINT abstract_subelements_name_key UNIQUE (name);


--
-- Name: abstract_subelements abstract_subelements_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements
    ADD CONSTRAINT abstract_subelements_pkey PRIMARY KEY (id);


--
-- Name: access_types access_types_description_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.access_types
    ADD CONSTRAINT access_types_description_key UNIQUE (description);


--
-- Name: access_types access_types_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.access_types
    ADD CONSTRAINT access_types_pkey PRIMARY KEY (id);


--
-- Name: attack_actions attack_actions_description_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attack_actions
    ADD CONSTRAINT attack_actions_description_key UNIQUE (description);


--
-- Name: attack_actions attack_actions_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attack_actions
    ADD CONSTRAINT attack_actions_name_key UNIQUE (name);


--
-- Name: attack_actions attack_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attack_actions
    ADD CONSTRAINT attack_actions_pkey PRIMARY KEY (id);


--
-- Name: attack_levels attack_levels_description_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attack_levels
    ADD CONSTRAINT attack_levels_description_key UNIQUE (description);


--
-- Name: attack_levels attack_levels_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attack_levels
    ADD CONSTRAINT attack_levels_name_key UNIQUE (name);


--
-- Name: attack_levels attack_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attack_levels
    ADD CONSTRAINT attack_levels_pkey PRIMARY KEY (id);


--
-- Name: attackers_and_actions attackers_and_actions_action_id_access_id_knowledge_id_reso_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attackers_and_actions
    ADD CONSTRAINT attackers_and_actions_action_id_access_id_knowledge_id_reso_key UNIQUE (action_id, access_id, knowledge_id, resources_id);


--
-- Name: attackers_and_actions attackers_and_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attackers_and_actions
    ADD CONSTRAINT attackers_and_actions_pkey PRIMARY KEY (id);


--
-- Name: base_and_communication base_and_communication_base_id_type_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.base_and_communication
    ADD CONSTRAINT base_and_communication_base_id_type_id_key UNIQUE (base_id, type_id);


--
-- Name: base_and_communication base_and_communication_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.base_and_communication
    ADD CONSTRAINT base_and_communication_pkey PRIMARY KEY (id);


--
-- Name: batteries_and_links_between_devices batteries_and_links_between_devices_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_links_between_devices
    ADD CONSTRAINT batteries_and_links_between_devices_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: batteries_and_links_between_devices batteries_and_links_between_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_links_between_devices
    ADD CONSTRAINT batteries_and_links_between_devices_pkey PRIMARY KEY (id);


--
-- Name: batteries_and_microcontrollers_for_electronic_components batteries_and_microcontrollers_for_electr_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_microcontrollers_for_electronic_components
    ADD CONSTRAINT batteries_and_microcontrollers_for_electr_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: batteries_and_microcontrollers_for_electronic_components batteries_and_microcontrollers_for_electronic_components_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_microcontrollers_for_electronic_components
    ADD CONSTRAINT batteries_and_microcontrollers_for_electronic_components_pkey PRIMARY KEY (id);


--
-- Name: batteries_and_motor_shields batteries_and_motor_shields_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_motor_shields
    ADD CONSTRAINT batteries_and_motor_shields_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: batteries_and_motor_shields batteries_and_motor_shields_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_motor_shields
    ADD CONSTRAINT batteries_and_motor_shields_pkey PRIMARY KEY (id);


--
-- Name: batteries_and_oneboard_computers batteries_and_oneboard_computers_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_oneboard_computers
    ADD CONSTRAINT batteries_and_oneboard_computers_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: batteries_and_oneboard_computers batteries_and_oneboard_computers_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_oneboard_computers
    ADD CONSTRAINT batteries_and_oneboard_computers_pkey PRIMARY KEY (id);


--
-- Name: batteries batteries_name_code_capacity_mah_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries
    ADD CONSTRAINT batteries_name_code_capacity_mah_key UNIQUE (name, code, capacity_mah);


--
-- Name: batteries batteries_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries
    ADD CONSTRAINT batteries_pkey PRIMARY KEY (id);


--
-- Name: collector_motors_and_motor_shields collector_motors_and_motor_shields_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.collector_motors_and_motor_shields
    ADD CONSTRAINT collector_motors_and_motor_shields_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: collector_motors_and_motor_shields collector_motors_and_motor_shields_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.collector_motors_and_motor_shields
    ADD CONSTRAINT collector_motors_and_motor_shields_pkey PRIMARY KEY (id);


--
-- Name: collector_motors collector_motors_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.collector_motors
    ADD CONSTRAINT collector_motors_pkey PRIMARY KEY (id);


--
-- Name: collector_motors collector_motors_voltage_v_speed_rpm_energy_ma_ratio_length_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.collector_motors
    ADD CONSTRAINT collector_motors_voltage_v_speed_rpm_energy_ma_ratio_length_key UNIQUE (voltage_v, speed_rpm, energy_ma, ratio, length_mm, width_mm, height_mm);


--
-- Name: communication_and_actions communication_and_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.communication_and_actions
    ADD CONSTRAINT communication_and_actions_pkey PRIMARY KEY (id);


--
-- Name: communication_and_actions communication_and_actions_type_id_action_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.communication_and_actions
    ADD CONSTRAINT communication_and_actions_type_id_action_id_key UNIQUE (type_id, action_id);


--
-- Name: communication_levels communication_levels_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.communication_levels
    ADD CONSTRAINT communication_levels_name_key UNIQUE (name);


--
-- Name: communication_levels communication_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.communication_levels
    ADD CONSTRAINT communication_levels_pkey PRIMARY KEY (id);


--
-- Name: device_abilities_and_requirements device_abilities_and_requirements_ability_id_requirement_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_abilities_and_requirements
    ADD CONSTRAINT device_abilities_and_requirements_ability_id_requirement_id_key UNIQUE (ability_id, requirement_id);


--
-- Name: device_abilities_and_requirements device_abilities_and_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_abilities_and_requirements
    ADD CONSTRAINT device_abilities_and_requirements_pkey PRIMARY KEY (id);


--
-- Name: device_abilities device_abilities_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_abilities
    ADD CONSTRAINT device_abilities_name_key UNIQUE (name);


--
-- Name: device_abilities device_abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_abilities
    ADD CONSTRAINT device_abilities_pkey PRIMARY KEY (id);


--
-- Name: device_base device_base_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_base
    ADD CONSTRAINT device_base_name_key UNIQUE (name);


--
-- Name: device_base device_base_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_base
    ADD CONSTRAINT device_base_pkey PRIMARY KEY (id);


--
-- Name: device_recommendations_and_security device_recommendations_and_se_recommendation_id_security_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_recommendations_and_security
    ADD CONSTRAINT device_recommendations_and_se_recommendation_id_security_id_key UNIQUE (recommendation_id, security_id);


--
-- Name: device_recommendations_and_security device_recommendations_and_security_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_recommendations_and_security
    ADD CONSTRAINT device_recommendations_and_security_pkey PRIMARY KEY (id);


--
-- Name: device_recommendations device_recommendations_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_recommendations
    ADD CONSTRAINT device_recommendations_name_key UNIQUE (name);


--
-- Name: device_recommendations device_recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_recommendations
    ADD CONSTRAINT device_recommendations_pkey PRIMARY KEY (id);


--
-- Name: device_requirements_and_base device_requirements_and_base_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_requirements_and_base
    ADD CONSTRAINT device_requirements_and_base_pkey PRIMARY KEY (id);


--
-- Name: device_requirements_and_base device_requirements_and_base_requirement_id_base_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_requirements_and_base
    ADD CONSTRAINT device_requirements_and_base_requirement_id_base_id_key UNIQUE (requirement_id, base_id);


--
-- Name: device_requirements device_requirements_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_requirements
    ADD CONSTRAINT device_requirements_name_key UNIQUE (name);


--
-- Name: device_requirements device_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_requirements
    ADD CONSTRAINT device_requirements_pkey PRIMARY KEY (id);


--
-- Name: device_tasks_and_abilities device_tasks_and_abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_tasks_and_abilities
    ADD CONSTRAINT device_tasks_and_abilities_pkey PRIMARY KEY (id);


--
-- Name: device_tasks_and_abilities device_tasks_and_abilities_task_id_ability_id_requirement_i_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_tasks_and_abilities
    ADD CONSTRAINT device_tasks_and_abilities_task_id_ability_id_requirement_i_key UNIQUE (task_id, ability_id, requirement_id);


--
-- Name: device_tasks device_tasks_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_tasks
    ADD CONSTRAINT device_tasks_name_key UNIQUE (name);


--
-- Name: device_tasks device_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_tasks
    ADD CONSTRAINT device_tasks_pkey PRIMARY KEY (id);


--
-- Name: devices_are_linked devices_are_linked_ability_1_ability_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.devices_are_linked
    ADD CONSTRAINT devices_are_linked_ability_1_ability_2_key UNIQUE (ability_1, ability_2);


--
-- Name: devices_are_linked devices_are_linked_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.devices_are_linked
    ADD CONSTRAINT devices_are_linked_pkey PRIMARY KEY (id);


--
-- Name: distance_sensors_and_troyka_shields distance_sensors_and_troyka_shields_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.distance_sensors_and_troyka_shields
    ADD CONSTRAINT distance_sensors_and_troyka_shields_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: distance_sensors_and_troyka_shields distance_sensors_and_troyka_shields_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.distance_sensors_and_troyka_shields
    ADD CONSTRAINT distance_sensors_and_troyka_shields_pkey PRIMARY KEY (id);


--
-- Name: distance_sensors distance_sensors_code_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.distance_sensors
    ADD CONSTRAINT distance_sensors_code_key UNIQUE (code);


--
-- Name: distance_sensors distance_sensors_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.distance_sensors
    ADD CONSTRAINT distance_sensors_pkey PRIMARY KEY (id);


--
-- Name: elements_and_actions elements_and_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.elements_and_actions
    ADD CONSTRAINT elements_and_actions_pkey PRIMARY KEY (id);


--
-- Name: elements_and_actions elements_and_actions_type_id_action_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.elements_and_actions
    ADD CONSTRAINT elements_and_actions_type_id_action_id_key UNIQUE (type_id, action_id);


--
-- Name: elements_types elements_types_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.elements_types
    ADD CONSTRAINT elements_types_name_key UNIQUE (name);


--
-- Name: elements_types elements_types_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.elements_types
    ADD CONSTRAINT elements_types_pkey PRIMARY KEY (id);


--
-- Name: encoders_and_troyka_shields encoders_and_troyka_shields_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.encoders_and_troyka_shields
    ADD CONSTRAINT encoders_and_troyka_shields_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: encoders_and_troyka_shields encoders_and_troyka_shields_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.encoders_and_troyka_shields
    ADD CONSTRAINT encoders_and_troyka_shields_pkey PRIMARY KEY (id);


--
-- Name: encoders encoders_code_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.encoders
    ADD CONSTRAINT encoders_code_key UNIQUE (code);


--
-- Name: encoders encoders_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.encoders
    ADD CONSTRAINT encoders_pkey PRIMARY KEY (id);


--
-- Name: knowledge_types knowledge_types_description_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.knowledge_types
    ADD CONSTRAINT knowledge_types_description_key UNIQUE (description);


--
-- Name: knowledge_types knowledge_types_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.knowledge_types
    ADD CONSTRAINT knowledge_types_pkey PRIMARY KEY (id);


--
-- Name: levels_and_actions levels_and_actions_level_id_action_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.levels_and_actions
    ADD CONSTRAINT levels_and_actions_level_id_action_id_key UNIQUE (level_id, action_id);


--
-- Name: levels_and_actions levels_and_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.levels_and_actions
    ADD CONSTRAINT levels_and_actions_pkey PRIMARY KEY (id);


--
-- Name: links_and_dependencies links_and_dependencies_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.links_and_dependencies
    ADD CONSTRAINT links_and_dependencies_pkey PRIMARY KEY (id);


--
-- Name: links_between_devices links_between_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.links_between_devices
    ADD CONSTRAINT links_between_devices_pkey PRIMARY KEY (id);


--
-- Name: mcs_for_ws_communication_and_compatibility mcs_for_ws_communication_and_compa_option_id_requirement_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_compatibility
    ADD CONSTRAINT mcs_for_ws_communication_and_compa_option_id_requirement_id_key UNIQUE (option_id, requirement_id);


--
-- Name: mcs_for_ws_communication_and_compatibility mcs_for_ws_communication_and_compatibility_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_compatibility
    ADD CONSTRAINT mcs_for_ws_communication_and_compatibility_pkey PRIMARY KEY (id);


--
-- Name: mcs_for_ws_communication_and_links_between_devices mcs_for_ws_communication_and_links_betwee_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_links_between_devices
    ADD CONSTRAINT mcs_for_ws_communication_and_links_betwee_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: mcs_for_ws_communication_and_links_between_devices mcs_for_ws_communication_and_links_between_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_links_between_devices
    ADD CONSTRAINT mcs_for_ws_communication_and_links_between_devices_pkey PRIMARY KEY (id);


--
-- Name: mcs_for_ws_communication_and_troyka_shields mcs_for_ws_communication_and_troyka_shiel_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_troyka_shields
    ADD CONSTRAINT mcs_for_ws_communication_and_troyka_shiel_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: mcs_for_ws_communication_and_troyka_shields mcs_for_ws_communication_and_troyka_shields_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_troyka_shields
    ADD CONSTRAINT mcs_for_ws_communication_and_troyka_shields_pkey PRIMARY KEY (id);


--
-- Name: mcs_for_ws_communication mcs_for_ws_communication_code_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication
    ADD CONSTRAINT mcs_for_ws_communication_code_key UNIQUE (code);


--
-- Name: mcs_for_ws_communication mcs_for_ws_communication_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication
    ADD CONSTRAINT mcs_for_ws_communication_pkey PRIMARY KEY (id);


--
-- Name: micro_sds_and_oneboard_computers micro_sds_and_oneboard_computers_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.micro_sds_and_oneboard_computers
    ADD CONSTRAINT micro_sds_and_oneboard_computers_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: micro_sds_and_oneboard_computers micro_sds_and_oneboard_computers_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.micro_sds_and_oneboard_computers
    ADD CONSTRAINT micro_sds_and_oneboard_computers_pkey PRIMARY KEY (id);


--
-- Name: micro_sds micro_sds_name_memory_gb_class_speed_mbs_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.micro_sds
    ADD CONSTRAINT micro_sds_name_memory_gb_class_speed_mbs_key UNIQUE (name, memory_gb, class, speed_mbs);


--
-- Name: micro_sds micro_sds_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.micro_sds
    ADD CONSTRAINT micro_sds_pkey PRIMARY KEY (id);


--
-- Name: microcontrollers_for_electronic_components_and_compatibility microcontrollers_for_electronic_co_option_id_requirement_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.microcontrollers_for_electronic_components_and_compatibility
    ADD CONSTRAINT microcontrollers_for_electronic_co_option_id_requirement_id_key UNIQUE (option_id, requirement_id);


--
-- Name: microcontrollers_for_electronic_components_and_compatibility microcontrollers_for_electronic_components_and_compatibili_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.microcontrollers_for_electronic_components_and_compatibility
    ADD CONSTRAINT microcontrollers_for_electronic_components_and_compatibili_pkey PRIMARY KEY (id);


--
-- Name: microcontrollers_for_electronic_components microcontrollers_for_electronic_components_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.microcontrollers_for_electronic_components
    ADD CONSTRAINT microcontrollers_for_electronic_components_name_key UNIQUE (name);


--
-- Name: microcontrollers_for_electronic_components microcontrollers_for_electronic_components_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.microcontrollers_for_electronic_components
    ADD CONSTRAINT microcontrollers_for_electronic_components_pkey PRIMARY KEY (id);


--
-- Name: motion_sensors_and_troyka_shields motion_sensors_and_troyka_shields_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motion_sensors_and_troyka_shields
    ADD CONSTRAINT motion_sensors_and_troyka_shields_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: motion_sensors_and_troyka_shields motion_sensors_and_troyka_shields_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motion_sensors_and_troyka_shields
    ADD CONSTRAINT motion_sensors_and_troyka_shields_pkey PRIMARY KEY (id);


--
-- Name: motion_sensors motion_sensors_code_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motion_sensors
    ADD CONSTRAINT motion_sensors_code_key UNIQUE (code);


--
-- Name: motion_sensors motion_sensors_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motion_sensors
    ADD CONSTRAINT motion_sensors_pkey PRIMARY KEY (id);


--
-- Name: motor_shields_and_microcontrollers_for_electronic_components motor_shields_and_microcontrollers_for_el_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motor_shields_and_microcontrollers_for_electronic_components
    ADD CONSTRAINT motor_shields_and_microcontrollers_for_el_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: motor_shields_and_microcontrollers_for_electronic_components motor_shields_and_microcontrollers_for_electronic_componen_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motor_shields_and_microcontrollers_for_electronic_components
    ADD CONSTRAINT motor_shields_and_microcontrollers_for_electronic_componen_pkey PRIMARY KEY (id);


--
-- Name: motor_shields motor_shields_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motor_shields
    ADD CONSTRAINT motor_shields_name_key UNIQUE (name);


--
-- Name: motor_shields motor_shields_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motor_shields
    ADD CONSTRAINT motor_shields_pkey PRIMARY KEY (id);


--
-- Name: noise_sensors_and_troyka_shields noise_sensors_and_troyka_shields_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.noise_sensors_and_troyka_shields
    ADD CONSTRAINT noise_sensors_and_troyka_shields_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: noise_sensors_and_troyka_shields noise_sensors_and_troyka_shields_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.noise_sensors_and_troyka_shields
    ADD CONSTRAINT noise_sensors_and_troyka_shields_pkey PRIMARY KEY (id);


--
-- Name: noise_sensors noise_sensors_code_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.noise_sensors
    ADD CONSTRAINT noise_sensors_code_key UNIQUE (code);


--
-- Name: noise_sensors noise_sensors_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.noise_sensors
    ADD CONSTRAINT noise_sensors_pkey PRIMARY KEY (id);


--
-- Name: oneboard_computers_and_compatibility oneboard_computers_and_compatibili_option_id_requirement_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.oneboard_computers_and_compatibility
    ADD CONSTRAINT oneboard_computers_and_compatibili_option_id_requirement_id_key UNIQUE (option_id, requirement_id);


--
-- Name: oneboard_computers_and_compatibility oneboard_computers_and_compatibility_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.oneboard_computers_and_compatibility
    ADD CONSTRAINT oneboard_computers_and_compatibility_pkey PRIMARY KEY (id);


--
-- Name: oneboard_computers_and_links_between_devices oneboard_computers_and_links_between_devi_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.oneboard_computers_and_links_between_devices
    ADD CONSTRAINT oneboard_computers_and_links_between_devi_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: oneboard_computers_and_links_between_devices oneboard_computers_and_links_between_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.oneboard_computers_and_links_between_devices
    ADD CONSTRAINT oneboard_computers_and_links_between_devices_pkey PRIMARY KEY (id);


--
-- Name: oneboard_computers oneboard_computers_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.oneboard_computers
    ADD CONSTRAINT oneboard_computers_name_key UNIQUE (name);


--
-- Name: oneboard_computers oneboard_computers_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.oneboard_computers
    ADD CONSTRAINT oneboard_computers_pkey PRIMARY KEY (id);


--
-- Name: operating_systems_32bit_and_compatibility operating_systems_32bit_and_compat_option_id_requirement_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.operating_systems_32bit_and_compatibility
    ADD CONSTRAINT operating_systems_32bit_and_compat_option_id_requirement_id_key UNIQUE (option_id, requirement_id);


--
-- Name: operating_systems_32bit_and_compatibility operating_systems_32bit_and_compatibility_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.operating_systems_32bit_and_compatibility
    ADD CONSTRAINT operating_systems_32bit_and_compatibility_pkey PRIMARY KEY (id);


--
-- Name: operating_systems_32bit_and_oneboard_computers operating_systems_32bit_and_oneboard_comp_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.operating_systems_32bit_and_oneboard_computers
    ADD CONSTRAINT operating_systems_32bit_and_oneboard_comp_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: operating_systems_32bit_and_oneboard_computers operating_systems_32bit_and_oneboard_computers_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.operating_systems_32bit_and_oneboard_computers
    ADD CONSTRAINT operating_systems_32bit_and_oneboard_computers_pkey PRIMARY KEY (id);


--
-- Name: operating_systems_32bit operating_systems_32bit_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.operating_systems_32bit
    ADD CONSTRAINT operating_systems_32bit_pkey PRIMARY KEY (id);


--
-- Name: resources_types resources_types_description_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.resources_types
    ADD CONSTRAINT resources_types_description_key UNIQUE (description);


--
-- Name: resources_types resources_types_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.resources_types
    ADD CONSTRAINT resources_types_pkey PRIMARY KEY (id);


--
-- Name: security_and_actions security_and_actions_element_id_action_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.security_and_actions
    ADD CONSTRAINT security_and_actions_element_id_action_id_key UNIQUE (element_id, action_id);


--
-- Name: security_and_actions security_and_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.security_and_actions
    ADD CONSTRAINT security_and_actions_pkey PRIMARY KEY (id);


--
-- Name: security_and_levels security_and_levels_element_id_level_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.security_and_levels
    ADD CONSTRAINT security_and_levels_element_id_level_id_key UNIQUE (element_id, level_id);


--
-- Name: security_and_levels security_and_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.security_and_levels
    ADD CONSTRAINT security_and_levels_pkey PRIMARY KEY (id);


--
-- Name: security_elements security_elements_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.security_elements
    ADD CONSTRAINT security_elements_name_key UNIQUE (name);


--
-- Name: security_elements security_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.security_elements
    ADD CONSTRAINT security_elements_pkey PRIMARY KEY (id);


--
-- Name: selectable_elements_and_db_tables selectable_elements_and_db_tables_element_id_table_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.selectable_elements_and_db_tables
    ADD CONSTRAINT selectable_elements_and_db_tables_element_id_table_name_key UNIQUE (element_id, table_name);


--
-- Name: selectable_elements_and_db_tables selectable_elements_and_db_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.selectable_elements_and_db_tables
    ADD CONSTRAINT selectable_elements_and_db_tables_pkey PRIMARY KEY (id);


--
-- Name: selectable_elements_and_db_tables selectable_elements_and_db_tables_table_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.selectable_elements_and_db_tables
    ADD CONSTRAINT selectable_elements_and_db_tables_table_name_key UNIQUE (table_name);


--
-- Name: selectable_elements selectable_elements_element_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.selectable_elements
    ADD CONSTRAINT selectable_elements_element_id_key UNIQUE (element_id);


--
-- Name: selectable_elements selectable_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.selectable_elements
    ADD CONSTRAINT selectable_elements_pkey PRIMARY KEY (id);


--
-- Name: servo_drives_and_troyka_shields servo_drives_and_troyka_shields_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.servo_drives_and_troyka_shields
    ADD CONSTRAINT servo_drives_and_troyka_shields_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: servo_drives_and_troyka_shields servo_drives_and_troyka_shields_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.servo_drives_and_troyka_shields
    ADD CONSTRAINT servo_drives_and_troyka_shields_pkey PRIMARY KEY (id);


--
-- Name: servo_drives servo_drives_code_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.servo_drives
    ADD CONSTRAINT servo_drives_code_key UNIQUE (code);


--
-- Name: servo_drives servo_drives_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.servo_drives
    ADD CONSTRAINT servo_drives_pkey PRIMARY KEY (id);


--
-- Name: sql_databases_and_compatibility sql_databases_and_compatibility_option_id_requirement_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.sql_databases_and_compatibility
    ADD CONSTRAINT sql_databases_and_compatibility_option_id_requirement_id_key UNIQUE (option_id, requirement_id);


--
-- Name: sql_databases_and_compatibility sql_databases_and_compatibility_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.sql_databases_and_compatibility
    ADD CONSTRAINT sql_databases_and_compatibility_pkey PRIMARY KEY (id);


--
-- Name: sql_databases_and_operating_systems_32bit sql_databases_and_operating_systems_32bit_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.sql_databases_and_operating_systems_32bit
    ADD CONSTRAINT sql_databases_and_operating_systems_32bit_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: sql_databases_and_operating_systems_32bit sql_databases_and_operating_systems_32bit_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.sql_databases_and_operating_systems_32bit
    ADD CONSTRAINT sql_databases_and_operating_systems_32bit_pkey PRIMARY KEY (id);


--
-- Name: sql_databases sql_databases_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.sql_databases
    ADD CONSTRAINT sql_databases_pkey PRIMARY KEY (id);


--
-- Name: system_abilities_and_requirements system_abilities_and_requirements_ability_id_requirement_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_abilities_and_requirements
    ADD CONSTRAINT system_abilities_and_requirements_ability_id_requirement_id_key UNIQUE (ability_id, requirement_id);


--
-- Name: system_abilities_and_requirements system_abilities_and_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_abilities_and_requirements
    ADD CONSTRAINT system_abilities_and_requirements_pkey PRIMARY KEY (id);


--
-- Name: system_abilities system_abilities_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_abilities
    ADD CONSTRAINT system_abilities_name_key UNIQUE (name);


--
-- Name: system_abilities system_abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_abilities
    ADD CONSTRAINT system_abilities_pkey PRIMARY KEY (id);


--
-- Name: system_recommendations_and_security system_recommendations_and_se_recommendation_id_security_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_recommendations_and_security
    ADD CONSTRAINT system_recommendations_and_se_recommendation_id_security_id_key UNIQUE (recommendation_id, security_id);


--
-- Name: system_recommendations_and_security system_recommendations_and_security_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_recommendations_and_security
    ADD CONSTRAINT system_recommendations_and_security_pkey PRIMARY KEY (id);


--
-- Name: system_recommendations system_recommendations_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_recommendations
    ADD CONSTRAINT system_recommendations_name_key UNIQUE (name);


--
-- Name: system_recommendations system_recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_recommendations
    ADD CONSTRAINT system_recommendations_pkey PRIMARY KEY (id);


--
-- Name: system_requirements_and_tasks system_requirements_and_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_requirements_and_tasks
    ADD CONSTRAINT system_requirements_and_tasks_pkey PRIMARY KEY (id);


--
-- Name: system_requirements_and_tasks system_requirements_and_tasks_requirement_id_task_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_requirements_and_tasks
    ADD CONSTRAINT system_requirements_and_tasks_requirement_id_task_id_key UNIQUE (requirement_id, task_id);


--
-- Name: system_requirements system_requirements_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_requirements
    ADD CONSTRAINT system_requirements_name_key UNIQUE (name);


--
-- Name: system_requirements system_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_requirements
    ADD CONSTRAINT system_requirements_pkey PRIMARY KEY (id);


--
-- Name: system_tasks_and_abilities system_tasks_and_abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_tasks_and_abilities
    ADD CONSTRAINT system_tasks_and_abilities_pkey PRIMARY KEY (id);


--
-- Name: system_tasks_and_abilities system_tasks_and_abilities_task_id_ability_id_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_tasks_and_abilities
    ADD CONSTRAINT system_tasks_and_abilities_task_id_ability_id_key UNIQUE (task_id, ability_id);


--
-- Name: system_tasks system_tasks_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_tasks
    ADD CONSTRAINT system_tasks_name_key UNIQUE (name);


--
-- Name: system_tasks system_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_tasks
    ADD CONSTRAINT system_tasks_pkey PRIMARY KEY (id);


--
-- Name: touch_sensors_and_troyka_shields touch_sensors_and_troyka_shields_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.touch_sensors_and_troyka_shields
    ADD CONSTRAINT touch_sensors_and_troyka_shields_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: touch_sensors_and_troyka_shields touch_sensors_and_troyka_shields_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.touch_sensors_and_troyka_shields
    ADD CONSTRAINT touch_sensors_and_troyka_shields_pkey PRIMARY KEY (id);


--
-- Name: touch_sensors touch_sensors_code_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.touch_sensors
    ADD CONSTRAINT touch_sensors_code_key UNIQUE (code);


--
-- Name: touch_sensors touch_sensors_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.touch_sensors
    ADD CONSTRAINT touch_sensors_pkey PRIMARY KEY (id);


--
-- Name: troyka_shields_and_microcontrollers_for_electronic_components troyka_shields_and_microcontrollers_for_e_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.troyka_shields_and_microcontrollers_for_electronic_components
    ADD CONSTRAINT troyka_shields_and_microcontrollers_for_e_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: troyka_shields_and_microcontrollers_for_electronic_components troyka_shields_and_microcontrollers_for_electronic_compone_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.troyka_shields_and_microcontrollers_for_electronic_components
    ADD CONSTRAINT troyka_shields_and_microcontrollers_for_electronic_compone_pkey PRIMARY KEY (id);


--
-- Name: troyka_shields troyka_shields_name_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.troyka_shields
    ADD CONSTRAINT troyka_shields_name_key UNIQUE (name);


--
-- Name: troyka_shields troyka_shields_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.troyka_shields
    ADD CONSTRAINT troyka_shields_pkey PRIMARY KEY (id);


--
-- Name: wireless_charge_receivers_and_batteries wireless_charge_receivers_and_batteries_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_receivers_and_batteries
    ADD CONSTRAINT wireless_charge_receivers_and_batteries_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: wireless_charge_receivers_and_batteries wireless_charge_receivers_and_batteries_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_receivers_and_batteries
    ADD CONSTRAINT wireless_charge_receivers_and_batteries_pkey PRIMARY KEY (id);


--
-- Name: wireless_charge_receivers_and_links_between_devices wireless_charge_receivers_and_links_betwe_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_receivers_and_links_between_devices
    ADD CONSTRAINT wireless_charge_receivers_and_links_betwe_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: wireless_charge_receivers_and_links_between_devices wireless_charge_receivers_and_links_between_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_receivers_and_links_between_devices
    ADD CONSTRAINT wireless_charge_receivers_and_links_between_devices_pkey PRIMARY KEY (id);


--
-- Name: wireless_charge_receivers wireless_charge_receivers_code_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_receivers
    ADD CONSTRAINT wireless_charge_receivers_code_key UNIQUE (code);


--
-- Name: wireless_charge_receivers wireless_charge_receivers_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_receivers
    ADD CONSTRAINT wireless_charge_receivers_pkey PRIMARY KEY (id);


--
-- Name: wireless_charge_transmitters_and_batteries wireless_charge_transmitters_and_batterie_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_transmitters_and_batteries
    ADD CONSTRAINT wireless_charge_transmitters_and_batterie_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: wireless_charge_transmitters_and_batteries wireless_charge_transmitters_and_batteries_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_transmitters_and_batteries
    ADD CONSTRAINT wireless_charge_transmitters_and_batteries_pkey PRIMARY KEY (id);


--
-- Name: wireless_charge_transmitters_and_links_between_devices wireless_charge_transmitters_and_links_be_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_transmitters_and_links_between_devices
    ADD CONSTRAINT wireless_charge_transmitters_and_links_be_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: wireless_charge_transmitters_and_links_between_devices wireless_charge_transmitters_and_links_between_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_transmitters_and_links_between_devices
    ADD CONSTRAINT wireless_charge_transmitters_and_links_between_devices_pkey PRIMARY KEY (id);


--
-- Name: wireless_charge_transmitters wireless_charge_transmitters_code_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_transmitters
    ADD CONSTRAINT wireless_charge_transmitters_code_key UNIQUE (code);


--
-- Name: wireless_charge_transmitters wireless_charge_transmitters_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_transmitters
    ADD CONSTRAINT wireless_charge_transmitters_pkey PRIMARY KEY (id);


--
-- Name: wireless_signal_receivers_and_links_between_devices wireless_signal_receivers_and_links_betwe_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_receivers_and_links_between_devices
    ADD CONSTRAINT wireless_signal_receivers_and_links_betwe_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: wireless_signal_receivers_and_links_between_devices wireless_signal_receivers_and_links_between_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_receivers_and_links_between_devices
    ADD CONSTRAINT wireless_signal_receivers_and_links_between_devices_pkey PRIMARY KEY (id);


--
-- Name: wireless_signal_receivers_and_troyka_shields wireless_signal_receivers_and_troyka_shie_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_receivers_and_troyka_shields
    ADD CONSTRAINT wireless_signal_receivers_and_troyka_shie_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: wireless_signal_receivers_and_troyka_shields wireless_signal_receivers_and_troyka_shields_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_receivers_and_troyka_shields
    ADD CONSTRAINT wireless_signal_receivers_and_troyka_shields_pkey PRIMARY KEY (id);


--
-- Name: wireless_signal_receivers wireless_signal_receivers_code_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_receivers
    ADD CONSTRAINT wireless_signal_receivers_code_key UNIQUE (code);


--
-- Name: wireless_signal_receivers wireless_signal_receivers_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_receivers
    ADD CONSTRAINT wireless_signal_receivers_pkey PRIMARY KEY (id);


--
-- Name: wireless_signal_transmitters_and_links_between_devices wireless_signal_transmitters_and_links_be_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_transmitters_and_links_between_devices
    ADD CONSTRAINT wireless_signal_transmitters_and_links_be_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: wireless_signal_transmitters_and_links_between_devices wireless_signal_transmitters_and_links_between_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_transmitters_and_links_between_devices
    ADD CONSTRAINT wireless_signal_transmitters_and_links_between_devices_pkey PRIMARY KEY (id);


--
-- Name: wireless_signal_transmitters_and_troyka_shields wireless_signal_transmitters_and_troyka_s_option_1_option_2_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_transmitters_and_troyka_shields
    ADD CONSTRAINT wireless_signal_transmitters_and_troyka_s_option_1_option_2_key UNIQUE (option_1, option_2);


--
-- Name: wireless_signal_transmitters_and_troyka_shields wireless_signal_transmitters_and_troyka_shields_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_transmitters_and_troyka_shields
    ADD CONSTRAINT wireless_signal_transmitters_and_troyka_shields_pkey PRIMARY KEY (id);


--
-- Name: wireless_signal_transmitters wireless_signal_transmitters_code_key; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_transmitters
    ADD CONSTRAINT wireless_signal_transmitters_code_key UNIQUE (code);


--
-- Name: wireless_signal_transmitters wireless_signal_transmitters_pkey; Type: CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_transmitters
    ADD CONSTRAINT wireless_signal_transmitters_pkey PRIMARY KEY (id);


--
-- Name: abstract_elements_and_base abstract_elements_and_base_base_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_base
    ADD CONSTRAINT abstract_elements_and_base_base_id_fkey FOREIGN KEY (base_id) REFERENCES public.device_base(id);


--
-- Name: abstract_elements_and_base abstract_elements_and_base_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_base
    ADD CONSTRAINT abstract_elements_and_base_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_elements_and_dependencies abstract_elements_and_dependencies_element_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_dependencies
    ADD CONSTRAINT abstract_elements_and_dependencies_element_1_fkey FOREIGN KEY (element_1) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_elements_and_dependencies abstract_elements_and_dependencies_element_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_dependencies
    ADD CONSTRAINT abstract_elements_and_dependencies_element_2_fkey FOREIGN KEY (element_2) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_elements_and_elements abstract_elements_and_elements_element_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_elements
    ADD CONSTRAINT abstract_elements_and_elements_element_1_fkey FOREIGN KEY (element_1) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_elements_and_elements abstract_elements_and_elements_element_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_elements
    ADD CONSTRAINT abstract_elements_and_elements_element_2_fkey FOREIGN KEY (element_2) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_elements_and_pins abstract_elements_and_pins_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_pins
    ADD CONSTRAINT abstract_elements_and_pins_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_elements_and_requirements abstract_elements_and_requirements_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_requirements
    ADD CONSTRAINT abstract_elements_and_requirements_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_elements_and_requirements abstract_elements_and_requirements_requirement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_requirements
    ADD CONSTRAINT abstract_elements_and_requirements_requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES public.device_requirements(id);


--
-- Name: abstract_elements_and_security abstract_elements_and_security_element_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_security
    ADD CONSTRAINT abstract_elements_and_security_element_1_fkey FOREIGN KEY (element_1) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_elements_and_security abstract_elements_and_security_element_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_security
    ADD CONSTRAINT abstract_elements_and_security_element_2_fkey FOREIGN KEY (element_2) REFERENCES public.security_elements(id);


--
-- Name: abstract_elements_and_subelements abstract_elements_and_subelements_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_subelements
    ADD CONSTRAINT abstract_elements_and_subelements_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_elements_and_subelements abstract_elements_and_subelements_requirement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_subelements
    ADD CONSTRAINT abstract_elements_and_subelements_requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES public.device_requirements(id);


--
-- Name: abstract_elements_and_subelements abstract_elements_and_subelements_subelement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_subelements
    ADD CONSTRAINT abstract_elements_and_subelements_subelement_id_fkey FOREIGN KEY (subelement_id) REFERENCES public.abstract_subelements(id);


--
-- Name: abstract_elements_and_types abstract_elements_and_types_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_types
    ADD CONSTRAINT abstract_elements_and_types_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_elements_and_types abstract_elements_and_types_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_and_types
    ADD CONSTRAINT abstract_elements_and_types_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.elements_types(id);


--
-- Name: abstract_elements_combination abstract_elements_combination_element_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_combination
    ADD CONSTRAINT abstract_elements_combination_element_1_fkey FOREIGN KEY (element_1) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_elements_combination abstract_elements_combination_element_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_elements_combination
    ADD CONSTRAINT abstract_elements_combination_element_2_fkey FOREIGN KEY (element_2) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_links_and_abilities abstract_links_and_abilities_ability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_links_and_abilities
    ADD CONSTRAINT abstract_links_and_abilities_ability_id_fkey FOREIGN KEY (ability_id) REFERENCES public.device_abilities(id);


--
-- Name: abstract_links_and_abilities abstract_links_and_abilities_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_links_and_abilities
    ADD CONSTRAINT abstract_links_and_abilities_link_id_fkey FOREIGN KEY (link_id) REFERENCES public.abstract_links(id);


--
-- Name: abstract_links_and_elements abstract_links_and_elements_element_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_links_and_elements
    ADD CONSTRAINT abstract_links_and_elements_element_1_fkey FOREIGN KEY (element_1) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_links_and_elements abstract_links_and_elements_element_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_links_and_elements
    ADD CONSTRAINT abstract_links_and_elements_element_2_fkey FOREIGN KEY (element_2) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_links_and_elements abstract_links_and_elements_link_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_links_and_elements
    ADD CONSTRAINT abstract_links_and_elements_link_id_fkey FOREIGN KEY (link_id) REFERENCES public.abstract_links(id);


--
-- Name: abstract_subelements_and_base abstract_subelements_and_base_base_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_base
    ADD CONSTRAINT abstract_subelements_and_base_base_id_fkey FOREIGN KEY (base_id) REFERENCES public.device_base(id);


--
-- Name: abstract_subelements_and_base abstract_subelements_and_base_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_base
    ADD CONSTRAINT abstract_subelements_and_base_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_subelements_and_base abstract_subelements_and_base_subelement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_base
    ADD CONSTRAINT abstract_subelements_and_base_subelement_id_fkey FOREIGN KEY (subelement_id) REFERENCES public.abstract_subelements(id);


--
-- Name: abstract_subelements_and_flash_memory abstract_subelements_and_flash_memory_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_flash_memory
    ADD CONSTRAINT abstract_subelements_and_flash_memory_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.abstract_subelements(id);


--
-- Name: abstract_subelements_and_security abstract_subelements_and_security_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_security
    ADD CONSTRAINT abstract_subelements_and_security_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.abstract_elements(id);


--
-- Name: abstract_subelements_and_security abstract_subelements_and_security_security_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_security
    ADD CONSTRAINT abstract_subelements_and_security_security_id_fkey FOREIGN KEY (security_id) REFERENCES public.security_elements(id);


--
-- Name: abstract_subelements_and_security abstract_subelements_and_security_subelement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.abstract_subelements_and_security
    ADD CONSTRAINT abstract_subelements_and_security_subelement_id_fkey FOREIGN KEY (subelement_id) REFERENCES public.abstract_subelements(id);


--
-- Name: attackers_and_actions attackers_and_actions_access_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attackers_and_actions
    ADD CONSTRAINT attackers_and_actions_access_id_fkey FOREIGN KEY (access_id) REFERENCES public.access_types(id);


--
-- Name: attackers_and_actions attackers_and_actions_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attackers_and_actions
    ADD CONSTRAINT attackers_and_actions_action_id_fkey FOREIGN KEY (action_id) REFERENCES public.attack_actions(id);


--
-- Name: attackers_and_actions attackers_and_actions_knowledge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attackers_and_actions
    ADD CONSTRAINT attackers_and_actions_knowledge_id_fkey FOREIGN KEY (knowledge_id) REFERENCES public.knowledge_types(id);


--
-- Name: attackers_and_actions attackers_and_actions_resources_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.attackers_and_actions
    ADD CONSTRAINT attackers_and_actions_resources_id_fkey FOREIGN KEY (resources_id) REFERENCES public.resources_types(id);


--
-- Name: base_and_communication base_and_communication_base_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.base_and_communication
    ADD CONSTRAINT base_and_communication_base_id_fkey FOREIGN KEY (base_id) REFERENCES public.device_base(id);


--
-- Name: base_and_communication base_and_communication_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.base_and_communication
    ADD CONSTRAINT base_and_communication_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.communication_levels(id);


--
-- Name: batteries_and_links_between_devices batteries_and_links_between_devices_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_links_between_devices
    ADD CONSTRAINT batteries_and_links_between_devices_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.batteries(id);


--
-- Name: batteries_and_links_between_devices batteries_and_links_between_devices_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_links_between_devices
    ADD CONSTRAINT batteries_and_links_between_devices_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.links_between_devices(id);


--
-- Name: batteries_and_microcontrollers_for_electronic_components batteries_and_microcontrollers_for_electronic_com_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_microcontrollers_for_electronic_components
    ADD CONSTRAINT batteries_and_microcontrollers_for_electronic_com_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.batteries(id);


--
-- Name: batteries_and_microcontrollers_for_electronic_components batteries_and_microcontrollers_for_electronic_com_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_microcontrollers_for_electronic_components
    ADD CONSTRAINT batteries_and_microcontrollers_for_electronic_com_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.microcontrollers_for_electronic_components(id);


--
-- Name: batteries_and_motor_shields batteries_and_motor_shields_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_motor_shields
    ADD CONSTRAINT batteries_and_motor_shields_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.batteries(id);


--
-- Name: batteries_and_motor_shields batteries_and_motor_shields_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_motor_shields
    ADD CONSTRAINT batteries_and_motor_shields_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.motor_shields(id);


--
-- Name: batteries_and_oneboard_computers batteries_and_oneboard_computers_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_oneboard_computers
    ADD CONSTRAINT batteries_and_oneboard_computers_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.batteries(id);


--
-- Name: batteries_and_oneboard_computers batteries_and_oneboard_computers_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.batteries_and_oneboard_computers
    ADD CONSTRAINT batteries_and_oneboard_computers_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.oneboard_computers(id);


--
-- Name: collector_motors_and_motor_shields collector_motors_and_motor_shields_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.collector_motors_and_motor_shields
    ADD CONSTRAINT collector_motors_and_motor_shields_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.collector_motors(id);


--
-- Name: collector_motors_and_motor_shields collector_motors_and_motor_shields_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.collector_motors_and_motor_shields
    ADD CONSTRAINT collector_motors_and_motor_shields_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.motor_shields(id);


--
-- Name: communication_and_actions communication_and_actions_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.communication_and_actions
    ADD CONSTRAINT communication_and_actions_action_id_fkey FOREIGN KEY (action_id) REFERENCES public.attack_actions(id);


--
-- Name: communication_and_actions communication_and_actions_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.communication_and_actions
    ADD CONSTRAINT communication_and_actions_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.communication_levels(id);


--
-- Name: device_abilities_and_requirements device_abilities_and_requirements_ability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_abilities_and_requirements
    ADD CONSTRAINT device_abilities_and_requirements_ability_id_fkey FOREIGN KEY (ability_id) REFERENCES public.device_abilities(id);


--
-- Name: device_abilities_and_requirements device_abilities_and_requirements_requirement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_abilities_and_requirements
    ADD CONSTRAINT device_abilities_and_requirements_requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES public.device_requirements(id);


--
-- Name: device_recommendations_and_security device_recommendations_and_security_recommendation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_recommendations_and_security
    ADD CONSTRAINT device_recommendations_and_security_recommendation_id_fkey FOREIGN KEY (recommendation_id) REFERENCES public.device_recommendations(id);


--
-- Name: device_recommendations_and_security device_recommendations_and_security_security_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_recommendations_and_security
    ADD CONSTRAINT device_recommendations_and_security_security_id_fkey FOREIGN KEY (security_id) REFERENCES public.security_elements(id);


--
-- Name: device_requirements_and_base device_requirements_and_base_base_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_requirements_and_base
    ADD CONSTRAINT device_requirements_and_base_base_id_fkey FOREIGN KEY (base_id) REFERENCES public.device_base(id);


--
-- Name: device_requirements_and_base device_requirements_and_base_requirement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_requirements_and_base
    ADD CONSTRAINT device_requirements_and_base_requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES public.device_requirements(id);


--
-- Name: device_tasks_and_abilities device_tasks_and_abilities_ability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_tasks_and_abilities
    ADD CONSTRAINT device_tasks_and_abilities_ability_id_fkey FOREIGN KEY (ability_id) REFERENCES public.device_abilities(id);


--
-- Name: device_tasks_and_abilities device_tasks_and_abilities_requirement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_tasks_and_abilities
    ADD CONSTRAINT device_tasks_and_abilities_requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES public.system_requirements(id);


--
-- Name: device_tasks_and_abilities device_tasks_and_abilities_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.device_tasks_and_abilities
    ADD CONSTRAINT device_tasks_and_abilities_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.device_tasks(id);


--
-- Name: devices_are_linked devices_are_linked_ability_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.devices_are_linked
    ADD CONSTRAINT devices_are_linked_ability_1_fkey FOREIGN KEY (ability_1) REFERENCES public.device_abilities(id);


--
-- Name: devices_are_linked devices_are_linked_ability_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.devices_are_linked
    ADD CONSTRAINT devices_are_linked_ability_2_fkey FOREIGN KEY (ability_2) REFERENCES public.device_abilities(id);


--
-- Name: distance_sensors_and_troyka_shields distance_sensors_and_troyka_shields_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.distance_sensors_and_troyka_shields
    ADD CONSTRAINT distance_sensors_and_troyka_shields_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.distance_sensors(id);


--
-- Name: distance_sensors_and_troyka_shields distance_sensors_and_troyka_shields_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.distance_sensors_and_troyka_shields
    ADD CONSTRAINT distance_sensors_and_troyka_shields_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.troyka_shields(id);


--
-- Name: elements_and_actions elements_and_actions_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.elements_and_actions
    ADD CONSTRAINT elements_and_actions_action_id_fkey FOREIGN KEY (action_id) REFERENCES public.attack_actions(id);


--
-- Name: elements_and_actions elements_and_actions_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.elements_and_actions
    ADD CONSTRAINT elements_and_actions_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.elements_types(id);


--
-- Name: encoders_and_troyka_shields encoders_and_troyka_shields_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.encoders_and_troyka_shields
    ADD CONSTRAINT encoders_and_troyka_shields_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.encoders(id);


--
-- Name: encoders_and_troyka_shields encoders_and_troyka_shields_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.encoders_and_troyka_shields
    ADD CONSTRAINT encoders_and_troyka_shields_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.troyka_shields(id);


--
-- Name: levels_and_actions levels_and_actions_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.levels_and_actions
    ADD CONSTRAINT levels_and_actions_action_id_fkey FOREIGN KEY (action_id) REFERENCES public.attack_actions(id);


--
-- Name: levels_and_actions levels_and_actions_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.levels_and_actions
    ADD CONSTRAINT levels_and_actions_level_id_fkey FOREIGN KEY (level_id) REFERENCES public.attack_levels(id);


--
-- Name: links_and_dependencies links_and_dependencies_ability_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.links_and_dependencies
    ADD CONSTRAINT links_and_dependencies_ability_1_fkey FOREIGN KEY (ability_1) REFERENCES public.device_abilities(id);


--
-- Name: links_and_dependencies links_and_dependencies_ability_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.links_and_dependencies
    ADD CONSTRAINT links_and_dependencies_ability_2_fkey FOREIGN KEY (ability_2) REFERENCES public.device_abilities(id);


--
-- Name: links_and_dependencies links_and_dependencies_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.links_and_dependencies
    ADD CONSTRAINT links_and_dependencies_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.abstract_elements(id);


--
-- Name: mcs_for_ws_communication_and_compatibility mcs_for_ws_communication_and_compatibility_option_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_compatibility
    ADD CONSTRAINT mcs_for_ws_communication_and_compatibility_option_id_fkey FOREIGN KEY (option_id) REFERENCES public.mcs_for_ws_communication(id);


--
-- Name: mcs_for_ws_communication_and_compatibility mcs_for_ws_communication_and_compatibility_requirement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_compatibility
    ADD CONSTRAINT mcs_for_ws_communication_and_compatibility_requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES public.abstract_subelements(id);


--
-- Name: mcs_for_ws_communication_and_links_between_devices mcs_for_ws_communication_and_links_between_device_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_links_between_devices
    ADD CONSTRAINT mcs_for_ws_communication_and_links_between_device_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.mcs_for_ws_communication(id);


--
-- Name: mcs_for_ws_communication_and_links_between_devices mcs_for_ws_communication_and_links_between_device_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_links_between_devices
    ADD CONSTRAINT mcs_for_ws_communication_and_links_between_device_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.links_between_devices(id);


--
-- Name: mcs_for_ws_communication_and_troyka_shields mcs_for_ws_communication_and_troyka_shields_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_troyka_shields
    ADD CONSTRAINT mcs_for_ws_communication_and_troyka_shields_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.mcs_for_ws_communication(id);


--
-- Name: mcs_for_ws_communication_and_troyka_shields mcs_for_ws_communication_and_troyka_shields_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.mcs_for_ws_communication_and_troyka_shields
    ADD CONSTRAINT mcs_for_ws_communication_and_troyka_shields_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.troyka_shields(id);


--
-- Name: micro_sds_and_oneboard_computers micro_sds_and_oneboard_computers_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.micro_sds_and_oneboard_computers
    ADD CONSTRAINT micro_sds_and_oneboard_computers_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.micro_sds(id);


--
-- Name: micro_sds_and_oneboard_computers micro_sds_and_oneboard_computers_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.micro_sds_and_oneboard_computers
    ADD CONSTRAINT micro_sds_and_oneboard_computers_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.oneboard_computers(id);


--
-- Name: microcontrollers_for_electronic_components_and_compatibility microcontrollers_for_electronic_components__requirement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.microcontrollers_for_electronic_components_and_compatibility
    ADD CONSTRAINT microcontrollers_for_electronic_components__requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES public.abstract_subelements(id);


--
-- Name: microcontrollers_for_electronic_components_and_compatibility microcontrollers_for_electronic_components_and_c_option_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.microcontrollers_for_electronic_components_and_compatibility
    ADD CONSTRAINT microcontrollers_for_electronic_components_and_c_option_id_fkey FOREIGN KEY (option_id) REFERENCES public.microcontrollers_for_electronic_components(id);


--
-- Name: motion_sensors_and_troyka_shields motion_sensors_and_troyka_shields_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motion_sensors_and_troyka_shields
    ADD CONSTRAINT motion_sensors_and_troyka_shields_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.motion_sensors(id);


--
-- Name: motion_sensors_and_troyka_shields motion_sensors_and_troyka_shields_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motion_sensors_and_troyka_shields
    ADD CONSTRAINT motion_sensors_and_troyka_shields_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.troyka_shields(id);


--
-- Name: motor_shields_and_microcontrollers_for_electronic_components motor_shields_and_microcontrollers_for_electronic_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motor_shields_and_microcontrollers_for_electronic_components
    ADD CONSTRAINT motor_shields_and_microcontrollers_for_electronic_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.motor_shields(id);


--
-- Name: motor_shields_and_microcontrollers_for_electronic_components motor_shields_and_microcontrollers_for_electronic_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.motor_shields_and_microcontrollers_for_electronic_components
    ADD CONSTRAINT motor_shields_and_microcontrollers_for_electronic_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.microcontrollers_for_electronic_components(id);


--
-- Name: noise_sensors_and_troyka_shields noise_sensors_and_troyka_shields_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.noise_sensors_and_troyka_shields
    ADD CONSTRAINT noise_sensors_and_troyka_shields_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.noise_sensors(id);


--
-- Name: noise_sensors_and_troyka_shields noise_sensors_and_troyka_shields_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.noise_sensors_and_troyka_shields
    ADD CONSTRAINT noise_sensors_and_troyka_shields_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.troyka_shields(id);


--
-- Name: oneboard_computers_and_compatibility oneboard_computers_and_compatibility_option_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.oneboard_computers_and_compatibility
    ADD CONSTRAINT oneboard_computers_and_compatibility_option_id_fkey FOREIGN KEY (option_id) REFERENCES public.oneboard_computers(id);


--
-- Name: oneboard_computers_and_compatibility oneboard_computers_and_compatibility_requirement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.oneboard_computers_and_compatibility
    ADD CONSTRAINT oneboard_computers_and_compatibility_requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES public.abstract_subelements(id);


--
-- Name: oneboard_computers_and_links_between_devices oneboard_computers_and_links_between_devices_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.oneboard_computers_and_links_between_devices
    ADD CONSTRAINT oneboard_computers_and_links_between_devices_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.oneboard_computers(id);


--
-- Name: oneboard_computers_and_links_between_devices oneboard_computers_and_links_between_devices_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.oneboard_computers_and_links_between_devices
    ADD CONSTRAINT oneboard_computers_and_links_between_devices_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.links_between_devices(id);


--
-- Name: operating_systems_32bit_and_compatibility operating_systems_32bit_and_compatibility_option_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.operating_systems_32bit_and_compatibility
    ADD CONSTRAINT operating_systems_32bit_and_compatibility_option_id_fkey FOREIGN KEY (option_id) REFERENCES public.operating_systems_32bit(id);


--
-- Name: operating_systems_32bit_and_compatibility operating_systems_32bit_and_compatibility_requirement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.operating_systems_32bit_and_compatibility
    ADD CONSTRAINT operating_systems_32bit_and_compatibility_requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES public.abstract_subelements(id);


--
-- Name: operating_systems_32bit_and_oneboard_computers operating_systems_32bit_and_oneboard_computers_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.operating_systems_32bit_and_oneboard_computers
    ADD CONSTRAINT operating_systems_32bit_and_oneboard_computers_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.operating_systems_32bit(id);


--
-- Name: operating_systems_32bit_and_oneboard_computers operating_systems_32bit_and_oneboard_computers_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.operating_systems_32bit_and_oneboard_computers
    ADD CONSTRAINT operating_systems_32bit_and_oneboard_computers_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.oneboard_computers(id);


--
-- Name: security_and_actions security_and_actions_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.security_and_actions
    ADD CONSTRAINT security_and_actions_action_id_fkey FOREIGN KEY (action_id) REFERENCES public.attack_actions(id);


--
-- Name: security_and_actions security_and_actions_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.security_and_actions
    ADD CONSTRAINT security_and_actions_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.security_elements(id);


--
-- Name: security_and_levels security_and_levels_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.security_and_levels
    ADD CONSTRAINT security_and_levels_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.security_elements(id);


--
-- Name: security_and_levels security_and_levels_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.security_and_levels
    ADD CONSTRAINT security_and_levels_level_id_fkey FOREIGN KEY (level_id) REFERENCES public.attack_levels(id);


--
-- Name: selectable_elements_and_db_tables selectable_elements_and_db_tables_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.selectable_elements_and_db_tables
    ADD CONSTRAINT selectable_elements_and_db_tables_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.abstract_elements(id);


--
-- Name: selectable_elements selectable_elements_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.selectable_elements
    ADD CONSTRAINT selectable_elements_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.abstract_elements(id);


--
-- Name: servo_drives_and_troyka_shields servo_drives_and_troyka_shields_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.servo_drives_and_troyka_shields
    ADD CONSTRAINT servo_drives_and_troyka_shields_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.servo_drives(id);


--
-- Name: servo_drives_and_troyka_shields servo_drives_and_troyka_shields_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.servo_drives_and_troyka_shields
    ADD CONSTRAINT servo_drives_and_troyka_shields_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.troyka_shields(id);


--
-- Name: sql_databases_and_compatibility sql_databases_and_compatibility_option_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.sql_databases_and_compatibility
    ADD CONSTRAINT sql_databases_and_compatibility_option_id_fkey FOREIGN KEY (option_id) REFERENCES public.sql_databases(id);


--
-- Name: sql_databases_and_compatibility sql_databases_and_compatibility_requirement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.sql_databases_and_compatibility
    ADD CONSTRAINT sql_databases_and_compatibility_requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES public.abstract_subelements(id);


--
-- Name: sql_databases_and_operating_systems_32bit sql_databases_and_operating_systems_32bit_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.sql_databases_and_operating_systems_32bit
    ADD CONSTRAINT sql_databases_and_operating_systems_32bit_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.sql_databases(id);


--
-- Name: sql_databases_and_operating_systems_32bit sql_databases_and_operating_systems_32bit_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.sql_databases_and_operating_systems_32bit
    ADD CONSTRAINT sql_databases_and_operating_systems_32bit_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.operating_systems_32bit(id);


--
-- Name: system_abilities_and_requirements system_abilities_and_requirements_ability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_abilities_and_requirements
    ADD CONSTRAINT system_abilities_and_requirements_ability_id_fkey FOREIGN KEY (ability_id) REFERENCES public.system_abilities(id);


--
-- Name: system_abilities_and_requirements system_abilities_and_requirements_requirement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_abilities_and_requirements
    ADD CONSTRAINT system_abilities_and_requirements_requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES public.system_requirements(id);


--
-- Name: system_recommendations_and_security system_recommendations_and_security_recommendation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_recommendations_and_security
    ADD CONSTRAINT system_recommendations_and_security_recommendation_id_fkey FOREIGN KEY (recommendation_id) REFERENCES public.system_recommendations(id);


--
-- Name: system_recommendations_and_security system_recommendations_and_security_security_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_recommendations_and_security
    ADD CONSTRAINT system_recommendations_and_security_security_id_fkey FOREIGN KEY (security_id) REFERENCES public.security_elements(id);


--
-- Name: system_requirements_and_tasks system_requirements_and_tasks_requirement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_requirements_and_tasks
    ADD CONSTRAINT system_requirements_and_tasks_requirement_id_fkey FOREIGN KEY (requirement_id) REFERENCES public.system_requirements(id);


--
-- Name: system_requirements_and_tasks system_requirements_and_tasks_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_requirements_and_tasks
    ADD CONSTRAINT system_requirements_and_tasks_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.device_tasks(id);


--
-- Name: system_tasks_and_abilities system_tasks_and_abilities_ability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_tasks_and_abilities
    ADD CONSTRAINT system_tasks_and_abilities_ability_id_fkey FOREIGN KEY (ability_id) REFERENCES public.system_abilities(id);


--
-- Name: system_tasks_and_abilities system_tasks_and_abilities_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.system_tasks_and_abilities
    ADD CONSTRAINT system_tasks_and_abilities_task_id_fkey FOREIGN KEY (task_id) REFERENCES public.system_tasks(id);


--
-- Name: touch_sensors_and_troyka_shields touch_sensors_and_troyka_shields_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.touch_sensors_and_troyka_shields
    ADD CONSTRAINT touch_sensors_and_troyka_shields_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.touch_sensors(id);


--
-- Name: touch_sensors_and_troyka_shields touch_sensors_and_troyka_shields_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.touch_sensors_and_troyka_shields
    ADD CONSTRAINT touch_sensors_and_troyka_shields_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.troyka_shields(id);


--
-- Name: troyka_shields_and_microcontrollers_for_electronic_components troyka_shields_and_microcontrollers_for_electroni_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.troyka_shields_and_microcontrollers_for_electronic_components
    ADD CONSTRAINT troyka_shields_and_microcontrollers_for_electroni_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.troyka_shields(id);


--
-- Name: troyka_shields_and_microcontrollers_for_electronic_components troyka_shields_and_microcontrollers_for_electroni_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.troyka_shields_and_microcontrollers_for_electronic_components
    ADD CONSTRAINT troyka_shields_and_microcontrollers_for_electroni_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.microcontrollers_for_electronic_components(id);


--
-- Name: wireless_charge_receivers_and_batteries wireless_charge_receivers_and_batteries_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_receivers_and_batteries
    ADD CONSTRAINT wireless_charge_receivers_and_batteries_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.wireless_charge_receivers(id);


--
-- Name: wireless_charge_receivers_and_batteries wireless_charge_receivers_and_batteries_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_receivers_and_batteries
    ADD CONSTRAINT wireless_charge_receivers_and_batteries_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.batteries(id);


--
-- Name: wireless_charge_receivers_and_links_between_devices wireless_charge_receivers_and_links_between_devic_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_receivers_and_links_between_devices
    ADD CONSTRAINT wireless_charge_receivers_and_links_between_devic_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.wireless_charge_receivers(id);


--
-- Name: wireless_charge_receivers_and_links_between_devices wireless_charge_receivers_and_links_between_devic_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_receivers_and_links_between_devices
    ADD CONSTRAINT wireless_charge_receivers_and_links_between_devic_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.links_between_devices(id);


--
-- Name: wireless_charge_transmitters_and_batteries wireless_charge_transmitters_and_batteries_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_transmitters_and_batteries
    ADD CONSTRAINT wireless_charge_transmitters_and_batteries_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.wireless_charge_transmitters(id);


--
-- Name: wireless_charge_transmitters_and_batteries wireless_charge_transmitters_and_batteries_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_transmitters_and_batteries
    ADD CONSTRAINT wireless_charge_transmitters_and_batteries_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.batteries(id);


--
-- Name: wireless_charge_transmitters_and_links_between_devices wireless_charge_transmitters_and_links_between_de_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_transmitters_and_links_between_devices
    ADD CONSTRAINT wireless_charge_transmitters_and_links_between_de_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.wireless_charge_transmitters(id);


--
-- Name: wireless_charge_transmitters_and_links_between_devices wireless_charge_transmitters_and_links_between_de_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_charge_transmitters_and_links_between_devices
    ADD CONSTRAINT wireless_charge_transmitters_and_links_between_de_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.links_between_devices(id);


--
-- Name: wireless_signal_receivers_and_links_between_devices wireless_signal_receivers_and_links_between_devic_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_receivers_and_links_between_devices
    ADD CONSTRAINT wireless_signal_receivers_and_links_between_devic_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.wireless_signal_receivers(id);


--
-- Name: wireless_signal_receivers_and_links_between_devices wireless_signal_receivers_and_links_between_devic_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_receivers_and_links_between_devices
    ADD CONSTRAINT wireless_signal_receivers_and_links_between_devic_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.links_between_devices(id);


--
-- Name: wireless_signal_receivers_and_troyka_shields wireless_signal_receivers_and_troyka_shields_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_receivers_and_troyka_shields
    ADD CONSTRAINT wireless_signal_receivers_and_troyka_shields_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.wireless_signal_receivers(id);


--
-- Name: wireless_signal_receivers_and_troyka_shields wireless_signal_receivers_and_troyka_shields_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_receivers_and_troyka_shields
    ADD CONSTRAINT wireless_signal_receivers_and_troyka_shields_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.troyka_shields(id);


--
-- Name: wireless_signal_transmitters_and_links_between_devices wireless_signal_transmitters_and_links_between_de_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_transmitters_and_links_between_devices
    ADD CONSTRAINT wireless_signal_transmitters_and_links_between_de_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.wireless_signal_transmitters(id);


--
-- Name: wireless_signal_transmitters_and_links_between_devices wireless_signal_transmitters_and_links_between_de_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_transmitters_and_links_between_devices
    ADD CONSTRAINT wireless_signal_transmitters_and_links_between_de_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.links_between_devices(id);


--
-- Name: wireless_signal_transmitters_and_troyka_shields wireless_signal_transmitters_and_troyka_shields_option_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_transmitters_and_troyka_shields
    ADD CONSTRAINT wireless_signal_transmitters_and_troyka_shields_option_1_fkey FOREIGN KEY (option_1) REFERENCES public.wireless_signal_transmitters(id);


--
-- Name: wireless_signal_transmitters_and_troyka_shields wireless_signal_transmitters_and_troyka_shields_option_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: design_admin
--

ALTER TABLE ONLY public.wireless_signal_transmitters_and_troyka_shields
    ADD CONSTRAINT wireless_signal_transmitters_and_troyka_shields_option_2_fkey FOREIGN KEY (option_2) REFERENCES public.troyka_shields(id);


--
-- PostgreSQL database dump complete
--

