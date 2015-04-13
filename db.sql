--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: band_tags; Type: TABLE; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE TABLE band_tags (
    id integer NOT NULL,
    band_id integer NOT NULL,
    tag_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.band_tags OWNER TO appacademy;

--
-- Name: band_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE band_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.band_tags_id_seq OWNER TO appacademy;

--
-- Name: band_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE band_tags_id_seq OWNED BY band_tags.id;


--
-- Name: bands; Type: TABLE; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE TABLE bands (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.bands OWNER TO appacademy;

--
-- Name: bands_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE bands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bands_id_seq OWNER TO appacademy;

--
-- Name: bands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE bands_id_seq OWNED BY bands.id;


--
-- Name: blog_tags; Type: TABLE; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE TABLE blog_tags (
    id integer NOT NULL,
    blog_id integer NOT NULL,
    tag_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.blog_tags OWNER TO appacademy;

--
-- Name: blog_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE blog_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_tags_id_seq OWNER TO appacademy;

--
-- Name: blog_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE blog_tags_id_seq OWNED BY blog_tags.id;


--
-- Name: blogs; Type: TABLE; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE TABLE blogs (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer NOT NULL
);


ALTER TABLE public.blogs OWNER TO appacademy;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO appacademy;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE blogs_id_seq OWNED BY blogs.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    user_id integer NOT NULL,
    body text NOT NULL,
    commentable_id integer,
    commentable_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.comments OWNER TO appacademy;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO appacademy;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO appacademy;

--
-- Name: song_tags; Type: TABLE; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE TABLE song_tags (
    id integer NOT NULL,
    song_id integer NOT NULL,
    tag_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.song_tags OWNER TO appacademy;

--
-- Name: song_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE song_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.song_tags_id_seq OWNER TO appacademy;

--
-- Name: song_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE song_tags_id_seq OWNED BY song_tags.id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE TABLE songs (
    id integer NOT NULL,
    band_id integer NOT NULL,
    blog_id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    song_type character varying(255) NOT NULL,
    audio_file_name character varying(255),
    audio_content_type character varying(255),
    audio_file_size integer,
    audio_updated_at timestamp without time zone,
    image_file_name character varying(255),
    image_content_type character varying(255),
    image_file_size integer,
    image_updated_at timestamp without time zone,
    user_id integer NOT NULL
);


ALTER TABLE public.songs OWNER TO appacademy;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE songs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_id_seq OWNER TO appacademy;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE songs_id_seq OWNED BY songs.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tags OWNER TO appacademy;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO appacademy;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: user_blogs; Type: TABLE; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE TABLE user_blogs (
    id integer NOT NULL,
    user_id integer NOT NULL,
    blog_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.user_blogs OWNER TO appacademy;

--
-- Name: user_blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE user_blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_blogs_id_seq OWNER TO appacademy;

--
-- Name: user_blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE user_blogs_id_seq OWNED BY user_blogs.id;


--
-- Name: user_follows; Type: TABLE; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE TABLE user_follows (
    id integer NOT NULL,
    follower_id integer NOT NULL,
    followed_user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.user_follows OWNER TO appacademy;

--
-- Name: user_follows_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE user_follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_follows_id_seq OWNER TO appacademy;

--
-- Name: user_follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE user_follows_id_seq OWNED BY user_follows.id;


--
-- Name: user_songs; Type: TABLE; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE TABLE user_songs (
    id integer NOT NULL,
    user_id integer NOT NULL,
    song_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.user_songs OWNER TO appacademy;

--
-- Name: user_songs_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE user_songs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_songs_id_seq OWNER TO appacademy;

--
-- Name: user_songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE user_songs_id_seq OWNED BY user_songs.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    password_digest character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    session_token character varying(255) NOT NULL,
    image_file_name character varying(255),
    image_content_type character varying(255),
    image_file_size integer,
    image_updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO appacademy;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: appacademy
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO appacademy;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: appacademy
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY band_tags ALTER COLUMN id SET DEFAULT nextval('band_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY bands ALTER COLUMN id SET DEFAULT nextval('bands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY blog_tags ALTER COLUMN id SET DEFAULT nextval('blog_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY blogs ALTER COLUMN id SET DEFAULT nextval('blogs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY song_tags ALTER COLUMN id SET DEFAULT nextval('song_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY songs ALTER COLUMN id SET DEFAULT nextval('songs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY user_blogs ALTER COLUMN id SET DEFAULT nextval('user_blogs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY user_follows ALTER COLUMN id SET DEFAULT nextval('user_follows_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY user_songs ALTER COLUMN id SET DEFAULT nextval('user_songs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: appacademy
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: band_tags; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY band_tags (id, band_id, tag_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: band_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('band_tags_id_seq', 1, false);


--
-- Data for Name: bands; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY bands (id, name, created_at, updated_at) FROM stdin;
1	Sublime	2015-04-13 18:16:46.28153	2015-04-13 18:16:46.28153
2	Rolling Stones	2015-04-13 18:16:46.285447	2015-04-13 18:16:46.285447
3	The Strokes	2015-04-13 18:16:46.288036	2015-04-13 18:16:46.288036
4	Wilco	2015-04-13 18:16:46.290951	2015-04-13 18:16:46.290951
5	Chromeo	2015-04-13 18:16:46.293641	2015-04-13 18:16:46.293641
6	Calvin Harris	2015-04-13 18:16:46.296741	2015-04-13 18:16:46.296741
7	UGK	2015-04-13 18:16:46.299268	2015-04-13 18:16:46.299268
8	Miles Davis	2015-04-13 18:16:46.301719	2015-04-13 18:16:46.301719
9	Queen	2015-04-13 18:16:46.304138	2015-04-13 18:16:46.304138
10	Pink Floyd	2015-04-13 18:16:46.306951	2015-04-13 18:16:46.306951
11	Fleet Foxes	2015-04-13 18:16:46.309779	2015-04-13 18:16:46.309779
12	Beirut	2015-04-13 18:16:46.313027	2015-04-13 18:16:46.313027
13	Devotchka	2015-04-13 18:16:46.316441	2015-04-13 18:16:46.316441
14	Frank Ocean	2015-04-13 18:16:46.319148	2015-04-13 18:16:46.319148
15	Sigur Ros	2015-04-13 18:16:46.321702	2015-04-13 18:16:46.321702
16	Vampire Weekend	2015-04-13 18:16:46.324144	2015-04-13 18:16:46.324144
17	Morrissey	2015-04-13 18:16:46.326738	2015-04-13 18:16:46.326738
18	Sia	2015-04-13 18:16:46.329351	2015-04-13 18:16:46.329351
19	Conservative Crane	2015-04-13 18:16:46.425682	2015-04-13 18:16:46.425682
20	Soft Quest	2015-04-13 18:16:46.480453	2015-04-13 18:16:46.480453
21	Exciting Safe	2015-04-13 18:16:46.528967	2015-04-13 18:16:46.528967
22	Glazed People	2015-04-13 18:16:46.593668	2015-04-13 18:16:46.593668
23	Strong Spider	2015-04-13 18:16:46.643339	2015-04-13 18:16:46.643339
\.


--
-- Name: bands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('bands_id_seq', 23, true);


--
-- Data for Name: blog_tags; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY blog_tags (id, blog_id, tag_id, created_at, updated_at) FROM stdin;
1	1	3	2015-04-13 18:19:19.103132	2015-04-13 18:19:19.103132
2	1	9	2015-04-13 18:19:19.125842	2015-04-13 18:19:19.125842
3	1	5	2015-04-13 18:19:19.129808	2015-04-13 18:19:19.129808
4	2	10	2015-04-13 18:19:19.133825	2015-04-13 18:19:19.133825
5	2	15	2015-04-13 18:19:19.137717	2015-04-13 18:19:19.137717
6	2	17	2015-04-13 18:19:19.14141	2015-04-13 18:19:19.14141
7	2	19	2015-04-13 18:19:19.145074	2015-04-13 18:19:19.145074
8	3	15	2015-04-13 18:19:19.14916	2015-04-13 18:19:19.14916
9	3	2	2015-04-13 18:19:19.157828	2015-04-13 18:19:19.157828
10	3	8	2015-04-13 18:19:19.164315	2015-04-13 18:19:19.164315
11	4	18	2015-04-13 18:19:19.168796	2015-04-13 18:19:19.168796
12	4	7	2015-04-13 18:19:19.172418	2015-04-13 18:19:19.172418
13	4	5	2015-04-13 18:19:19.175954	2015-04-13 18:19:19.175954
14	5	14	2015-04-13 18:19:19.179394	2015-04-13 18:19:19.179394
15	5	19	2015-04-13 18:19:19.183212	2015-04-13 18:19:19.183212
16	5	4	2015-04-13 18:19:19.18676	2015-04-13 18:19:19.18676
17	6	19	2015-04-13 18:19:19.190228	2015-04-13 18:19:19.190228
18	6	10	2015-04-13 18:19:19.193728	2015-04-13 18:19:19.193728
19	6	12	2015-04-13 18:19:19.197443	2015-04-13 18:19:19.197443
20	6	8	2015-04-13 18:19:19.204999	2015-04-13 18:19:19.204999
21	7	17	2015-04-13 18:19:19.208578	2015-04-13 18:19:19.208578
22	7	18	2015-04-13 18:19:19.212092	2015-04-13 18:19:19.212092
23	7	1	2015-04-13 18:19:19.215614	2015-04-13 18:19:19.215614
24	7	12	2015-04-13 18:19:19.219329	2015-04-13 18:19:19.219329
25	8	19	2015-04-13 18:19:19.226088	2015-04-13 18:19:19.226088
26	8	2	2015-04-13 18:19:19.229554	2015-04-13 18:19:19.229554
27	9	4	2015-04-13 18:19:19.233511	2015-04-13 18:19:19.233511
28	9	16	2015-04-13 18:19:19.237154	2015-04-13 18:19:19.237154
29	10	15	2015-04-13 18:19:19.240729	2015-04-13 18:19:19.240729
30	10	18	2015-04-13 18:19:19.244245	2015-04-13 18:19:19.244245
31	11	19	2015-04-13 18:19:19.247713	2015-04-13 18:19:19.247713
32	11	7	2015-04-13 18:19:19.251809	2015-04-13 18:19:19.251809
33	11	4	2015-04-13 18:19:19.255506	2015-04-13 18:19:19.255506
34	11	1	2015-04-13 18:19:19.25928	2015-04-13 18:19:19.25928
35	12	1	2015-04-13 18:19:19.262847	2015-04-13 18:19:19.262847
36	12	12	2015-04-13 18:19:19.266568	2015-04-13 18:19:19.266568
37	12	7	2015-04-13 18:19:19.270645	2015-04-13 18:19:19.270645
38	13	15	2015-04-13 18:19:19.277273	2015-04-13 18:19:19.277273
39	13	3	2015-04-13 18:19:19.280779	2015-04-13 18:19:19.280779
40	13	1	2015-04-13 18:19:19.28433	2015-04-13 18:19:19.28433
41	14	13	2015-04-13 18:19:19.294315	2015-04-13 18:19:19.294315
42	14	8	2015-04-13 18:19:19.29781	2015-04-13 18:19:19.29781
43	14	16	2015-04-13 18:19:19.301545	2015-04-13 18:19:19.301545
44	14	5	2015-04-13 18:19:19.305222	2015-04-13 18:19:19.305222
45	14	7	2015-04-13 18:19:19.308754	2015-04-13 18:19:19.308754
46	15	9	2015-04-13 18:19:19.31296	2015-04-13 18:19:19.31296
47	15	19	2015-04-13 18:19:19.321002	2015-04-13 18:19:19.321002
48	15	7	2015-04-13 18:19:19.324937	2015-04-13 18:19:19.324937
49	16	9	2015-04-13 18:19:19.332783	2015-04-13 18:19:19.332783
50	16	2	2015-04-13 18:19:19.337259	2015-04-13 18:19:19.337259
51	16	12	2015-04-13 18:19:19.341256	2015-04-13 18:19:19.341256
52	16	18	2015-04-13 18:19:19.345059	2015-04-13 18:19:19.345059
53	17	20	2015-04-13 18:19:19.35337	2015-04-13 18:19:19.35337
54	17	5	2015-04-13 18:19:19.35754	2015-04-13 18:19:19.35754
55	17	8	2015-04-13 18:19:19.36176	2015-04-13 18:19:19.36176
56	18	7	2015-04-13 18:19:19.366131	2015-04-13 18:19:19.366131
57	18	4	2015-04-13 18:19:19.370407	2015-04-13 18:19:19.370407
58	19	14	2015-04-13 18:19:19.374472	2015-04-13 18:19:19.374472
59	19	2	2015-04-13 18:19:19.378319	2015-04-13 18:19:19.378319
60	19	11	2015-04-13 18:19:19.382672	2015-04-13 18:19:19.382672
61	19	10	2015-04-13 18:19:19.390797	2015-04-13 18:19:19.390797
62	20	2	2015-04-13 18:19:19.394702	2015-04-13 18:19:19.394702
63	20	20	2015-04-13 18:19:19.398738	2015-04-13 18:19:19.398738
64	20	6	2015-04-13 18:19:19.402784	2015-04-13 18:19:19.402784
65	21	2	2015-04-13 18:19:19.406864	2015-04-13 18:19:19.406864
66	21	20	2015-04-13 18:19:19.410888	2015-04-13 18:19:19.410888
67	22	5	2015-04-13 18:19:19.415319	2015-04-13 18:19:19.415319
68	22	4	2015-04-13 18:19:19.420079	2015-04-13 18:19:19.420079
69	22	11	2015-04-13 18:19:19.424165	2015-04-13 18:19:19.424165
70	23	19	2015-04-13 18:19:19.428328	2015-04-13 18:19:19.428328
71	23	1	2015-04-13 18:19:19.432446	2015-04-13 18:19:19.432446
72	23	12	2015-04-13 18:19:19.437261	2015-04-13 18:19:19.437261
73	23	8	2015-04-13 18:19:19.441497	2015-04-13 18:19:19.441497
74	23	18	2015-04-13 18:19:19.446353	2015-04-13 18:19:19.446353
\.


--
-- Name: blog_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('blog_tags_id_seq', 74, true);


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY blogs (id, name, created_at, updated_at, user_id) FROM stdin;
1	Amazing Safe	2015-01-19 19:16:46.699009	2015-04-13 18:16:46.707049	1
2	Wireless Jukebox	2015-02-27 19:16:46.872016	2015-04-13 18:16:46.874616	1
3	Incredible Rat	2015-02-10 19:16:46.919361	2015-04-13 18:16:46.920959	2
4	Bluetooth Racoon	2015-02-19 19:16:46.968049	2015-04-13 18:16:46.969642	2
5	Lovely Viper	2015-02-28 19:16:47.030654	2015-04-13 18:16:47.032407	3
6	Exciting Plaid	2015-04-12 18:16:47.079167	2015-04-13 18:16:47.080751	4
7	Stellar Moose	2015-01-08 19:16:47.128859	2015-04-13 18:16:47.130473	4
8	Bodacious Address	2015-02-19 19:16:47.284726	2015-04-13 18:16:47.286798	5
9	Generous Rat	2015-03-03 19:16:47.331319	2015-04-13 18:16:47.332916	5
10	Incredible Fork	2015-03-21 18:16:47.379961	2015-04-13 18:16:47.381564	5
11	Spectacular Shirt	2015-01-25 19:16:47.445131	2015-04-13 18:16:47.447033	5
12	Wonderful Envelope	2015-03-04 19:16:47.495202	2015-04-13 18:16:47.496785	6
13	Governing Sand	2015-03-24 18:16:47.541803	2015-04-13 18:16:47.543396	6
14	Grandmas Chandelier	2015-02-22 19:16:47.694894	2015-04-13 18:16:47.696525	6
15	Lovely Suit	2015-03-23 18:16:47.742021	2015-04-13 18:16:47.743632	6
16	Dancing Spider	2015-03-10 18:16:47.79013	2015-04-13 18:16:47.791739	7
17	Free Fractal	2015-03-29 18:16:47.850901	2015-04-13 18:16:47.852472	8
18	Ultimate Argyle	2015-03-08 18:16:47.902695	2015-04-13 18:16:47.904294	8
19	Liberal Tapir	2015-02-07 19:16:47.949506	2015-04-13 18:16:47.95129	8
20	Old Cracked	2015-01-11 19:16:48.104695	2015-04-13 18:16:48.106358	9
21	Stellar Floutist	2015-02-09 19:16:48.149464	2015-04-13 18:16:48.151084	9
22	Established Stickbug	2015-02-10 19:16:48.194853	2015-04-13 18:16:48.196436	10
23	Incredible Ham	2015-03-12 18:16:48.25659	2015-04-13 18:16:48.258189	10
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('blogs_id_seq', 23, true);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY comments (id, user_id, body, commentable_id, commentable_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY schema_migrations (version) FROM stdin;
20150107014157
20150107020157
20150107024312
20150107030345
20150107152510
20150107154228
20150107184057
20150107204255
20150107204403
20150107204434
20150108000758
20150108001116
20150108001214
20150108160856
20150113045527
20150114170252
20150115004214
20150115164016
20150115201311
20150122204411
20150122204904
20150122210433
20150128201701
20150205222429
20150206201332
\.


--
-- Data for Name: song_tags; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY song_tags (id, song_id, tag_id, created_at, updated_at) FROM stdin;
1	1	20	2015-04-13 18:19:19.475496	2015-04-13 18:19:19.475496
2	1	17	2015-04-13 18:19:19.481169	2015-04-13 18:19:19.481169
3	1	4	2015-04-13 18:19:19.485477	2015-04-13 18:19:19.485477
4	2	12	2015-04-13 18:19:19.491872	2015-04-13 18:19:19.491872
5	3	17	2015-04-13 18:19:19.498079	2015-04-13 18:19:19.498079
6	4	19	2015-04-13 18:19:19.508585	2015-04-13 18:19:19.508585
7	5	17	2015-04-13 18:19:19.513519	2015-04-13 18:19:19.513519
8	6	3	2015-04-13 18:19:19.518676	2015-04-13 18:19:19.518676
9	7	15	2015-04-13 18:19:19.52235	2015-04-13 18:19:19.52235
10	7	17	2015-04-13 18:19:19.525965	2015-04-13 18:19:19.525965
11	7	7	2015-04-13 18:19:19.529489	2015-04-13 18:19:19.529489
12	8	1	2015-04-13 18:19:19.533018	2015-04-13 18:19:19.533018
13	9	13	2015-04-13 18:19:19.536967	2015-04-13 18:19:19.536967
14	9	14	2015-04-13 18:19:19.540512	2015-04-13 18:19:19.540512
15	9	5	2015-04-13 18:19:19.544075	2015-04-13 18:19:19.544075
16	10	11	2015-04-13 18:19:19.547851	2015-04-13 18:19:19.547851
17	10	20	2015-04-13 18:19:19.551701	2015-04-13 18:19:19.551701
\.


--
-- Name: song_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('song_tags_id_seq', 17, true);


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY songs (id, band_id, blog_id, name, created_at, updated_at, song_type, audio_file_name, audio_content_type, audio_file_size, audio_updated_at, image_file_name, image_content_type, image_file_size, image_updated_at, user_id) FROM stdin;
1	20	2	Awesome Dotted	2015-03-30 18:16:48.391402	2015-04-13 18:16:58.668108	remix	\N	\N	\N	\N	artsy_splats_by_Maikey.jpg	image/jpeg	187974	2015-04-13 18:16:58.140558	1
2	18	3	Strong Spotted	2015-01-08 19:17:15.528898	2015-04-13 18:17:41.300683	regular	\N	\N	\N	\N	f251d544.jpg	image/jpeg	303131	2015-04-13 18:17:40.600364	2
3	12	5	Conservative Plaid	2015-03-17 18:17:59.746206	2015-04-13 18:18:01.760707	regular	\N	\N	\N	\N	recordseries-pressmarker.jpg	image/jpeg	98902	2015-04-13 18:18:01.314321	3
4	19	7	Prickly Eggs	2015-03-10 18:18:09.665011	2015-04-13 18:18:14.643721	regular	\N	\N	\N	\N	Sunset-from-Artsy-HQ.jpg	image/jpeg	151746	2015-04-13 18:18:14.307692	4
5	15	11	Splendid Elephant	2015-02-09 19:18:30.038012	2015-04-13 18:18:30.695934	remix	\N	\N	\N	\N	1461857-My-attempt-at-artsy-photography-0.jpg	image/jpeg	37717	2015-04-13 18:18:30.389328	5
6	21	15	Windy President	2015-04-12 18:18:32.541024	2015-04-13 18:18:33.081983	remix	\N	\N	\N	\N	ii-art-artsy-beautiful-Favim.com-689826.jpg	image/jpeg	56519	2015-04-13 18:18:32.848711	6
7	13	16	Superior Door	2015-02-08 19:18:35.668189	2015-04-13 18:18:36.428389	regular	\N	\N	\N	\N	artsy-accidental-shotsmall.jpg	image/jpeg	71414	2015-04-13 18:18:35.943836	7
8	18	17	Fuzzy Gladiator	2015-02-04 19:18:40.052692	2015-04-13 18:18:40.77057	regular	\N	\N	\N	\N	recordseries-pressmarker.jpg	image/jpeg	98902	2015-04-13 18:18:40.454259	8
9	6	20	Soft Fractal	2015-03-30 18:18:45.766607	2015-04-13 18:18:47.017351	regular	\N	\N	\N	\N	f251d544.jpg	image/jpeg	303131	2015-04-13 18:18:46.537286	9
10	21	23	Awesome Photograph	2015-03-25 18:19:05.681076	2015-04-13 18:19:06.669221	regular	\N	\N	\N	\N	f251d544.jpg	image/jpeg	303131	2015-04-13 18:19:06.270675	10
\.


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('songs_id_seq', 10, true);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY tags (id, name, created_at, updated_at) FROM stdin;
1	Funk	2015-04-13 18:16:46.16035	2015-04-13 18:16:46.16035
2	Indie Rock	2015-04-13 18:16:46.205893	2015-04-13 18:16:46.205893
3	Folk Rock	2015-04-13 18:16:46.20906	2015-04-13 18:16:46.20906
4	Electro-pop	2015-04-13 18:16:46.212006	2015-04-13 18:16:46.212006
5	Soul	2015-04-13 18:16:46.214807	2015-04-13 18:16:46.214807
6	House	2015-04-13 18:16:46.217473	2015-04-13 18:16:46.217473
7	Electronic	2015-04-13 18:16:46.220426	2015-04-13 18:16:46.220426
8	Rap	2015-04-13 18:16:46.223415	2015-04-13 18:16:46.223415
9	Hip Hop	2015-04-13 18:16:46.226394	2015-04-13 18:16:46.226394
10	Jazz	2015-04-13 18:16:46.228919	2015-04-13 18:16:46.228919
11	Folk	2015-04-13 18:16:46.231299	2015-04-13 18:16:46.231299
12	Metal	2015-04-13 18:16:46.234089	2015-04-13 18:16:46.234089
13	Punk	2015-04-13 18:16:46.236616	2015-04-13 18:16:46.236616
14	R&B	2015-04-13 18:16:46.239306	2015-04-13 18:16:46.239306
15	Disco	2015-04-13 18:16:46.24182	2015-04-13 18:16:46.24182
16	Country	2015-04-13 18:16:46.244336	2015-04-13 18:16:46.244336
17	Dub Step	2015-04-13 18:16:46.246767	2015-04-13 18:16:46.246767
18	Rock	2015-04-13 18:16:46.24921	2015-04-13 18:16:46.24921
19	Classic Rock	2015-04-13 18:16:46.252035	2015-04-13 18:16:46.252035
20	Ska	2015-04-13 18:16:46.254611	2015-04-13 18:16:46.254611
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('tags_id_seq', 20, true);


--
-- Data for Name: user_blogs; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY user_blogs (id, user_id, blog_id, created_at, updated_at) FROM stdin;
1	1	21	2015-04-12 18:17:15.369458	2015-04-13 18:17:15.382579
2	1	18	2015-04-11 18:17:15.386973	2015-04-13 18:17:15.38913
3	1	13	2015-04-10 18:17:15.391993	2015-04-13 18:17:15.393642
4	1	23	2015-04-09 18:17:15.39639	2015-04-13 18:17:15.397838
5	1	11	2015-04-12 18:17:15.400324	2015-04-13 18:17:15.401701
6	1	22	2015-04-12 18:17:15.40422	2015-04-13 18:17:15.405689
7	1	4	2015-04-10 18:17:15.408249	2015-04-13 18:17:15.409599
8	2	5	2015-04-13 18:17:59.669885	2015-04-13 18:17:59.671579
9	2	11	2015-04-09 18:17:59.674053	2015-04-13 18:17:59.675511
10	2	2	2015-04-11 18:17:59.678325	2015-04-13 18:17:59.679653
11	2	19	2015-04-12 18:17:59.682312	2015-04-13 18:17:59.683651
12	2	18	2015-04-09 18:17:59.686102	2015-04-13 18:17:59.6875
13	2	7	2015-04-11 18:17:59.693844	2015-04-13 18:17:59.695193
14	3	21	2015-04-11 18:18:09.591552	2015-04-13 18:18:09.593037
15	3	10	2015-04-09 18:18:09.595417	2015-04-13 18:18:09.596727
16	3	18	2015-04-06 18:18:09.599046	2015-04-13 18:18:09.600324
17	3	5	2015-04-09 18:18:09.602731	2015-04-13 18:18:09.604309
18	3	11	2015-04-08 18:18:09.606815	2015-04-13 18:18:09.608124
19	3	9	2015-04-10 18:18:09.610503	2015-04-13 18:18:09.611797
20	3	23	2015-04-11 18:18:09.614692	2015-04-13 18:18:09.616303
21	4	12	2015-04-08 18:18:29.898793	2015-04-13 18:18:29.900327
22	4	8	2015-04-12 18:18:29.902664	2015-04-13 18:18:29.903958
23	4	3	2015-04-13 18:18:29.90646	2015-04-13 18:18:29.908103
24	4	7	2015-04-08 18:18:29.910671	2015-04-13 18:18:29.912178
25	4	6	2015-04-12 18:18:29.921856	2015-04-13 18:18:29.923206
26	5	7	2015-04-11 18:18:32.470186	2015-04-13 18:18:32.471867
27	5	10	2015-04-06 18:18:32.474461	2015-04-13 18:18:32.475818
28	5	15	2015-04-08 18:18:32.478446	2015-04-13 18:18:32.479797
29	5	9	2015-04-13 18:18:32.482954	2015-04-13 18:18:32.48435
30	5	2	2015-04-13 18:18:32.486943	2015-04-13 18:18:32.488573
31	5	4	2015-04-13 18:18:32.491263	2015-04-13 18:18:32.492666
32	5	5	2015-04-08 18:18:32.495391	2015-04-13 18:18:32.496817
33	6	11	2015-04-07 18:18:35.533935	2015-04-13 18:18:35.535673
34	6	13	2015-04-06 18:18:35.538871	2015-04-13 18:18:35.540316
35	6	18	2015-04-07 18:18:35.545982	2015-04-13 18:18:35.547419
36	6	3	2015-04-09 18:18:35.549903	2015-04-13 18:18:35.551352
37	6	17	2015-04-10 18:18:35.553894	2015-04-13 18:18:35.555248
38	6	19	2015-04-09 18:18:35.557766	2015-04-13 18:18:35.559105
39	6	15	2015-04-11 18:18:35.561491	2015-04-13 18:18:35.562812
40	7	16	2015-04-09 18:18:39.979772	2015-04-13 18:18:39.9816
41	7	21	2015-04-13 18:18:39.984152	2015-04-13 18:18:39.986012
42	7	23	2015-04-13 18:18:39.992228	2015-04-13 18:18:39.9935
43	7	3	2015-04-07 18:18:39.996275	2015-04-13 18:18:39.997806
44	7	19	2015-04-12 18:18:40.000245	2015-04-13 18:18:40.001574
45	7	22	2015-04-07 18:18:40.004065	2015-04-13 18:18:40.005444
46	8	8	2015-04-09 18:18:45.614838	2015-04-13 18:18:45.616273
47	8	2	2015-04-12 18:18:45.619358	2015-04-13 18:18:45.621269
48	8	18	2015-04-09 18:18:45.624608	2015-04-13 18:18:45.626135
49	8	10	2015-04-09 18:18:45.628711	2015-04-13 18:18:45.630279
50	8	6	2015-04-12 18:18:45.632934	2015-04-13 18:18:45.634352
51	8	9	2015-04-12 18:18:45.637317	2015-04-13 18:18:45.638763
52	8	21	2015-04-11 18:18:45.641033	2015-04-13 18:18:45.642307
53	9	8	2015-04-11 18:19:05.426734	2015-04-13 18:19:05.428345
54	9	21	2015-04-11 18:19:05.434266	2015-04-13 18:19:05.435549
55	9	10	2015-04-13 18:19:05.437895	2015-04-13 18:19:05.439166
56	9	15	2015-04-09 18:19:05.441448	2015-04-13 18:19:05.444594
57	9	17	2015-04-12 18:19:05.447762	2015-04-13 18:19:05.449211
58	9	20	2015-04-12 18:19:05.45195	2015-04-13 18:19:05.453447
59	10	13	2015-04-13 18:19:18.987159	2015-04-13 18:19:18.988693
60	10	18	2015-04-11 18:19:18.991415	2015-04-13 18:19:18.992725
61	10	9	2015-04-13 18:19:18.99506	2015-04-13 18:19:18.996432
62	10	22	2015-04-09 18:19:18.998788	2015-04-13 18:19:19.000125
63	10	3	2015-04-12 18:19:19.002573	2015-04-13 18:19:19.003899
64	10	21	2015-04-09 18:19:19.00624	2015-04-13 18:19:19.007528
65	10	16	2015-04-12 18:19:19.009821	2015-04-13 18:19:19.011159
\.


--
-- Name: user_blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('user_blogs_id_seq', 65, true);


--
-- Data for Name: user_follows; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY user_follows (id, follower_id, followed_user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: user_follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('user_follows_id_seq', 1, false);


--
-- Data for Name: user_songs; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY user_songs (id, user_id, song_id, created_at, updated_at) FROM stdin;
1	1	1	2015-04-12 18:17:15.319091	2015-04-13 18:17:15.338715
2	2	1	2015-04-10 18:17:59.641521	2015-04-13 18:17:59.643809
3	2	2	2015-04-06 18:17:59.646934	2015-04-13 18:17:59.648415
4	3	3	2015-04-07 18:18:09.561657	2015-04-13 18:18:09.563648
5	3	2	2015-04-07 18:18:09.566071	2015-04-13 18:18:09.567579
6	3	1	2015-04-11 18:18:09.57624	2015-04-13 18:18:09.577582
7	4	1	2015-04-08 18:18:29.870382	2015-04-13 18:18:29.872477
8	4	3	2015-04-13 18:18:29.875018	2015-04-13 18:18:29.876465
9	4	2	2015-04-06 18:18:29.878734	2015-04-13 18:18:29.880108
10	5	3	2015-04-10 18:18:32.43177	2015-04-13 18:18:32.434098
11	5	5	2015-04-13 18:18:32.452433	2015-04-13 18:18:32.454625
12	5	4	2015-04-07 18:18:32.45751	2015-04-13 18:18:32.459527
13	5	2	2015-04-11 18:18:32.462245	2015-04-13 18:18:32.463754
14	6	6	2015-04-08 18:18:35.481009	2015-04-13 18:18:35.4835
15	6	1	2015-04-08 18:18:35.486202	2015-04-13 18:18:35.488225
16	6	4	2015-04-08 18:18:35.490708	2015-04-13 18:18:35.492263
17	6	5	2015-04-06 18:18:35.494746	2015-04-13 18:18:35.496155
18	6	2	2015-04-09 18:18:35.501731	2015-04-13 18:18:35.503804
19	6	3	2015-04-12 18:18:35.506731	2015-04-13 18:18:35.508162
20	7	7	2015-04-11 18:18:39.947426	2015-04-13 18:18:39.949877
21	7	4	2015-04-10 18:18:39.952837	2015-04-13 18:18:39.954446
22	7	3	2015-04-10 18:18:39.95724	2015-04-13 18:18:39.958805
23	7	1	2015-04-12 18:18:39.961348	2015-04-13 18:18:39.962758
24	7	5	2015-04-10 18:18:39.965124	2015-04-13 18:18:39.966536
25	7	2	2015-04-12 18:18:39.972622	2015-04-13 18:18:39.973964
26	8	2	2015-04-09 18:18:45.583093	2015-04-13 18:18:45.585468
27	8	8	2015-04-07 18:18:45.588421	2015-04-13 18:18:45.589871
28	8	7	2015-04-10 18:18:45.59221	2015-04-13 18:18:45.593642
29	8	4	2015-04-06 18:18:45.59607	2015-04-13 18:18:45.597502
30	8	5	2015-04-13 18:18:45.606212	2015-04-13 18:18:45.608343
31	9	6	2015-04-06 18:19:05.395742	2015-04-13 18:19:05.397769
32	9	9	2015-04-06 18:19:05.400637	2015-04-13 18:19:05.40207
33	9	3	2015-04-11 18:19:05.408375	2015-04-13 18:19:05.409707
34	9	8	2015-04-11 18:19:05.412151	2015-04-13 18:19:05.413531
35	9	2	2015-04-06 18:19:05.415798	2015-04-13 18:19:05.417214
36	9	1	2015-04-08 18:19:05.419662	2015-04-13 18:19:05.421026
37	10	1	2015-04-07 18:19:18.95305	2015-04-13 18:19:18.955012
38	10	9	2015-04-11 18:19:18.958505	2015-04-13 18:19:18.960068
39	10	2	2015-04-13 18:19:18.966376	2015-04-13 18:19:18.968141
40	10	6	2015-04-12 18:19:18.970591	2015-04-13 18:19:18.971942
41	10	3	2015-04-06 18:19:18.97419	2015-04-13 18:19:18.975584
42	10	4	2015-04-07 18:19:18.977928	2015-04-13 18:19:18.979739
43	10	5	2015-04-11 18:19:18.982879	2015-04-13 18:19:18.984415
\.


--
-- Name: user_songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('user_songs_id_seq', 43, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: appacademy
--

COPY users (id, email, username, password_digest, created_at, updated_at, session_token, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
1	ben@gmail.com	thatpurplestuff	$2a$10$QpFCXOf.mzpkqye.9/nPUeBt49TEz.MLhacc.V125QF8YONFq.pTm	2015-04-13 18:15:03.717124	2015-04-13 18:15:03.717124	ECM7AtTYoQnMxrQRgtEVxw	artworks-000055749355-guzn2f-t500x500.jpg	image/jpeg	47661	2015-04-13 18:15:02.952352
2	leie.littel@johnston.name	Zetta Treutel	$2a$10$/m3YmCs0mCz45VeMaVuP6uViVN/OsD0CW7KN.ywdxfRcLEmyep.Rm	2015-04-01 18:15:16.35609	2015-04-13 18:15:21.784484	p8cVfw4bZYZhEnuf9VG4rg	slash.jpg	image/jpeg	52605	2015-04-13 18:15:21.350835
3	mohammed@weinatrogahn.org	Aiyana Keeling	$2a$10$P6jviKN6lsOhMs2MWQ5LyOpTg8XuDYUz0Puzrv82mg1.tUVhbbz4m	2015-03-11 18:15:31.869933	2015-04-13 18:15:34.417379	i2epwO-L7KY9CSXw49ucyg	Pink-Floyd-006.jpg	image/jpeg	9986	2015-04-13 18:15:33.98855
4	stanton@tremblay.info	Dr. Helene Johns	$2a$10$epDdb4gIf7VKTX5HuT4e8.1lX.T4mQAAE1kZACHBo/yPekuHXvPOK	2015-03-29 18:15:40.638391	2015-04-13 18:15:44.62236	DI6T1Esb8Zi8_puHLH4tcw	The_Strokes__1__by_alexjames01.png	image/png	20504	2015-04-13 18:15:44.389007
5	jack_doyle@hoppelynch.name	Kailyn Klein	$2a$10$K0FhpX/ycPGoLkJAHt0Z4erUR0GOIrjngFsJ48HyGMKsvOc94x0eK	2015-01-25 19:15:50.227222	2015-04-13 18:15:52.201318	h4BLBscwxg2BQaj72EoWZQ	lou-reed-2.jpg	image/jpeg	7343	2015-04-13 18:15:52.06926
6	marcelino@purdy.name	Mrs. Nicholas Lebsack	$2a$10$dPx2UgW/ZGOzZPvKDOXfgO/jUlcwtRs5NiiwFDZM74H6RVptB9bHS	2015-01-23 19:15:56.923466	2015-04-13 18:15:58.976416	Bs3-EwwNS_C8J6bxD9Dkew	Rolling-Stones-Wallpaper-classic-rock-17732124-1024-768.jpg	image/jpeg	9723	2015-04-13 18:15:58.837796
7	maurice@kling.name	Wilber Lehner	$2a$10$44I1L/vy3tud4s8iAdHsSuGhf14jA3QiLCdqB/6V4INPWnzrKiKcG	2015-01-14 19:16:05.409784	2015-04-13 18:16:08.044038	z1h-O-C7vN9qaCpCz-VcbQ	Frank_Ocean_01-e1305847591792.jpeg	image/jpeg	6662	2015-04-13 18:16:07.749467
8	cleta.farrell@brekke.net	Gregoria Conn	$2a$10$2nwadhMNQtWDxBlbu2Uhjep7TmRkeaLs6pVZovRgF.s7Ake5uPhqO	2015-03-10 18:16:13.254372	2015-04-13 18:16:17.199194	anp11YyTHeOeZTXOeUgyAw	earl-sweatshirt.jpg	image/jpeg	39534	2015-04-13 18:16:16.959025
9	howell_schmeler@keeblerparker.net	Bertram Parisian	$2a$10$bUdYW/EAdj02aLIx9mUw7.F7PxbQI91DpSw7YIeoKIbFJguN4uh2G	2015-02-04 19:16:25.428014	2015-04-13 18:16:28.775859	2AO3GQ32Yt-o3MbSK4p_1A	DEVENDRA-BANHART-32.jpg	image/jpeg	51944	2015-04-13 18:16:28.628939
10	melany_kshlerin@hahnmarquardt.org	Billy Rau	$2a$10$WFeqnJeyAR5cwEhyk5b6e.9aKYyXDLCzEHojBAZLPHN9pPWLcJnxC	2015-02-17 19:16:37.402028	2015-04-13 18:16:40.22025	cOGAq__FAIeIbKNzG5sC5g	21021209-37385753.jpg	image/jpeg	17804	2015-04-13 18:16:39.99783
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: appacademy
--

SELECT pg_catalog.setval('users_id_seq', 10, true);


--
-- Name: band_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy; Tablespace: 
--

ALTER TABLE ONLY band_tags
    ADD CONSTRAINT band_tags_pkey PRIMARY KEY (id);


--
-- Name: bands_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy; Tablespace: 
--

ALTER TABLE ONLY bands
    ADD CONSTRAINT bands_pkey PRIMARY KEY (id);


--
-- Name: blog_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy; Tablespace: 
--

ALTER TABLE ONLY blog_tags
    ADD CONSTRAINT blog_tags_pkey PRIMARY KEY (id);


--
-- Name: blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy; Tablespace: 
--

ALTER TABLE ONLY blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: song_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy; Tablespace: 
--

ALTER TABLE ONLY song_tags
    ADD CONSTRAINT song_tags_pkey PRIMARY KEY (id);


--
-- Name: songs_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy; Tablespace: 
--

ALTER TABLE ONLY songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: user_blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy; Tablespace: 
--

ALTER TABLE ONLY user_blogs
    ADD CONSTRAINT user_blogs_pkey PRIMARY KEY (id);


--
-- Name: user_follows_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy; Tablespace: 
--

ALTER TABLE ONLY user_follows
    ADD CONSTRAINT user_follows_pkey PRIMARY KEY (id);


--
-- Name: user_songs_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy; Tablespace: 
--

ALTER TABLE ONLY user_songs
    ADD CONSTRAINT user_songs_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: appacademy; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_comments_on_commentable_id_and_commentable_type; Type: INDEX; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE INDEX index_comments_on_commentable_id_and_commentable_type ON comments USING btree (commentable_id, commentable_type);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_songs_on_band_id; Type: INDEX; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE INDEX index_songs_on_band_id ON songs USING btree (band_id);


--
-- Name: index_songs_on_blog_id; Type: INDEX; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE INDEX index_songs_on_blog_id ON songs USING btree (blog_id);


--
-- Name: index_user_songs_on_user_id_and_song_id; Type: INDEX; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE UNIQUE INDEX index_user_songs_on_user_id_and_song_id ON user_songs USING btree (user_id, song_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: appacademy; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: appacademy
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM appacademy;
GRANT ALL ON SCHEMA public TO appacademy;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

