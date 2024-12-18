--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg120+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-1.pgdg120+1)

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
-- Name: brewery; Type: TABLE; Schema: public; Owner: cf_user
--

CREATE TABLE public.brewery (
    name character varying,
    city character varying,
    state character varying,
    country character varying,
    id integer NOT NULL
);


ALTER TABLE public.brewery OWNER TO cf_user;

--
-- Name: brewery_id_seq; Type: SEQUENCE; Schema: public; Owner: cf_user
--

CREATE SEQUENCE public.brewery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brewery_id_seq OWNER TO cf_user;

--
-- Name: brewery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cf_user
--

ALTER SEQUENCE public.brewery_id_seq OWNED BY public.brewery.id;


--
-- Name: cidade; Type: TABLE; Schema: public; Owner: cf_user
--

CREATE TABLE public.cidade (
    id integer NOT NULL,
    nome character varying(120) DEFAULT NULL::character varying,
    id_estado integer,
    capital integer DEFAULT 0,
    codigo character varying(500) DEFAULT NULL::character varying,
    status character varying(5) DEFAULT '0'::character varying,
    token character varying(255),
    deleted character varying(5) DEFAULT '0'::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.cidade OWNER TO cf_user;

--
-- Name: cidades_id_seq; Type: SEQUENCE; Schema: public; Owner: cf_user
--

CREATE SEQUENCE public.cidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cidades_id_seq OWNER TO cf_user;

--
-- Name: cidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cf_user
--

ALTER SEQUENCE public.cidades_id_seq OWNED BY public.cidade.id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: cf_user
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    phone character varying(20),
    address text,
    city character varying(100),
    postal_code character varying(20),
    country character varying(100),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    deleted integer DEFAULT 0,
    estado integer
);


ALTER TABLE public.customer OWNER TO cf_user;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: cf_user
--

CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO cf_user;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cf_user
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- Name: estado; Type: TABLE; Schema: public; Owner: cf_user
--

CREATE TABLE public.estado (
    id integer NOT NULL,
    name character varying(75) DEFAULT NULL::character varying,
    uf character varying(5) DEFAULT NULL::character varying,
    deleted character varying(5) DEFAULT '0'::character varying,
    status character varying(5) DEFAULT '0'::character varying
);


ALTER TABLE public.estado OWNER TO cf_user;

--
-- Name: estados_id_seq; Type: SEQUENCE; Schema: public; Owner: cf_user
--

CREATE SEQUENCE public.estados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estados_id_seq OWNER TO cf_user;

--
-- Name: estados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cf_user
--

ALTER SEQUENCE public.estados_id_seq OWNED BY public.estado.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: cf_user
--

CREATE TABLE public.menus (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    parent_id integer,
    icon character varying(50),
    order_ integer DEFAULT 0,
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.menus OWNER TO cf_user;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: cf_user
--

CREATE SEQUENCE public.menus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_id_seq OWNER TO cf_user;

--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cf_user
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: cf_user
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    price numeric(10,2) NOT NULL,
    quantity integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted integer
);


ALTER TABLE public.product OWNER TO cf_user;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: cf_user
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO cf_user;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cf_user
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.product.id;


--
-- Name: brewery id; Type: DEFAULT; Schema: public; Owner: cf_user
--

ALTER TABLE ONLY public.brewery ALTER COLUMN id SET DEFAULT nextval('public.brewery_id_seq'::regclass);


--
-- Name: cidade id; Type: DEFAULT; Schema: public; Owner: cf_user
--

ALTER TABLE ONLY public.cidade ALTER COLUMN id SET DEFAULT nextval('public.cidades_id_seq'::regclass);


--
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: cf_user
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- Name: estado id; Type: DEFAULT; Schema: public; Owner: cf_user
--

ALTER TABLE ONLY public.estado ALTER COLUMN id SET DEFAULT nextval('public.estados_id_seq'::regclass);


--
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: cf_user
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: cf_user
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: brewery; Type: TABLE DATA; Schema: public; Owner: cf_user
--

COPY public.brewery (name, city, state, country, id) FROM stdin;
3434	434	34	43	1
3434	434	34	43	2
3434	434	34	43	3
3434	434	34	43	4
34342	434	34	43	5
34342	434	34	43	6
34342	434	34	43	7
34342	434	34	43	8
34342	434	34	43	9
wew	ew	ew	ewe	10
ew	ew	ew	ew	11
\.


--
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: cf_user
--

COPY public.cidade (id, nome, id_estado, capital, codigo, status, token, deleted, created_at, updated_at) FROM stdin;
1	Afonso Cláudio	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
2	Água Doce do Norte	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
3	Águia Branca	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
4	Alegre	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
5	Alfredo Chaves	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
6	Alto Rio Novo	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
7	Anchieta	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
8	Apiacá	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
9	Aracruz	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
10	Atilio Vivacqua	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
11	Baixo Guandu	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
12	Barra de São Francisco	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
13	Boa Esperança	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
14	Bom Jesus do Norte	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
15	Brejetuba	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
16	Cachoeiro de Itapemirim	8	0	\N	0	\N	0	2023-06-29 14:24:19	\N
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: cf_user
--

