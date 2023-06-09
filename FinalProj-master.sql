--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-06 21:28:04

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
-- TOC entry 214 (class 1259 OID 16399)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16402)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16403)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16406)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.image ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16407)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp without time zone,
    number character varying(255),
    price real NOT NULL,
    status integer,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16410)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16411)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(50),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16416)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16417)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time_of_created timestamp without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16423)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16426)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16427)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3361 (class 0 OID 16399)
-- Dependencies: 214
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (4, 'voodoo');
INSERT INTO public.category (id, name) VALUES (3, 'axe');
INSERT INTO public.category (id, name) VALUES (2, 'belt');
INSERT INTO public.category (id, name) VALUES (1, 'knife');


--
-- TOC entry 3363 (class 0 OID 16403)
-- Dependencies: 216
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (31, '18ae6d54-7ec6-43a5-b962-bb26dd7ce1d0.V9Rv1WLjeL4.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, 'd19d93a0-6bf6-4673-af74-38d9484e3fdd.tMLvoMOPi8g.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, '3e3c3fb1-bdaf-4c49-b73f-250cd7f5aa2c.lq8mBt1a0zM.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, '09494f10-fbee-4d78-b1f4-8289416778c2.iZfuj8IiTBE.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, '6d72914d-7c4e-464f-8906-97f02b8923aa.yRqnOtxnZyY.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, '142c5310-398b-4c75-be0c-f17e8d663bff.6UR9-UQJ_DM.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, '86a35d8c-34d1-4597-9f46-009baf1595c8.1AjIivi9fB8.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, 'c0f273e6-ffa1-4c0b-b8f3-c30bbb1cbc93.kpfOgzHnS0U.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, '987b22f0-1183-4aed-9c07-3b5657c8768e.hpShf-AsX4M.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, '8b618723-d731-4fc6-aef3-119c26229ffd._QfsExIuSTo.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (46, '62078c7f-d41f-4018-9732-35c8aeceb4b2.UydLBqA-dy0.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (47, 'fcf6ad52-dd31-4e1e-9998-795885611108.7Zecn60CxLk.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (48, '0236c32f-f32a-4dc3-a57b-3c394a439770.bPGYuKGUiqs.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (49, 'a248c095-c2ba-4ede-95de-b65b06a87351.d8-rD_1YCIA.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (50, '3240912c-8cee-4029-ab23-e4a52c758521.WfkJTnUBkmI.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (51, 'acf12d72-7ce5-4144-af8c-46a2b0323663.5WFQ0mejK6E.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (52, 'e7cf9e98-5e14-4423-80a5-bc60873ccbb1.eRI59rqLfdM.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (53, 'cf6f2412-f935-4e49-9683-ec7b4b71cee6.j3-zj_43Bv8.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (54, 'de4ae12c-9b27-48b8-bf55-e3220192eab0.SWFauCOEw_M.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (55, '2d28d715-928a-40fc-81e1-11c84182762d.yD6I6FyewWk.jpg', 11);
INSERT INTO public.image (id, file_name, product_id) VALUES (56, 'd8b5f0f6-7771-4918-9214-c1d10de0a4e8.CLVcgwo-aRo.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (57, 'd4dd4d49-330e-4713-b7fa-2ea2ddeb283a.wPIFP2Q0W8M.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (58, '119d9a73-6b37-4faf-84bd-0660ee6bd9a0.skmKut1X8MY.jpg', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (59, '3856e9c4-8690-4a6d-a03e-4c134557badb.', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (60, 'ca2e4dbf-ac9e-4cd6-8eb4-ef63a348f839.', 12);
INSERT INTO public.image (id, file_name, product_id) VALUES (61, 'ff71f0e6-5f34-4d03-8516-089275a202fa.eAOt8OKSJIc.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (62, '8a618d48-2f88-4df6-92f3-701354a4699c.IGfaNRFR4f4.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (63, '72d0ecfe-c1f4-4edb-a121-17497aa5271d.PWSdLP7k5Qw.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (64, '78bca29e-69c2-452f-9e60-e0463a804561.rP5LT9IFfeI.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (65, 'e51c0faf-ec89-49c4-9669-3804cc657ee0.SCiPCDQablc.jpg', 13);
INSERT INTO public.image (id, file_name, product_id) VALUES (66, '0ef2d700-7681-4eb6-83bf-16015d1c7825.EPCPpe2xhl0.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (67, 'd891827f-3bd8-43a5-806c-8099ecd143ab.Vr9GkPf4cMs.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (68, '489e0f6c-fa56-478d-a809-d86beaf6b9e9.y_2_SUk2ivU.jpg', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (69, '25307477-192d-4942-b647-648225eac60a.', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (70, 'ed5ae915-b17d-45a0-bea8-ed909799a61d.', 14);
INSERT INTO public.image (id, file_name, product_id) VALUES (71, 'e25afca3-2a14-42f3-92f8-d6af8d8053e4._3zkaE6R25o.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (72, '1ebb9bdc-a672-4ac3-8c63-8dc33b4c21fd.DPv1K2ZgEJ4.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (73, '16e4ce5d-edef-47a7-80b2-7dac279bf3a0.ffc6QzXOfjA.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (74, '4229c81b-268d-4c52-8a56-ae3d17625039.-H7je5iG0cs.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (75, 'c003ab34-1548-4410-8501-d35b92fd2a31.xv19TMQAZsI.jpg', 15);
INSERT INTO public.image (id, file_name, product_id) VALUES (76, 'dc777295-466c-4d90-8b7f-d5cf36d3bcb0.gXZXxj2DqT4.jpg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (77, '56bc6cce-1f63-4e7a-a156-c4e0368f8f85.8aAGZGCiNOM.jpg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (78, '97820e5c-9ed7-48d6-bbb3-93bc4a244ebe.OBxgWbMMD04.jpg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (79, 'ff4c1b55-7f17-4c4b-9d4a-762c6b3c0793.y1JMgBSgAQY.jpg', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (80, '0c4ef2ec-c9f8-4b23-85ac-bcc154fb94de.', 16);
INSERT INTO public.image (id, file_name, product_id) VALUES (81, 'c037cbef-4c52-4af8-bdd5-2ed48bd828c2.TUrim7NZxJM.jpg', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (82, 'e88bc9a3-187a-4214-87bc-c8e10ba7ab1e.qM58TDohKxQ.jpg', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (83, '901ce54c-a110-4ccb-820b-eef9b7813b7a.gtjnaKzCFts.jpg', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (84, '7824e37e-f383-4265-9e5f-87379d05998f.', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (85, 'c987bd7f-ab28-40d4-a63f-f472e455eb1b.', 17);
INSERT INTO public.image (id, file_name, product_id) VALUES (86, 'd94e07ea-d05f-4494-9e21-306b233c6b19.3-fFOV50yAY.jpg', 18);
INSERT INTO public.image (id, file_name, product_id) VALUES (87, '53400989-246f-4655-9d44-86afec5e6cea.53SK3-Hs2RA.jpg', 18);
INSERT INTO public.image (id, file_name, product_id) VALUES (88, '6beee260-eb74-41fc-855a-fa6a06829776.Cne0V_bVj9c.jpg', 18);
INSERT INTO public.image (id, file_name, product_id) VALUES (89, 'c71d1a33-150b-407d-9fa8-58113a422681.mj8Uxh-aBlQ.jpg', 18);
INSERT INTO public.image (id, file_name, product_id) VALUES (90, '2da8256a-cf78-456d-ba10-deb715ca57e0.iRDVDdVys7g.jpg', 18);
INSERT INTO public.image (id, file_name, product_id) VALUES (116, 'cc96456e-9cfb-42cf-8a2a-0918fc56452f.Чаки 1.jpg', 26);
INSERT INTO public.image (id, file_name, product_id) VALUES (117, '83f3e582-67e8-445c-849a-02ff16f144df.Чаки 2.jpg', 26);
INSERT INTO public.image (id, file_name, product_id) VALUES (118, '055105e5-92dd-496b-9195-4a5f6590120d.Чаки 3.jpg', 26);
INSERT INTO public.image (id, file_name, product_id) VALUES (119, 'b5c3d997-523b-44fe-affc-7625af99b9ee.Чаки 4.jpg', 26);
INSERT INTO public.image (id, file_name, product_id) VALUES (120, '58e9a3fb-bb13-4374-9da3-4de9cc226e1e.', 26);


--
-- TOC entry 3365 (class 0 OID 16407)
-- Dependencies: 218
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (3, 1, '2023-04-26 21:44:39.426796', 'f7d32aff-ce05-408d-82be-b37df70f5616', 5500, 0, 2, 17);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (4, 1, '2023-04-26 21:44:39.439783', 'f7d32aff-ce05-408d-82be-b37df70f5616', 8000, 1, 2, 14);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (5, 1, '2023-04-26 21:44:39.450775', 'f7d32aff-ce05-408d-82be-b37df70f5616', 4000, 0, 2, 18);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (7, 1, '2023-06-06 01:44:40.41843', '7a1c065a-8a36-4c73-8489-e7747ad782a3', 7500, 1, 6, 15);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (8, 1, '2023-06-06 01:44:40.442416', '7a1c065a-8a36-4c73-8489-e7747ad782a3', 40000, 1, 6, 9);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (9, 1, '2023-06-06 01:56:34.303821', '0bb65f0c-99c0-42c0-9255-f7a2ca1cf8b7', 13000, 1, 8, 10);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (10, 1, '2023-06-06 01:56:34.310815', '0bb65f0c-99c0-42c0-9255-f7a2ca1cf8b7', 7500, 0, 8, 15);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (6, 1, '2023-04-26 21:52:01.987175', '14ab96f2-f98f-433c-be74-16c7552db81a', 40000, 4, 2, 9);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 1, '2023-04-26 15:45:39.621388', 'd27792d4-3b90-40f7-8a0d-012a1dcf4d99', 5000, 3, 2, 7);


--
-- TOC entry 3367 (class 0 OID 16411)
-- Dependencies: 220
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (1, 'admin', '$2a$10$ZnOBpS2kI679xh3Ae9Y11uWWVQrOsVleRBy7PKqA3kOICs2J87gQK', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (3, 'seller', '$2a$10$X68Mr/.wz5Ne0dO0NoOeFOdnobfAAkw8R57fftv/iIMNrjvCtY5ve', 'ROLE_SELLER');
INSERT INTO public.person (id, login, password, role) VALUES (2, 'user1', '$2a$10$m9mlJFUyvsPKPs5JY.kaf.kWCE1MjtEOILT1Lfj253LFuPQa/GM0m', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (4, 'user2', '$2a$10$vWroDgY9j95W2ghGCG9H9umlYQdDk1uNMOI0z1/yeEHvQnQvo7fbO', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (5, 'user44', '$2a$10$aQV6Lc5wncwZ77VabOIV8ebYqPDhCm/lk1JrzVdtx/b.Ieoc02ZuO', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (6, 'User55', '$2a$10$3Oy4YEdHSxhyrxwPIMKmBeKrwRrCB9rIJb5KT3PYb4qCKTh3d2zjS', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (7, 'User66', '$2a$10$JH80I9tOEll.bB1VyKh9A.hPfemCrEc5zmIDt2xNpQI48Mtk3x7sy', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (8, 'User100', '$2a$10$N7ny639OVPbss8vOs/nbNuDQKsOVnptxsvxg.2yNjbOI4Rw0NeVbW', 'ROLE_SELLER');


--
-- TOC entry 3369 (class 0 OID 16417)
-- Dependencies: 222
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (14, '2023-04-26 03:00:00.364683', 'Топорище из дерева Ясень
Длина ручки 48 см
Высота клинка 18 см
Длина режущей кромки 13 см
Сплав УГЛЕРОД+ХВГ (58-59 единиц)', 8000, 'Василий', 'Топор "Летучая мышь."', 'Ворсма', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (15, '2023-04-26 03:04:20.396837', 'Тяпка- цельнометаллическая.
Сталь 95Х18
Рукоять граб, сопеле', 7500, 'Василий', 'Тяпка- цельнометаллическая.', 'Павлово', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (16, '2023-04-26 03:11:11.270929', 'Рабочий топор.
Топорище из дерева Ясень
Длина ручки 50 см
Высота клинка 18 см
Длина режущей кромки 13 см
Сплав УГЛЕРОД+ХВГ (58-59 единиц)', 6000, 'Василий', 'Топор Витязь', 'Павлово', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (17, '2023-04-26 03:20:27.327553', 'Топорище из термоясени
Длина ручки 22 см
Высота клинка 15 см
Длина режущей кромки 9см
Сплав УГЛЕРОД+ХВГ (58-59 единиц)', 5500, 'Василий', 'Турист', 'Павлово', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (18, '2023-04-26 18:13:10.225606', 'Нож для тестов приложения', 4000, 'Владимир', 'Тестовый Н_1', 'Жуковский', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (7, NULL, 'Материал клинка - кованая нержавеющая сталь 95х18, твердость 58HRC
Материал накладок рукояти -авторская микарта
Нож комплектуется ножнами из натуральной кожи для ношения на шее
Общая длина -130 мм
Длина клинка -70 мм
Длина рукояти -60 мм
Ширина клинка(max) - 23 мм
Толщина клинка(max) - 2,3 мм
Толщина рукояти(max) - 16 мм', 5000, 'Андрей', 'Канадец-см', 'Ворсма', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (10, NULL, 'Клинок - х12мф, рукоять - стабилизированный рог лося, проставки - латунь и фибра, ножны - натуральная кожа. По рукояти и ножнам выполнено выжигание вручную.', 13000, 'Андрей', 'Нож кованый Крабы-рыбы', 'Ворсма', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (9, NULL, 'Клинок - СУПЕР!!!: BÖHLER K100 в обкладках из 65Г и У10 через никель
Больстер - мозаичный дамаск с никелем.
Рукоять - рог лося, по рукояти выполнена объемная резьба с последующей колеровкой
Ножны - кожа растительного дубления, тиснение', 40000, 'Алена', 'Нож «Тролли»', 'Ворсма', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (11, NULL, '«И эскимосские колдуны, и болотные жрецы из Луизианы пели, обращаясь к внешне сходным идолам, следующее: «Пх’нглуи мглв’нафх Ктулху Р’льех вгах’нагл фхтагн» («В своем доме в Р’льехе мертвый Ктулху спит, ожидая своего часа»).»
', 10000, 'Кличко', 'Ктулху Супер!', 'Павлово', 4);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (12, NULL, 'Чумной Доктор из натуральной кожи / ручная работа /кукла / фигурка 20см', 5000, 'Доктор Кто', 'Доктор Чумной!!!!', 'Павлово', 4);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (13, NULL, 'Кукла Вуду ', 5000, 'Анастасия мать', 'дети цветы жизни!', 'Павлово', 4);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (26, '2023-06-06 02:34:56.12827', 'Очень плохая кукла', 20000, 'Кто-то нехороший', 'Чаки', 'Пушкин', 4);


--
-- TOC entry 3370 (class 0 OID 16423)
-- Dependencies: 223
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 215
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 4, true);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 217
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 120, true);


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 219
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 10, true);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 221
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 8, true);


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 30, true);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 225
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 26, true);


--
-- TOC entry 3200 (class 2606 OID 16429)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 2606 OID 16431)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 16433)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 16435)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 16437)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 16439)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 16441)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3214 (class 2606 OID 16442)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3216 (class 2606 OID 16447)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3215 (class 2606 OID 16452)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3213 (class 2606 OID 16457)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3217 (class 2606 OID 16462)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3218 (class 2606 OID 16467)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2023-06-06 21:28:04

--
-- PostgreSQL database dump complete
--

