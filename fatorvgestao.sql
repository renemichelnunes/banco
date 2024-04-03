--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6 (Ubuntu 15.6-0ubuntu0.23.10.1)
-- Dumped by pg_dump version 15.6 (Ubuntu 15.6-0ubuntu0.23.10.1)

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
-- Name: fatorvgestao; Type: DATABASE; Schema: -; Owner: fatorv
--

CREATE DATABASE fatorvgestao WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'pt_BR.UTF-8';


ALTER DATABASE fatorvgestao OWNER TO fatorv;

\connect fatorvgestao

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
-- Name: dim_categories; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.dim_categories (
    category_id numeric(4,0) NOT NULL,
    category_name character varying(100) NOT NULL
);


ALTER TABLE public.dim_categories OWNER TO fatorv;

--
-- Name: dim_categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.dim_categories_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_categories_category_id_seq OWNER TO fatorv;

--
-- Name: dim_categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.dim_categories_category_id_seq OWNED BY public.dim_categories.category_id;


--
-- Name: dim_customers; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.dim_customers (
    customer_id numeric(4,0) NOT NULL,
    customer_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    state_id numeric(4,0) NOT NULL
);


ALTER TABLE public.dim_customers OWNER TO fatorv;

--
-- Name: dim_customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.dim_customers_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_customers_customer_id_seq OWNER TO fatorv;

--
-- Name: dim_customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.dim_customers_customer_id_seq OWNED BY public.dim_customers.customer_id;


--
-- Name: dim_date; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.dim_date (
    date_id numeric(4,0) NOT NULL,
    date numeric(8,0) NOT NULL,
    year numeric(4,0) NOT NULL,
    month numeric(2,0) NOT NULL,
    quarter numeric(1,0) NOT NULL,
    day numeric(2,0) NOT NULL
);


ALTER TABLE public.dim_date OWNER TO fatorv;

--
-- Name: dim_date_date_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.dim_date_date_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_date_date_id_seq OWNER TO fatorv;

--
-- Name: dim_date_date_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.dim_date_date_id_seq OWNED BY public.dim_date.date_id;