COPY public.customer (customer_id, first_name, last_name, email, phone, address, city, postal_code, country, created_at, updated_at, deleted, estado) FROM stdin;
1	John	Doe	johndoe@example.com	1234567890	123 Main St	Anytown	12345	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
2	Jane	Smith	janesmith@example.com	0987654321	456 Elm St	Othertown	67890	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
3	Michael	Johnson	michaelj@example.com	1112233445	789 Pine St	Smalltown	13579	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
4	Emily	Davis	emilydavis@example.com	2233445566	101 Maple St	Bigcity	24680	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
5	William	Miller	wmiller@example.com	3344556677	202 Oak St	Hometown	34561	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
6	Olivia	Wilson	oliviaw@example.com	4455667788	303 Birch St	Riverside	45672	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
7	James	Moore	jamesm@example.com	5566778899	404 Cedar St	Lakeside	56783	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
8	Ava	Taylor	avataylor@example.com	6677889900	505 Pine St	Seaside	67894	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
9	Liam	Anderson	liamanderson@example.com	7788990011	606 Elm St	Mountainview	78905	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
10	Sophia	Thomas	sophiathomas@example.com	8899001122	707 Willow St	Clearwater	89016	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
11	Mason	Jackson	masonj@example.com	9900112233	808 Ash St	Fairview	90127	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
12	Isabella	White	isabellawhite@example.com	1011223344	909 Maple St	Brooklyn	01238	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
13	Ethan	Harris	ethanharris@example.com	1122334455	1010 Cedar St	Harrison	12349	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
14	Mia	Martin	miamartin@example.com	2233445566	1122 Pine St	Sunnydale	23450	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
15	Alexander	Thompson	alexanderthompson@example.com	3344556677	2233 Birch St	Westview	34561	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
16	Charlotte	Garcia	charlottegarcia@example.com	4455667788	3344 Cedar St	Southport	45672	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
17	Benjamin	Martinez	benjaminmartinez@example.com	5566778899	4455 Oak St	Northfield	56783	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
18	Amelia	Roberts	ameliaroberts@example.com	6677889900	5566 Pine St	Springdale	67894	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
19	Elijah	Clark	elijahclark@example.com	7788990011	6677 Maple St	Parkside	78905	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
20	Harper	Rodriguez	harperrodriguez@example.com	8899001122	7788 Birch St	Oakdale	89016	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
21	Daniel	Lewis	daniell@example.com	9900112233	8899 Cedar St	Lakeview	90127	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
22	Chloe	Lee	chloelee@example.com	1011223344	9900 Willow St	Riverside	01238	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
23	Lucas	Walker	lucaswalker@example.com	1122334455	10111 Elm St	Greenfield	12349	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
24	Lily	Young	lilyyoung@example.com	2233445566	11222 Pine St	Valleyview	23450	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
25	Henry	King	henryking@example.com	3344556677	22333 Oak St	Clearview	34561	Country	2024-12-12 18:35:43.097108	2024-12-12 18:35:43.097108	0	\N
\.


--
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: cf_user
--

COPY public.estado (id, name, uf, deleted, status) FROM stdin;
1	Acre	AC	0	0
2	Alagoas	AL	0	0
3	Amazonas	AM	0	0
4	Amapá	AP	0	0
5	Bahia	BA	0	0
6	Ceará	CE	0	0
7	Distrito Federal	DF	0	0
8	Espírito Santo	ES	0	0
9	Goiás	GO	0	0
10	Maranhão	MA	0	0
11	Minas Gerais	MG	0	0
12	Mato Grosso do Sul	MS	0	0
13	Mato Grosso	MT	0	0
14	Pará	PA	0	0
15	Paraíba	PB	0	0
16	Pernambuco	PE	0	0
17	Piauí	PI	0	0
18	Paraná	PR	0	0
19	Rio de Janeiro	RJ	0	0
20	Rio Grande do Norte	RN	0	0
21	Rondônia	RO	0	0
22	Roraima	RR	0	0
23	Rio Grande do Sul	RS	0	0
24	Santa Catarina	SC	0	0
25	Sergipe	SE	0	0
26	São Paulo	SP	0	0
27	Tocantins	TO	0	0
\.


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: cf_user
--

COPY public.menus (id, name, url, parent_id, icon, order_, is_active, created_at, updated_at) FROM stdin;
1	Dashboard	dashboard	\N	home	1	t	2024-12-12 18:41:19.798917	2024-12-12 18:41:19.798917
2	Orders	order	\N	file	2	t	2024-12-12 18:41:19.798917	2024-12-12 18:41:19.798917
3	Products	product	\N	shopping-cart	3	t	2024-12-12 18:41:19.798917	2024-12-12 18:41:19.798917
4	Customers	customer	\N	users	4	t	2024-12-12 18:41:19.798917	2024-12-12 18:41:19.798917
5	Reports	report	\N	bar-chart-2	5	t	2024-12-12 18:41:19.798917	2024-12-12 18:41:19.798917
6	Integrations	\tintegration	\N	layers	6	t	2024-12-12 18:41:19.798917	2024-12-12 18:41:19.798917
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: cf_user
--

