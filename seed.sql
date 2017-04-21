--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages     = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categories (
    id integer NOT NULL,
    parent_id integer,
    category text,
    description text,
    url text,
    slug text
);


ALTER TABLE categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE events (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name text,
    description text,
    start_datetime timestamp with time zone,
    duration integer,
    approved boolean,
    instance_number integer,
    parent_id integer,
    group_id integer NOT NULL,
    venue_id integer NOT NULL,
    flyer_category text,
    flyer_fa_icon text,
    summary text,
    created_by integer DEFAULT 333,
    updated_by integer DEFAULT 288
);


ALTER TABLE events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: group_admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE group_admins (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    group_id integer NOT NULL,
    people_id integer NOT NULL
);


ALTER TABLE group_admins OWNER TO postgres;

--
-- Name: group_admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE group_admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE group_admins_id_seq OWNER TO postgres;

--
-- Name: group_admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE group_admins_id_seq OWNED BY group_admins.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE groups (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name text,
    image_url text,
    description text,
    categories json,
    categories_string text,
    approved boolean,
    parent_id integer,
    flyer_category text,
    flyer_fa_icon text
);


ALTER TABLE groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: pageviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pageviews (
    id integer NOT NULL,
    visitor integer,
    page text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE pageviews OWNER TO postgres;

--
-- Name: pageviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pageviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pageviews_id_seq OWNER TO postgres;

--
-- Name: pageviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pageviews_id_seq OWNED BY pageviews.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE people (
    id integer NOT NULL,
    email text,
    first_name text,
    last_name text,
    company text,
    twitter text,
    linkedin text,
    url text,
    other_info text,
    categories json,
    categories_string text,
    crypted_password text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    image_url text,
    custom_url text,
    admin boolean,
    bio text,
    approved boolean,
    approved_on timestamp without time zone,
    spam boolean,
    opt_in_time timestamp without time zone,
    opt_in boolean DEFAULT false
);


ALTER TABLE people OWNER TO postgres;

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE people_id_seq OWNER TO postgres;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE people_id_seq OWNED BY people.id;


--
-- Name: peopleclicks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE peopleclicks (
    id integer NOT NULL,
    visitor integer,
    profile integer,
    "column" text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    url text
);


ALTER TABLE peopleclicks OWNER TO postgres;

--
-- Name: peopleclicks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE peopleclicks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE peopleclicks_id_seq OWNER TO postgres;

--
-- Name: peopleclicks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE peopleclicks_id_seq OWNED BY peopleclicks.id;


--
-- Name: schema_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schema_info (
    version integer DEFAULT 0 NOT NULL
);


ALTER TABLE schema_info OWNER TO postgres;

--
-- Name: venues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE venues (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name text,
    description text
);


ALTER TABLE venues OWNER TO postgres;

--
-- Name: venues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE venues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE venues_id_seq OWNER TO postgres;

--
-- Name: venues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE venues_id_seq OWNED BY venues.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_admins ALTER COLUMN id SET DEFAULT nextval('group_admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pageviews ALTER COLUMN id SET DEFAULT nextval('pageviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY people ALTER COLUMN id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peopleclicks ALTER COLUMN id SET DEFAULT nextval('peopleclicks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venues ALTER COLUMN id SET DEFAULT nextval('venues_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories (id, parent_id, category, description, url, slug) FROM stdin;
1	\N	Accounting	\N	/categories/accounting	accounting
2	\N	Architecture	\N	/categories/architecture	architecture
3	\N	Art and Design	\N	/categories/art-and-design	art-and-design
4	\N	Business	\N	/categories/business	business
5	\N	Contract Management	\N	/categories/contract-management	contract-management
6	\N	Defense	\N	/categories/defense	defense
7	\N	Engineering	\N	/categories/engineering	engineering
8	\N	Finance	\N	/categories/finance	finance
9	\N	Human Resources	\N	/categories/human-resources	human-resources
10	\N	IT and Software	\N	/categories/it-and-software	it-and-software
11	\N	Legal	\N	/categories/legal	legal
12	\N	Marketing	\N	/categories/marketing	marketing
13	\N	Music	\N	/categories/music	music
14	\N	Photography and Video	\N	/categories/photography-and-video	photography-and-video
15	\N	Real Estate	\N	/categories/real-estate	real-estate
16	\N	Writing	\N	/categories/writing	writing
17	1	Auditing	\N	/categories/accounting/auditing	auditing
18	3	Graphic Design	\N	/categories/art-and-design/graphic-design	graphic-design
19	4	Business Management	\N	/categories/business/business-management	business-management
20	7	Aerospace Engineering	\N	/categories/engineering/aerospace-engineering	aerospace-engineering
21	8	Mergers and Acquisitions	\N	/categories/finance/mergers-and-acquisitions	mergers-and-acquisitions
22	9	HR Benefits	\N	/categories/human-resources/hr-benefits	hr-benefits
23	10	Web Development	\N	/categories/it-and-software/web-development	web-development
24	11	Intellectual Property	\N	/categories/legal/intellectual-property	intellectual-property
25	12	Direct Marketing	\N	/categories/marketing/direct-marketing	direct-marketing
26	13	Music Education	\N	/categories/music/music-education	music-education
27	14	Photography	\N	/categories/photography-and-video/photography	photography
28	15	Commercial Real Estate	\N	/categories/real-estate/commercial-real-estate	commercial-real-estate
29	16	Documentation	\N	/categories/writing/documentation	documentation
30	1	Tax Accounting	\N	/categories/accounting/tax-accounting	tax-accounting
31	3	Animation	\N	/categories/art-and-design/animation	animation
32	4	Business Strategy	\N	/categories/business/business-strategy	business-strategy
33	7	Civil Engineering	\N	/categories/engineering/civil-engineering	civil-engineering
34	8	Private Equity	\N	/categories/finance/private-equity	private-equity
35	9	HR Training and Development	\N	/categories/human-resources/hr-training-and-development	hr-training-and-development
36	10	Network Administration	\N	/categories/it-and-software/network-administration	network-administration
37	11	Tax Law	\N	/categories/legal/tax-law	tax-law
38	12	TV Marketing	\N	/categories/marketing/tv-marketing	tv-marketing
39	13	Composing	\N	/categories/music/composing	composing
40	14	Motion Graphics	\N	/categories/photography-and-video/motion-graphics	motion-graphics
41	15	Residential Real Estate	\N	/categories/real-estate/residential-real-estate	residential-real-estate
42	16	Copywriting	\N	/categories/writing/copywriting	copywriting
43	3	Illustration	\N	/categories/art-and-design/illustration	illustration
44	7	Chemical Engineering	\N	/categories/engineering/chemical-engineering	chemical-engineering
45	8	Investing	\N	/categories/finance/investing	investing
46	9	Job Recruiting	\N	/categories/human-resources/job-recruiting	job-recruiting
47	10	Telecommunications	\N	/categories/it-and-software/telecommunications	telecommunications
48	11	Corporate Law	\N	/categories/legal/corporate-law	corporate-law
49	12	Branding	\N	/categories/marketing/branding	branding
50	13	Audio Engineering	\N	/categories/music/audio-engineering	audio-engineering
51	14	Video Production	\N	/categories/photography-and-video/video-production	video-production
52	7	Electrical Engineering	\N	/categories/engineering/electrical-engineering	electrical-engineering
53	8	Wealth Management	\N	/categories/finance/wealth-management	wealth-management
54	10	Information Security	\N	/categories/it-and-software/information-security	information-security
55	11	Bankruptcy Law	\N	/categories/legal/bankruptcy-law	bankruptcy-law
56	12	Content Marketing	\N	/categories/marketing/content-marketing	content-marketing
57	13	DJ	\N	/categories/music/dj	dj
58	14	Video Editing	\N	/categories/photography-and-video/video-editing	video-editing
59	7	Mechanical Engineering	\N	/categories/engineering/mechanical-engineering	mechanical-engineering
60	10	Web Design	\N	/categories/it-and-software/web-design	web-design
61	11	Civil Rights Law	\N	/categories/legal/civil-rights-law	civil-rights-law
62	12	Digital Marketing	\N	/categories/marketing/digital-marketing	digital-marketing
63	13	Singing	\N	/categories/music/singing	singing
64	14	Camera Operator	\N	/categories/photography-and-video/camera-operator	camera-operator
65	7	Systems Engineering	\N	/categories/engineering/systems-engineering	systems-engineering
66	11	Immigration Law	\N	/categories/legal/immigration-law	immigration-law
67	12	Online Advertising	\N	/categories/marketing/online-advertising	online-advertising
68	13	Voice Acting	\N	/categories/music/voice-acting	voice-acting
69	11	Labor Law	\N	/categories/legal/labor-law	labor-law
70	12	Social Media Marketing	\N	/categories/marketing/social-media-marketing	social-media-marketing
71	13	Music Production	\N	/categories/music/music-production	music-production
72	11	Real Estate Law	\N	/categories/legal/real-estate-law	real-estate-law
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_id_seq', 72, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY events (id, created_at, updated_at, name, description, start_datetime, duration, approved, instance_number, parent_id, group_id, venue_id, flyer_category, flyer_fa_icon, summary, created_by, updated_by) FROM stdin;
1	2017-03-29 23:43:36.134914	2017-03-29 23:44:05.157359	new event	new event	2017-04-05 21:00:00-05	2	t	1	1	2	2			new event	1	1
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('events_id_seq', 1, true);


--
-- Data for Name: group_admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY group_admins (id, created_at, updated_at, group_id, people_id) FROM stdin;
1	\N	\N	1	1
2	\N	\N	2	1
3	\N	\N	3	1
4	\N	\N	4	1
5	\N	\N	5	1
6	\N	\N	6	1
7	\N	\N	7	1
8	\N	\N	8	1
9	\N	\N	9	1
10	\N	\N	10	1
11	\N	\N	11	1
12	\N	\N	12	1
13	\N	\N	13	1
14	\N	\N	14	1
15	\N	\N	15	1
16	\N	\N	16	1
17	\N	\N	17	1
18	\N	\N	18	1
19	\N	\N	19	1
20	\N	\N	20	1
21	\N	\N	21	1
22	\N	\N	22	1
23	\N	\N	23	1
24	\N	\N	24	1
25	\N	\N	25	1
26	\N	\N	26	1
27	\N	\N	27	1
28	\N	\N	28	1
29	\N	\N	29	1
30	\N	\N	1	2
31	\N	\N	2	2
32	\N	\N	3	2
33	\N	\N	4	2
34	\N	\N	5	2
35	\N	\N	6	2
36	\N	\N	7	2
37	\N	\N	8	2
38	\N	\N	9	2
39	\N	\N	10	2
40	\N	\N	11	2
41	\N	\N	12	2
42	\N	\N	13	2
43	\N	\N	14	2
44	\N	\N	15	2
45	\N	\N	16	2
46	\N	\N	17	2
47	\N	\N	18	2
48	\N	\N	19	2
49	\N	\N	20	2
50	\N	\N	21	2
51	\N	\N	22	2
52	\N	\N	23	2
53	\N	\N	24	2
54	\N	\N	25	2
55	\N	\N	26	2
56	\N	\N	27	2
57	\N	\N	28	2
58	\N	\N	29	2
\.


--
-- Name: group_admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('group_admins_id_seq', 232, true);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups (id, created_at, updated_at, name, image_url, description, categories, categories_string, approved, parent_id, flyer_category, flyer_fa_icon) FROM stdin;
1	2017-03-29 23:40:17.54396	2017-03-29 23:40:17.54396	New Leaf Digital	\N	The parent 501c(3) organization for CoWorking Night, 32/10, and Huntsville Founders.	\N	\N	t	\N	\N	\N
2	2017-03-29 23:40:17.546298	2017-03-29 23:40:17.546298	CoWorking Night	\N	\N	\N	\N	t	1	\N	\N
3	2017-03-29 23:40:17.548367	2017-03-29 23:40:17.548367	32/10	\N	\N	\N	\N	t	1	\N	\N
4	2017-03-29 23:40:17.550417	2017-03-29 23:40:17.550417	4 Hours To Product	\N	\N	\N	\N	t	2	\N	\N
5	2017-03-29 23:40:17.552525	2017-03-29 23:40:17.552525	Adulting 101	\N	\N	\N	\N	t	2	\N	\N
6	2017-03-29 23:40:17.554474	2017-03-29 23:40:17.554474	After Hours Game Dev	\N	\N	\N	\N	t	2	\N	\N
7	2017-03-29 23:40:17.556424	2017-03-29 23:40:17.556424	AngularJS	\N	\N	\N	\N	t	2	\N	\N
8	2017-03-29 23:40:17.559032	2017-03-29 23:40:17.559032	Babes Who Blog	\N	\N	\N	\N	t	2	\N	\N
9	2017-03-29 23:40:17.563198	2017-03-29 23:40:17.563198	Code the South	\N	\N	\N	\N	t	2	\N	\N
10	2017-03-29 23:40:17.565492	2017-03-29 23:40:17.565492	Coders GSD	\N	\N	\N	\N	t	2	\N	\N
11	2017-03-29 23:40:17.567665	2017-03-29 23:40:17.567665	Designer's Corner	\N	\N	\N	\N	t	2	\N	\N
12	2017-03-29 23:40:17.57103	2017-03-29 23:40:17.57103	Hackster.io Hardware Hacking	\N	\N	\N	\N	t	2	\N	\N
13	2017-03-29 23:40:17.575982	2017-03-29 23:40:17.575982	Keyframe: Motion Graphics & Animation	\N	\N	\N	\N	t	2	\N	\N
14	2017-03-29 23:40:17.578031	2017-03-29 23:40:17.578031	Leadership Lounge	\N	\N	\N	\N	t	2	\N	\N
15	2017-03-29 23:40:17.579892	2017-03-29 23:40:17.579892	Lean In Circle for Women	\N	\N	\N	\N	t	2	\N	\N
16	2017-03-29 23:40:17.581605	2017-03-29 23:40:17.581605	Mathletes of Huntsville	\N	\N	\N	\N	t	2	\N	\N
17	2017-03-29 23:40:17.583625	2017-03-29 23:40:17.583625	Mindfulness at Work	\N	\N	\N	\N	t	2	\N	\N
18	2017-03-29 23:40:17.585461	2017-03-29 23:40:17.585461	On Target Marketing	\N	\N	\N	\N	t	2	\N	\N
19	2017-03-29 23:40:17.587192	2017-03-29 23:40:17.587192	OverEngineered	\N	\N	\N	\N	t	2	\N	\N
20	2017-03-29 23:40:17.58913	2017-03-29 23:40:17.58913	Photo-Synthesis	\N	\N	\N	\N	t	2	\N	\N
21	2017-03-29 23:40:17.59127	2017-03-29 23:40:17.59127	ReactHSV	\N	\N	\N	\N	t	2	\N	\N
22	2017-03-29 23:40:17.593071	2017-03-29 23:40:17.593071	Responsive Web Design	\N	\N	\N	\N	t	2	\N	\N
23	2017-03-29 23:40:17.594993	2017-03-29 23:40:17.594993	Sales Funnel	\N	\N	\N	\N	t	2	\N	\N
24	2017-03-29 23:40:17.597001	2017-03-29 23:40:17.597001	Social Tribe	\N	\N	\N	\N	t	2	\N	\N
25	2017-03-29 23:40:17.598961	2017-03-29 23:40:17.598961	Startup Book Club	\N	\N	\N	\N	t	2	\N	\N
26	2017-03-29 23:40:17.601274	2017-03-29 23:40:17.601274	Untitled Film Group	\N	\N	\N	\N	t	2	\N	\N
27	2017-03-29 23:40:17.603668	2017-03-29 23:40:17.603668	UXPA Tennessee Valley	\N	\N	\N	\N	t	2	\N	\N
28	2017-03-29 23:40:17.6058	2017-03-29 23:40:17.6058	Women Who Code	\N	\N	\N	\N	t	2	\N	\N
29	2017-03-29 23:40:17.607792	2017-03-29 23:40:17.607792	Dumb not approved group	\N	Dont allow stupid groups that aren't approved	\N	\N	\N	2	\N	\N
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_id_seq', 29, true);


--
-- Data for Name: pageviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pageviews (id, visitor, page, created_at, updated_at) FROM stdin;
\.


--
-- Name: pageviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pageviews_id_seq', 1, false);


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY people (id, email, first_name, last_name, company, twitter, linkedin, url, other_info, categories, categories_string, crypted_password, created_at, updated_at, image_url, custom_url, admin, bio, approved, approved_on, spam, opt_in_time, opt_in) FROM stdin;
1	john@example.com	John	Doe	\N	johndoe	johndoe	http://google.com	\N	\N	Software	$2a$10$wBdZCVatHoi0MVD/xXzTKu4vpAnCwqMwK0xgIa/bh67Ovr5MGRjoK	2017-03-29 23:40:14.094786	2017-03-29 23:40:14.094786	/img/johndoe.jpg	john-doe	t	Developer. Loves OpenHSV.	t	\N	\N	\N	f
2	jane@example.com	Jane	Doe	\N	janedoe	janedoe	http://google.com	\N	\N	\N	$2a$10$l65nCoZAWrAw4OvtnQ3GleoulUHltO5JbxOhm60i/Y9hOw1XvfyAq	2017-03-29 23:40:14.166988	2017-03-29 23:40:14.166988	/img/janedoe.jpg	jane-doe	t	Building communities and tech in Huntsville.	t	\N	\N	\N	f
\.


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('people_id_seq', 49, true);


--
-- Data for Name: peopleclicks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY peopleclicks (id, visitor, profile, "column", created_at, updated_at, url) FROM stdin;
\.


--
-- Name: peopleclicks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('peopleclicks_id_seq', 1, false);


--
-- Data for Name: schema_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_info (version) FROM stdin;
13
\.


--
-- Data for Name: venues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY venues (id, created_at, updated_at, name, description) FROM stdin;
1	2017-03-29 23:40:17.794467	2017-03-29 23:40:17.794467	Real Estate Row	\N
2	2017-03-29 23:40:17.796074	2017-03-29 23:40:17.796074	Apollo Row	\N
3	2017-03-29 23:40:17.797181	2017-03-29 23:40:17.797181	Main Row	\N
4	2017-03-29 23:40:17.798232	2017-03-29 23:40:17.798232	Mission Control	\N
5	2017-03-29 23:40:17.799439	2017-03-29 23:40:17.799439	Solar Row	\N
6	2017-03-29 23:40:17.8007	2017-03-29 23:40:17.8007	Proxima Row	\N
7	2017-03-29 23:40:17.802219	2017-03-29 23:40:17.802219	Saturn Row	\N
8	2017-03-29 23:40:17.803982	2017-03-29 23:40:17.803982	Endeavor Row	\N
9	2017-03-29 23:40:17.805295	2017-03-29 23:40:17.805295	Milky Way Row	\N
10	2017-03-29 23:40:17.806402	2017-03-29 23:40:17.806402	Andromeda Row	\N
11	2017-03-29 23:40:17.807544	2017-03-29 23:40:17.807544	Orion Row	\N
12	2017-03-29 23:40:17.80868	2017-03-29 23:40:17.80868	Space Station	\N
\.


--
-- Name: venues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('venues_id_seq', 12, true);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: group_admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_admins
    ADD CONSTRAINT group_admins_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: pageviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pageviews
    ADD CONSTRAINT pageviews_pkey PRIMARY KEY (id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: peopleclicks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peopleclicks
    ADD CONSTRAINT peopleclicks_pkey PRIMARY KEY (id);


--
-- Name: venues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venues
    ADD CONSTRAINT venues_pkey PRIMARY KEY (id);


--
-- Name: categories_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES categories(id);


--
-- Name: events_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_created_by_fkey FOREIGN KEY (created_by) REFERENCES people(id);


--
-- Name: events_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_group_id_fkey FOREIGN KEY (group_id) REFERENCES groups(id);


--
-- Name: events_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES events(id);


--
-- Name: events_updated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES people(id);


--
-- Name: events_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES venues(id);


--
-- Name: group_admins_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_admins
    ADD CONSTRAINT group_admins_group_id_fkey FOREIGN KEY (group_id) REFERENCES groups(id);


--
-- Name: group_admins_people_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_admins
    ADD CONSTRAINT group_admins_people_id_fkey FOREIGN KEY (people_id) REFERENCES people(id);


--
-- Name: groups_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES groups(id);


--
-- Name: pageviews_visitor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pageviews
    ADD CONSTRAINT pageviews_visitor_fkey FOREIGN KEY (visitor) REFERENCES people(id);


--
-- Name: peopleclicks_profile_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peopleclicks
    ADD CONSTRAINT peopleclicks_profile_fkey FOREIGN KEY (profile) REFERENCES people(id);


--
-- Name: peopleclicks_visitor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peopleclicks
    ADD CONSTRAINT peopleclicks_visitor_fkey FOREIGN KEY (visitor) REFERENCES people(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