--
-- Name: dim_products; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.dim_products (
    product_id numeric(4,0) NOT NULL,
    product_name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.dim_products OWNER TO fatorv;

--
-- Name: dim_products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.dim_products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_products_product_id_seq OWNER TO fatorv;

--
-- Name: dim_products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.dim_products_product_id_seq OWNED BY public.dim_products.product_id;


--
-- Name: dim_sellers; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.dim_sellers (
    seller_id numeric(4,0) NOT NULL,
    seller_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    tx_commission numeric(2,0) NOT NULL,
    state_id numeric(2,0) NOT NULL
);


ALTER TABLE public.dim_sellers OWNER TO fatorv;

--
-- Name: dim_sellers_seller_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.dim_sellers_seller_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_sellers_seller_id_seq OWNER TO fatorv;

--
-- Name: dim_sellers_seller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.dim_sellers_seller_id_seq OWNED BY public.dim_sellers.seller_id;


--
-- Name: dim_states; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.dim_states (
    state_id numeric(4,0) NOT NULL,
    state_acronym character varying(2) NOT NULL,
    state_code character varying(5) NOT NULL,
    state_name character varying(100) NOT NULL,
    region_id numeric(4,0) NOT NULL,
    region_acronym character varying(2) NOT NULL,
    region_name character varying(100) NOT NULL
);


ALTER TABLE public.dim_states OWNER TO fatorv;

--
-- Name: dim_states_state_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.dim_states_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_states_state_id_seq OWNER TO fatorv;

--
-- Name: dim_states_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.dim_states_state_id_seq OWNED BY public.dim_states.state_id;


--
-- Name: dim_suppliers; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.dim_suppliers (
    supplier_id numeric(4,0) NOT NULL,
    supplier_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    state_id numeric(4,0) NOT NULL
);


ALTER TABLE public.dim_suppliers OWNER TO fatorv;

--
-- Name: dim_suppliers_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.dim_suppliers_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_suppliers_supplier_id_seq OWNER TO fatorv;

--
-- Name: dim_suppliers_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.dim_suppliers_supplier_id_seq OWNED BY public.dim_suppliers.supplier_id;


--
-- Name: fato_sales_items; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.fato_sales_items (
    sales_id numeric(4,0) NOT NULL,
    product_id numeric(4,0) NOT NULL,
    date_id numeric(4,0) NOT NULL,
    customer_id numeric(4,0) NOT NULL,
    seller_id numeric(4,0) NOT NULL,
    total_price numeric(10,2) NOT NULL,
    supplier_id numeric(4,0) NOT NULL,
    state_id numeric(4,0) NOT NULL,
    category_id numeric(4,0) NOT NULL,
    quantity numeric(4,0) NOT NULL,
    sell_price numeric(10,2) NOT NULL,
    sub_total numeric(10,2) NOT NULL
);


ALTER TABLE public.fato_sales_items OWNER TO fatorv;

--
-- Name: fato_sales_items_product_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.fato_sales_items_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fato_sales_items_product_id_seq OWNER TO fatorv;

--
-- Name: fato_sales_items_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.fato_sales_items_product_id_seq OWNED BY public.fato_sales_items.product_id;


--
-- Name: fato_sales_items_sales_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.fato_sales_items_sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fato_sales_items_sales_id_seq OWNER TO fatorv;

--
-- Name: fato_sales_items_sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.fato_sales_items_sales_id_seq OWNED BY public.fato_sales_items.sales_id;


--
-- Name: dim_categories category_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.dim_categories ALTER COLUMN category_id SET DEFAULT nextval('public.dim_categories_category_id_seq'::regclass);


--
-- Name: dim_customers customer_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.dim_customers ALTER COLUMN customer_id SET DEFAULT nextval('public.dim_customers_customer_id_seq'::regclass);


--
-- Name: dim_date date_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.dim_date ALTER COLUMN date_id SET DEFAULT nextval('public.dim_date_date_id_seq'::regclass);


--
-- Name: dim_products product_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.dim_products ALTER COLUMN product_id SET DEFAULT nextval('public.dim_products_product_id_seq'::regclass);


--
-- Name: dim_sellers seller_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.dim_sellers ALTER COLUMN seller_id SET DEFAULT nextval('public.dim_sellers_seller_id_seq'::regclass);


--
-- Name: dim_states state_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.dim_states ALTER COLUMN state_id SET DEFAULT nextval('public.dim_states_state_id_seq'::regclass);


--
-- Name: dim_suppliers supplier_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.dim_suppliers ALTER COLUMN supplier_id SET DEFAULT nextval('public.dim_suppliers_supplier_id_seq'::regclass);


--
-- Name: fato_sales_items sales_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.fato_sales_items ALTER COLUMN sales_id SET DEFAULT nextval('public.fato_sales_items_sales_id_seq'::regclass);


--
-- Name: fato_sales_items product_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.fato_sales_items ALTER COLUMN product_id SET DEFAULT nextval('public.fato_sales_items_product_id_seq'::regclass);


--
-- Data for Name: dim_categories; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.dim_categories (category_id, category_name) FROM stdin;
1	ELECTRONICS
2	CLOTHING
3	BOOKS
4	HOME APPLIANCES
5	TOYS
6	FURNITURE
7	SPORTS
8	BEAUTY
9	FOOD
\.


--
-- Data for Name: dim_customers; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.dim_customers (customer_id, customer_name, email, state_id) FROM stdin;
1	JOHN DOE	JOHN@EXAMPLE.COM	6
6	ROBERT MILLER	ROBERT@EXAMPLE.COM	6
4	EMILY DAVIS	EMILY@EXAMPLE.COM	12
9	JAMES TAYLOR	JAMES@EXAMPLE.COM	12
2	JANE SMITH	JANE@EXAMPLE.COM	36
8	SARAH MARTINEZ	SARAH@EXAMPLE.COM	36
3	MICHAEL JOHNSON	MICHAEL@EXAMPLE.COM	48
7	MARY WILSON	MARY@EXAMPLE.COM	48
5	DAVID BROWN	DAVID@EXAMPLE.COM	53
\.


--
-- Data for Name: dim_date; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.dim_date (date_id, date, year, month, quarter, day) FROM stdin;
1	20220820	2022	8	3	20
2	20230515	2023	5	2	15
\.


--
-- Data for Name: dim_products; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.dim_products (product_id, product_name, price) FROM stdin;
1	SMARTPHONE	800.00
2	JEANS	50.00
3	MYSTERY NOVEL	20.00
4	MICROWAVE OVEN	150.00
5	REMOTE CONTROL CAR	30.00
6	OFFICE CHAIR	120.00
7	BASKETBALL	25.00
8	LIPSTICK	10.00
9	PIZZA	12.00
\.


--
-- Data for Name: dim_sellers; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.dim_sellers (seller_id, seller_name, email, tx_commission, state_id) FROM stdin;
1	BEST ELECTRONICS	BEST@EXAMPLE.COM	10	6
4	TECH UNIVERSE	TECH@EXAMPLE.COM	11	6
7	SPORTS EMPORIUM	SPORTS@EXAMPLE.COM	10	6
5	STYLE CENTER	STYLE@EXAMPLE.COM	13	12
2	FASHION HOUSE	FASHION@EXAMPLE.COM	12	36
8	BEAUTY TRENDS	BEAUTY@EXAMPLE.COM	12	36
3	BOOK EMPORIUM	BOOKS@EXAMPLE.COM	15	48
9	FOOD PARADISE	FOOD@EXAMPLE.COM	15	48
6	FURNITURE HAVEN	FURNITURE@EXAMPLE.COM	14	53
\.


--
-- Data for Name: dim_states; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.dim_states (state_id, state_acronym, state_code, state_name, region_id, region_acronym, region_name) FROM stdin;
1	AL	US-AL	ALABAMA	1	SO	SOUTH
5	AR	US-AR	ARKANSAS	1	SO	SOUTH
12	FL	US-FL	FLORIDA	1	SO	SOUTH
13	GA	US-GA	GEORGIA	1	SO	SOUTH
21	KY	US-KY	KENTUCKY	1	SO	SOUTH
22	LA	US-LA	LOUISIANA	1	SO	SOUTH
24	MD	US-MD	MARYLAND	1	SO	SOUTH
28	MS	US-MS	MISSISSIPPI	1	SO	SOUTH
37	NC	US-NC	NORTH CAROLINA	1	SO	SOUTH
40	OK	US-OK	OKLAHOMA	1	SO	SOUTH
45	SC	US-SC	SOUTH CAROLINA	1	SO	SOUTH
47	TN	US-TN	TENNESSEE	1	SO	SOUTH
48	TX	US-TX	TEXAS	1	SO	SOUTH
51	VA	US-VA	VIRGINIA	1	SO	SOUTH
54	WV	US-WV	WEST VIRGINIA	1	SO	SOUTH
2	AK	US-AK	ALASKA	2	NO	NORTH
15	HI	US-HI	HAWAII	2	NO	NORTH
4	AZ	US-AZ	ARIZONA	3	O	WEST
6	CA	US-CA	CALIFORNIA	3	O	WEST
8	CO	US-CO	COLORADO	3	O	WEST
16	ID	US-ID	IDAHO	3	O	WEST
30	MT	US-MT	MONTANA	3	O	WEST
32	NV	US-NV	NEVADA	3	O	WEST
35	NM	US-NM	NEW MEXICO	3	O	WEST
41	OR	US-OR	OREGON	3	O	WEST
49	UT	US-UT	UTAH	3	O	WEST
53	WA	US-WA	WASHINGTON	3	O	WEST
56	WY	US-WY	WYOMING	3	O	WEST
9	CT	US-CT	CONNECTICUT	4	NE	NORTHEAST
10	DE	US-DE	DELAWARE	4	NE	NORTHEAST
11	DC	US-DC	WASHINGTON, D.C. DISTRICT OF COLUMBIA	4	NE	NORTHEAST
17	IL	US-IL	ILLINOIS	4	NE	NORTHEAST
18	IN	US-IN	INDIANA	4	NE	NORTHEAST
19	IA	US-IA	IOWA	4	NE	NORTHEAST
20	KS	US-KS	KANSAS	4	NE	NORTHEAST
23	ME	US-ME	MAINE	4	NE	NORTHEAST
25	MA	US-MA	MASSACHUSETTS	4	NE	NORTHEAST
26	MI	US-MI	MICHIGAN	4	NE	NORTHEAST
27	MN	US-MN	MINNESOTA	4	NE	NORTHEAST
29	MO	US-MO	MISSOURI	4	NE	NORTHEAST
31	NE	US-NE	NEBRASKA	4	NE	NORTHEAST
33	NH	US-NH	NEW HAMPSHIRE	4	NE	NORTHEAST
34	NJ	US-NJ	NEW JERSEY	4	NE	NORTHEAST
36	NY	US-NY	NEW YORK	4	NE	NORTHEAST
38	ND	US-ND	NORTH DAKOTA	4	NE	NORTHEAST
39	OH	US-OH	OHIO	4	NE	NORTHEAST
42	PA	US-PA	PENNSYLVANIA	4	NE	NORTHEAST
44	RI	US-RI	RHODE ISLAND	4	NE	NORTHEAST
46	SD	US-SD	SOUTH DAKOTA	4	NE	NORTHEAST
50	VT	US-VT	VERMONT	4	NE	NORTHEAST
55	WI	US-WI	WISCONSIN	4	NE	NORTHEAST
\.


--
-- Data for Name: dim_suppliers; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.dim_suppliers (supplier_id, supplier_name, email, state_id) FROM stdin;
1	TECH SUPPLIES INC.	TECH@EXAMPLE.COM	6
5	TOY KINGDOM	TOYS@EXAMPLE.COM	6
4	APPLIANCE WORLD	APPLIANCES@EXAMPLE.COM	12
9	FOOD DISTRIBUTORS	FOOD@EXAMPLE.COM	12
2	FASHION TRENDS LTD.	FASHIONTRENDS@EXAMPLE.COM	36
8	BEAUTY SUPPLIES	BEAUTY@EXAMPLE.COM	36
3	BOOK HAVEN	BOOKHAVEN@EXAMPLE.COM	48
7	SPORTS SUPPLIERS	SPORTS@EXAMPLE.COM	48
6	FURNITURE WAREHOUSE	FURNITURE@EXAMPLE.COM	53
\.


--
-- Data for Name: fato_sales_items; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.fato_sales_items (sales_id, product_id, date_id, customer_id, seller_id, total_price, supplier_id, state_id, category_id, quantity, sell_price, sub_total) FROM stdin;
1	1	2	1	1	900.00	1	6	1	1	800.00	800.00
1	2	2	1	1	900.00	2	36	2	2	50.00	100.00
2	1	2	2	2	266.00	1	6	1	1	15.00	15.00
2	6	2	2	2	266.00	6	53	6	1	120.00	120.00
2	7	2	2	2	266.00	7	48	7	3	25.00	75.00
2	8	2	2	2	266.00	8	36	8	2	10.00	20.00
2	9	2	2	2	266.00	9	12	9	3	12.00	36.00
3	2	2	3	3	52.00	2	36	2	2	22.00	44.00
3	3	2	3	3	52.00	3	48	3	1	8.00	8.00
4	1	2	4	4	104.00	1	6	1	2	12.00	24.00
4	7	2	4	4	104.00	7	48	7	1	25.00	25.00
4	8	2	4	4	104.00	8	36	8	2	20.00	40.00
4	9	2	4	4	104.00	9	12	9	1	15.00	15.00
5	3	2	5	5	50.00	3	48	3	1	50.00	50.00
6	1	1	6	6	160.00	1	6	1	1	50.00	50.00
6	8	1	6	6	160.00	8	36	8	1	30.00	30.00
6	9	1	6	6	160.00	9	12	9	2	40.00	80.00
7	4	1	7	7	104.00	4	12	4	1	25.00	25.00
7	5	1	7	7	104.00	5	6	5	2	20.00	40.00
7	6	1	7	7	104.00	6	53	6	1	15.00	15.00
7	7	1	7	7	104.00	7	48	7	2	12.00	24.00
8	1	1	8	8	115.00	1	6	1	2	35.00	70.00
8	9	1	8	8	115.00	9	12	9	1	45.00	45.00
9	5	1	9	9	516.00	5	6	5	1	38.00	38.00
9	6	1	9	9	516.00	6	53	6	2	45.00	90.00
9	7	1	9	9	516.00	7	48	7	1	52.00	52.00
9	8	1	9	9	516.00	8	36	8	2	60.00	120.00
9	9	1	9	9	516.00	9	12	9	3	72.00	216.00
\.


--
-- Name: dim_categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.dim_categories_category_id_seq', 1, false);


--
-- Name: dim_customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.dim_customers_customer_id_seq', 1, false);


--
-- Name: dim_date_date_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.dim_date_date_id_seq', 1, false);


--
-- Name: dim_products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.dim_products_product_id_seq', 1, false);


--
-- Name: dim_sellers_seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.dim_sellers_seller_id_seq', 1, false);


--
-- Name: dim_states_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.dim_states_state_id_seq', 1, false);


--
-- Name: dim_suppliers_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.dim_suppliers_supplier_id_seq', 1, false);


--
-- Name: fato_sales_items_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.fato_sales_items_product_id_seq', 1, false);


--
-- Name: fato_sales_items_sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.fato_sales_items_sales_id_seq', 1, false);


--
-- Name: dim_categories dim_categories_pk; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.dim_categories
    ADD CONSTRAINT dim_categories_pk PRIMARY KEY (category_id);


--
-- Name: dim_customers dim_customers_pk; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.dim_customers
    ADD CONSTRAINT dim_customers_pk PRIMARY KEY (customer_id);


--
-- Name: dim_date dim_date_pk; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.dim_date
    ADD CONSTRAINT dim_date_pk PRIMARY KEY (date_id);


--
-- Name: dim_products dim_products_pk; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.dim_products
    ADD CONSTRAINT dim_products_pk PRIMARY KEY (product_id);


--
-- Name: dim_sellers dim_sellers_pk; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.dim_sellers
    ADD CONSTRAINT dim_sellers_pk PRIMARY KEY (seller_id);


--
-- Name: dim_states dim_states_pk; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.dim_states
    ADD CONSTRAINT dim_states_pk PRIMARY KEY (state_id);


--
-- Name: dim_suppliers dim_suppliers_pk; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.dim_suppliers
    ADD CONSTRAINT dim_suppliers_pk PRIMARY KEY (supplier_id);


--
-- Name: fato_sales_items fato_sales_items_pk; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.fato_sales_items
    ADD CONSTRAINT fato_sales_items_pk PRIMARY KEY (sales_id, product_id);


--
-- Name: fato_sales_items dim_categories_fato_sales_items_fk; Type: FK CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.fato_sales_items
    ADD CONSTRAINT dim_categories_fato_sales_items_fk FOREIGN KEY (category_id) REFERENCES public.dim_categories(category_id);


--
-- Name: fato_sales_items dim_customers_dim_sales_items_fk; Type: FK CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.fato_sales_items
    ADD CONSTRAINT dim_customers_dim_sales_items_fk FOREIGN KEY (customer_id) REFERENCES public.dim_customers(customer_id);


--
-- Name: fato_sales_items dim_date_fato_sales_items_fk; Type: FK CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.fato_sales_items
    ADD CONSTRAINT dim_date_fato_sales_items_fk FOREIGN KEY (date_id) REFERENCES public.dim_date(date_id);


--
-- Name: fato_sales_items dim_products_fato_sales_items_fk; Type: FK CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.fato_sales_items
    ADD CONSTRAINT dim_products_fato_sales_items_fk FOREIGN KEY (product_id) REFERENCES public.dim_products(product_id);


--
-- Name: fato_sales_items dim_sellers_dim_sales_items_fk; Type: FK CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.fato_sales_items
    ADD CONSTRAINT dim_sellers_dim_sales_items_fk FOREIGN KEY (seller_id) REFERENCES public.dim_sellers(seller_id);


--
-- Name: fato_sales_items dim_states_dim_sales_items_fk; Type: FK CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.fato_sales_items
    ADD CONSTRAINT dim_states_dim_sales_items_fk FOREIGN KEY (state_id) REFERENCES public.dim_states(state_id);


--
-- Name: fato_sales_items dim_supplier_fato_sales_items_fk; Type: FK CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.fato_sales_items
    ADD CONSTRAINT dim_supplier_fato_sales_items_fk FOREIGN KEY (supplier_id) REFERENCES public.dim_suppliers(supplier_id);


--
-- PostgreSQL database dump complete
--