COPY public.product (id, name, description, price, quantity, created_at, updated_at, deleted) FROM stdin;
1	Smartphone X1	Smartphone com tela AMOLED, 128GB de armazenamento e 6GB de RAM	799.99	150	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
2	Laptop UltraBook	Laptop ultrafino com processador i7, 16GB de RAM e 512GB SSD	1499.99	50	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
4	Smartwatch Pro	Relógio inteligente com monitoramento de saúde e GPS	299.99	75	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
5	Câmera DSLR 18-55mm	Câmera digital com lente 18-55mm e capacidade de gravação em 4K	999.99	30	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
6	Teclado Mecânico RGB	Teclado mecânico com retroiluminação RGB e switches mecânicos	129.99	120	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
7	Mouse Gamer X	Mouse gamer com 16000 DPI e design ergonômico	69.99	150	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
8	Monitor 24 polegadas	Monitor Full HD de 24 polegadas com taxa de atualização de 75Hz	179.99	100	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
9	Cadeira Ergonômica	Cadeira de escritório ergonômica com apoio lombar ajustável	299.99	60	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
11	Notebook Inspiron 15	Notebook com processador i5, 8GB de RAM e 1TB HDD	599.99	40	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
12	Impressora Multifuncional	Impressora a jato de tinta multifuncional com Wi-Fi	89.99	110	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
13	Geladeira Smart	Geladeira com conectividade Wi-Fi e monitoramento remoto	1199.99	25	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
15	Micro-ondas Digital	Micro-ondas com painel digital e função de descongelamento	129.99	70	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
17	Smartphone Y2	Smartphone com câmera de 64MP, 128GB de armazenamento	699.99	200	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
19	Ventilador de Torre	Ventilador de torre com 3 velocidades e controle remoto	59.99	150	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
20	Batedeira Planetária	Batedeira com 5 velocidades e tigela de 4L	149.99	90	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
21	Cafeteira Expresso	Cafeteira expresso com cápsulas e controle de temperatura	89.99	120	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	\N
22	ewe	ew	22.00	2	2024-12-17 21:33:23.617597	2024-12-17 21:33:23.617597	\N
24	wrewr	rrwe14w	12.00	333	2024-12-17 21:34:47.0677	2024-12-17 21:34:47.0677	\N
25	wrewr	rrwe14w	12.00	333	2024-12-17 21:35:45.340667	2024-12-17 21:35:45.340667	\N
26	wrewr	rrwe14w	12.00	333	2024-12-17 21:36:22.843174	2024-12-17 21:36:22.843174	\N
27	wrewr	rrwe14w	12.00	333	2024-12-17 21:36:35.438081	2024-12-17 21:36:35.438081	\N
28	wrewr	rrwe14w	12.00	333	2024-12-17 21:36:37.953123	2024-12-17 21:36:37.953123	\N
29	wrewr	rrwe14w	12.00	333	2024-12-17 21:36:55.653019	2024-12-17 21:36:55.653019	\N
30	ds	ds	23.00	23	2024-12-17 21:37:05.170254	2024-12-17 21:37:05.170254	\N
18	Aspirador Robot	Aspirador de pó robotizado com mapeamento inteligente	199.99	50	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	1
23	ewe	ew	22.00	2	2024-12-17 21:33:43.463755	2024-12-17 21:33:43.463755	1
3	Fone de Ouvido Bluetooth	Fones de ouvido sem fio com cancelamento de ruído	199.99	200	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	1
16	Lâmpada LED Inteligente	Lâmpada LED inteligente com controle via aplicativo	19.99	300	2024-12-17 13:33:45.345766	2024-12-17 13:33:45.345766	1
31	Product 12	PRoduct this relation ship in 	12.00	1	2024-12-18 15:44:13.368451	2024-12-18 15:44:13.368451	\N
\.


--
-- Name: brewery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cf_user
--

SELECT pg_catalog.setval('public.brewery_id_seq', 11, true);


--
-- Name: cidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cf_user
--

SELECT pg_catalog.setval('public.cidades_id_seq', 16, true);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cf_user
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 25, true);


--
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cf_user
--

SELECT pg_catalog.setval('public.estados_id_seq', 27, true);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cf_user
--

SELECT pg_catalog.setval('public.menus_id_seq', 6, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cf_user
--

SELECT pg_catalog.setval('public.products_id_seq', 31, true);


--
-- Name: brewery brewery_pkey; Type: CONSTRAINT; Schema: public; Owner: cf_user
--

ALTER TABLE ONLY public.brewery
    ADD CONSTRAINT brewery_pkey PRIMARY KEY (id);


--
-- Name: customer customer_email_key; Type: CONSTRAINT; Schema: public; Owner: cf_user
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_email_key UNIQUE (email);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: cf_user
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: cf_user
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: product products_pkey; Type: CONSTRAINT; Schema: public; Owner: cf_user
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

