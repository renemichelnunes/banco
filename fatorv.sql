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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(100)
);


ALTER TABLE public.categories OWNER TO fatorv;

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_category_id_seq OWNER TO fatorv;

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    customer_name character varying(100),
    email character varying(100),
    state character varying(2)
);


ALTER TABLE public.customers OWNER TO fatorv;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO fatorv;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(100),
    category_id integer,
    price numeric,
    supplier_id integer
);


ALTER TABLE public.products OWNER TO fatorv;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO fatorv;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- Name: sales; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.sales (
    sales_id integer NOT NULL,
    date date,
    customer_id integer,
    seller_id integer,
    total_price numeric
);


ALTER TABLE public.sales OWNER TO fatorv;

--
-- Name: sales_items; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.sales_items (
    item_id integer NOT NULL,
    sales_id integer NOT NULL,
    product_id integer,
    quantity integer,
    price numeric
);


ALTER TABLE public.sales_items OWNER TO fatorv;

--
-- Name: sales_items_item_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.sales_items_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_items_item_id_seq OWNER TO fatorv;

--
-- Name: sales_items_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.sales_items_item_id_seq OWNED BY public.sales_items.item_id;


--
-- Name: sales_sales_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.sales_sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_sales_id_seq OWNER TO fatorv;

--
-- Name: sales_sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.sales_sales_id_seq OWNED BY public.sales.sales_id;


--
-- Name: sellers; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.sellers (
    seller_id integer NOT NULL,
    seller_name character varying(100),
    email character varying(100),
    state character varying(2),
    tx_commission integer
);


ALTER TABLE public.sellers OWNER TO fatorv;

--
-- Name: sellers_seller_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.sellers_seller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sellers_seller_id_seq OWNER TO fatorv;

--
-- Name: sellers_seller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.sellers_seller_id_seq OWNED BY public.sellers.seller_id;


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: fatorv
--

CREATE TABLE public.suppliers (
    supplier_id integer NOT NULL,
    supplier_name character varying(100),
    email character varying(100),
    state character varying(50)
);


ALTER TABLE public.suppliers OWNER TO fatorv;

--
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: fatorv
--

CREATE SEQUENCE public.suppliers_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suppliers_supplier_id_seq OWNER TO fatorv;

--
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fatorv
--

ALTER SEQUENCE public.suppliers_supplier_id_seq OWNED BY public.suppliers.supplier_id;


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: sales sales_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.sales ALTER COLUMN sales_id SET DEFAULT nextval('public.sales_sales_id_seq'::regclass);


--
-- Name: sales_items item_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.sales_items ALTER COLUMN item_id SET DEFAULT nextval('public.sales_items_item_id_seq'::regclass);


--
-- Name: sellers seller_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.sellers ALTER COLUMN seller_id SET DEFAULT nextval('public.sellers_seller_id_seq'::regclass);


--
-- Name: suppliers supplier_id; Type: DEFAULT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN supplier_id SET DEFAULT nextval('public.suppliers_supplier_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.categories (category_id, category_name) FROM stdin;
1	Electronics
2	Clothing
3	Books
4	Home Appliances
5	Toys
6	Furniture
7	Sports
8	Beauty
9	Food
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.customers (customer_id, customer_name, email, state) FROM stdin;
1	John Doe	john@example.com	CA
2	Jane Smith	jane@example.com	NY
3	Michael Johnson	michael@example.com	TX
4	Emily Davis	emily@example.com	FL
5	David Brown	david@example.com	WA
6	Robert Miller	robert@example.com	CA
7	Mary Wilson	mary@example.com	TX
8	Sarah Martinez	sarah@example.com	NY
9	James Taylor	james@example.com	FL
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.products (product_id, product_name, category_id, price, supplier_id) FROM stdin;
1	Smartphone	1	800.00	1
2	Jeans	2	50.00	2
3	Mystery Novel	3	20.00	3
4	Microwave Oven	4	150.00	4
5	Remote Control Car	5	30.00	5
6	Office Chair	6	120.00	6
7	Basketball	7	25.00	7
8	Lipstick	8	10.00	8
9	Pizza	9	12.00	9
\.


--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.sales (sales_id, date, customer_id, seller_id, total_price) FROM stdin;
1	2023-05-15	1	1	700.00
2	2023-05-15	2	2	70.00
3	2023-05-15	3	3	180.00
4	2023-05-15	4	4	250.00
5	2023-05-15	5	5	90.00
6	2022-08-20	6	6	480.00
7	2022-08-20	7	7	160.00
8	2022-08-20	8	8	150.00
9	2022-08-20	9	9	36.00
\.


--
-- Data for Name: sales_items; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.sales_items (item_id, sales_id, product_id, quantity, price) FROM stdin;
1	1	1	1	800.00
2	1	2	2	50.00
1	2	6	1	120.00
2	2	7	3	25.00
3	2	8	2	10.00
4	2	9	3	12.00
5	2	1	1	15.00
1	3	2	2	22.00
2	3	3	1	8.00
1	4	7	1	25.00
2	4	8	2	20.00
3	4	9	1	15.00
4	4	1	2	12.00
1	5	3	1	50.00
1	6	8	1	30.00
2	6	9	2	40.00
3	6	1	1	50.00
1	7	4	1	25.00
2	7	5	2	20.00
3	7	6	1	15.00
4	7	7	2	12.00
1	8	9	1	45.00
2	8	1	2	35.00
1	9	5	1	38.00
2	9	6	2	45.00
3	9	7	1	52.00
4	9	8	2	60.00
5	9	9	3	72.00
\.


--
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.sellers (seller_id, seller_name, email, state, tx_commission) FROM stdin;
1	Best Electronics	best@example.com	CA	10
2	Fashion House	fashion@example.com	NY	12
3	Book Emporium	books@example.com	TX	15
4	Tech Universe	tech@example.com	CA	11
5	Style Center	style@example.com	FL	13
6	Furniture Haven	furniture@example.com	WA	14
7	Sports Emporium	sports@example.com	CA	10
8	Beauty Trends	beauty@example.com	NY	12
9	Food Paradise	food@example.com	TX	15
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: fatorv
--

COPY public.suppliers (supplier_id, supplier_name, email, state) FROM stdin;
1	Tech Supplies Inc.	tech@example.com	CA
2	Fashion Trends Ltd.	fashiontrends@example.com	NY
3	Book Haven	bookhaven@example.com	TX
4	Appliance World	appliances@example.com	FL
5	Toy Kingdom	toys@example.com	CA
6	Furniture Warehouse	furniture@example.com	WA
7	Sports Suppliers	sports@example.com	TX
8	Beauty Supplies	beauty@example.com	NY
9	Food Distributors	food@example.com	FL
\.


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 9, true);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 9, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.products_product_id_seq', 9, true);


--
-- Name: sales_items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.sales_items_item_id_seq', 1, false);


--
-- Name: sales_sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.sales_sales_id_seq', 9, true);


--
-- Name: sellers_seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.sellers_seller_id_seq', 9, true);


--
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fatorv
--

SELECT pg_catalog.setval('public.suppliers_supplier_id_seq', 9, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: sales_items sales_items_pkey; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.sales_items
    ADD CONSTRAINT sales_items_pkey PRIMARY KEY (item_id, sales_id);


--
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sales_id);


--
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (seller_id);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- Name: products products_supplier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id);


--
-- Name: sales sales_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: sales_items sales_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.sales_items
    ADD CONSTRAINT sales_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: sales_items sales_items_sales_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.sales_items
    ADD CONSTRAINT sales_items_sales_id_fkey FOREIGN KEY (sales_id) REFERENCES public.sales(sales_id);


--
-- Name: sales sales_seller_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: fatorv
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.sellers(seller_id);


--
-- PostgreSQL database dump complete
--

