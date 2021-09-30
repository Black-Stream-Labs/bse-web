--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.3

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
-- Name: aboutuses; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.aboutuses (
    id integer NOT NULL,
    title character varying(255),
    motto text,
    "extraContent" text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.aboutuses OWNER TO strapi;

--
-- Name: aboutuses_components; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.aboutuses_components (
    id integer NOT NULL,
    field character varying(255) NOT NULL,
    "order" integer NOT NULL,
    component_type character varying(255) NOT NULL,
    component_id integer NOT NULL,
    aboutus_id integer NOT NULL
);


ALTER TABLE public.aboutuses_components OWNER TO strapi;

--
-- Name: aboutuses_components_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.aboutuses_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aboutuses_components_id_seq OWNER TO strapi;

--
-- Name: aboutuses_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.aboutuses_components_id_seq OWNED BY public.aboutuses_components.id;


--
-- Name: aboutuses_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.aboutuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aboutuses_id_seq OWNER TO strapi;

--
-- Name: aboutuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.aboutuses_id_seq OWNED BY public.aboutuses.id;


--
-- Name: article_categories; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.article_categories (
    id integer NOT NULL,
    category character varying(255),
    slug character varying(255),
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.article_categories OWNER TO strapi;

--
-- Name: article_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.article_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_categories_id_seq OWNER TO strapi;

--
-- Name: article_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.article_categories_id_seq OWNED BY public.article_categories.id;


--
-- Name: article_tags; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.article_tags (
    id integer NOT NULL,
    tag_name character varying(255),
    slug character varying(255),
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.article_tags OWNER TO strapi;

--
-- Name: article_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.article_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_tags_id_seq OWNER TO strapi;

--
-- Name: article_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.article_tags_id_seq OWNED BY public.article_tags.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    title character varying(255),
    slug character varying(255),
    unpublish_date timestamp with time zone,
    description text,
    author integer,
    featured boolean,
    future_publish_date timestamp with time zone,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.articles OWNER TO strapi;

--
-- Name: articles_article_categories__article_categories_articles; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.articles_article_categories__article_categories_articles (
    id integer NOT NULL,
    "article-category_id" integer,
    article_id integer
);


ALTER TABLE public.articles_article_categories__article_categories_articles OWNER TO strapi;

--
-- Name: articles_article_categories__article_categories_articles_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.articles_article_categories__article_categories_articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_article_categories__article_categories_articles_id_seq OWNER TO strapi;

--
-- Name: articles_article_categories__article_categories_articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.articles_article_categories__article_categories_articles_id_seq OWNED BY public.articles_article_categories__article_categories_articles.id;


--
-- Name: articles_article_tags__article_tags_articles; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.articles_article_tags__article_tags_articles (
    id integer NOT NULL,
    "article-tag_id" integer,
    article_id integer
);


ALTER TABLE public.articles_article_tags__article_tags_articles OWNER TO strapi;

--
-- Name: articles_article_tags__article_tags_articles_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.articles_article_tags__article_tags_articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_article_tags__article_tags_articles_id_seq OWNER TO strapi;

--
-- Name: articles_article_tags__article_tags_articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.articles_article_tags__article_tags_articles_id_seq OWNED BY public.articles_article_tags__article_tags_articles.id;


--
-- Name: articles_components; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.articles_components (
    id integer NOT NULL,
    field character varying(255) NOT NULL,
    "order" integer NOT NULL,
    component_type character varying(255) NOT NULL,
    component_id integer NOT NULL,
    article_id integer NOT NULL
);


ALTER TABLE public.articles_components OWNER TO strapi;

--
-- Name: articles_components_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.articles_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_components_id_seq OWNER TO strapi;

--
-- Name: articles_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.articles_components_id_seq OWNED BY public.articles_components.id;


--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_id_seq OWNER TO strapi;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: articles_pages; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.articles_pages (
    id integer NOT NULL,
    title character varying(255),
    motto text,
    "extraContent" text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.articles_pages OWNER TO strapi;

--
-- Name: articles_pages_components; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.articles_pages_components (
    id integer NOT NULL,
    field character varying(255) NOT NULL,
    "order" integer NOT NULL,
    component_type character varying(255) NOT NULL,
    component_id integer NOT NULL,
    articles_page_id integer NOT NULL
);


ALTER TABLE public.articles_pages_components OWNER TO strapi;

--
-- Name: articles_pages_components_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.articles_pages_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_pages_components_id_seq OWNER TO strapi;

--
-- Name: articles_pages_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.articles_pages_components_id_seq OWNED BY public.articles_pages_components.id;


--
-- Name: articles_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.articles_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_pages_id_seq OWNER TO strapi;

--
-- Name: articles_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.articles_pages_id_seq OWNED BY public.articles_pages.id;


--
-- Name: components_page_content_page_contents; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.components_page_content_page_contents (
    id integer NOT NULL,
    subtitle character varying(255),
    content text
);


ALTER TABLE public.components_page_content_page_contents OWNER TO strapi;

--
-- Name: components_page_content_page_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.components_page_content_page_contents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_page_content_page_contents_id_seq OWNER TO strapi;

--
-- Name: components_page_content_page_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.components_page_content_page_contents_id_seq OWNED BY public.components_page_content_page_contents.id;


--
-- Name: components_page_section_page_sections; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.components_page_section_page_sections (
    id integer NOT NULL,
    section_content text,
    section_title character varying(255)
);


ALTER TABLE public.components_page_section_page_sections OWNER TO strapi;

--
-- Name: components_page_section_page_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.components_page_section_page_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_page_section_page_sections_id_seq OWNER TO strapi;

--
-- Name: components_page_section_page_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.components_page_section_page_sections_id_seq OWNED BY public.components_page_section_page_sections.id;


--
-- Name: components_page_section_sections; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.components_page_section_sections (
    id integer NOT NULL
);


ALTER TABLE public.components_page_section_sections OWNER TO strapi;

--
-- Name: components_page_section_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.components_page_section_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_page_section_sections_id_seq OWNER TO strapi;

--
-- Name: components_page_section_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.components_page_section_sections_id_seq OWNED BY public.components_page_section_sections.id;


--
-- Name: components_testimonials_testimonials; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.components_testimonials_testimonials (
    id integer NOT NULL,
    author character varying(255),
    content text,
    date_added timestamp with time zone,
    rating numeric(10,2)
);


ALTER TABLE public.components_testimonials_testimonials OWNER TO strapi;

--
-- Name: components_testimonials_testimonials_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.components_testimonials_testimonials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_testimonials_testimonials_id_seq OWNER TO strapi;

--
-- Name: components_testimonials_testimonials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.components_testimonials_testimonials_id_seq OWNED BY public.components_testimonials_testimonials.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    title character varying(255),
    motto text,
    "extraContent" text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.contacts OWNER TO strapi;

--
-- Name: contacts_components; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.contacts_components (
    id integer NOT NULL,
    field character varying(255) NOT NULL,
    "order" integer NOT NULL,
    component_type character varying(255) NOT NULL,
    component_id integer NOT NULL,
    contact_id integer NOT NULL
);


ALTER TABLE public.contacts_components OWNER TO strapi;

--
-- Name: contacts_components_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.contacts_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_components_id_seq OWNER TO strapi;

--
-- Name: contacts_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.contacts_components_id_seq OWNED BY public.contacts_components.id;


--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO strapi;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: cookie_policies; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.cookie_policies (
    id integer NOT NULL,
    title character varying(255),
    motto text,
    "extraContent" text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.cookie_policies OWNER TO strapi;

--
-- Name: cookie_policies_components; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.cookie_policies_components (
    id integer NOT NULL,
    field character varying(255) NOT NULL,
    "order" integer NOT NULL,
    component_type character varying(255) NOT NULL,
    component_id integer NOT NULL,
    cookie_policy_id integer NOT NULL
);


ALTER TABLE public.cookie_policies_components OWNER TO strapi;

--
-- Name: cookie_policies_components_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.cookie_policies_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookie_policies_components_id_seq OWNER TO strapi;

--
-- Name: cookie_policies_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.cookie_policies_components_id_seq OWNED BY public.cookie_policies_components.id;


--
-- Name: cookie_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.cookie_policies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cookie_policies_id_seq OWNER TO strapi;

--
-- Name: cookie_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.cookie_policies_id_seq OWNED BY public.cookie_policies.id;


--
-- Name: core_store; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.core_store (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.core_store OWNER TO strapi;

--
-- Name: core_store_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.core_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_store_id_seq OWNER TO strapi;

--
-- Name: core_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.core_store_id_seq OWNED BY public.core_store.id;


--
-- Name: discounts; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.discounts (
    id integer NOT NULL,
    name character varying(255),
    "NewPrice" numeric(10,2),
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.discounts OWNER TO strapi;

--
-- Name: discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.discounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discounts_id_seq OWNER TO strapi;

--
-- Name: discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.discounts_id_seq OWNED BY public.discounts.id;


--
-- Name: discounts_products__products_discounts; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.discounts_products__products_discounts (
    id integer NOT NULL,
    discount_id integer,
    product_id integer
);


ALTER TABLE public.discounts_products__products_discounts OWNER TO strapi;

--
-- Name: discounts_products__products_discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.discounts_products__products_discounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discounts_products__products_discounts_id_seq OWNER TO strapi;

--
-- Name: discounts_products__products_discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.discounts_products__products_discounts_id_seq OWNED BY public.discounts_products__products_discounts.id;


--
-- Name: domain_experts; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.domain_experts (
    id integer NOT NULL,
    title character varying(255),
    url character varying(255),
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.domain_experts OWNER TO strapi;

--
-- Name: domain_experts_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.domain_experts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.domain_experts_id_seq OWNER TO strapi;

--
-- Name: domain_experts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.domain_experts_id_seq OWNED BY public.domain_experts.id;


--
-- Name: events_pages; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.events_pages (
    id integer NOT NULL,
    title character varying(255),
    motto text,
    "extraContent" text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.events_pages OWNER TO strapi;

--
-- Name: events_pages_components; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.events_pages_components (
    id integer NOT NULL,
    field character varying(255) NOT NULL,
    "order" integer NOT NULL,
    component_type character varying(255) NOT NULL,
    component_id integer NOT NULL,
    events_page_id integer NOT NULL
);


ALTER TABLE public.events_pages_components OWNER TO strapi;

--
-- Name: events_pages_components_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.events_pages_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_pages_components_id_seq OWNER TO strapi;

--
-- Name: events_pages_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.events_pages_components_id_seq OWNED BY public.events_pages_components.id;


--
-- Name: events_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.events_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_pages_id_seq OWNER TO strapi;

--
-- Name: events_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.events_pages_id_seq OWNED BY public.events_pages.id;


--
-- Name: faq_pages; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.faq_pages (
    id integer NOT NULL,
    title character varying(255),
    motto text,
    "extraContent" text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.faq_pages OWNER TO strapi;

--
-- Name: faq_pages_components; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.faq_pages_components (
    id integer NOT NULL,
    field character varying(255) NOT NULL,
    "order" integer NOT NULL,
    component_type character varying(255) NOT NULL,
    component_id integer NOT NULL,
    faq_page_id integer NOT NULL
);


ALTER TABLE public.faq_pages_components OWNER TO strapi;

--
-- Name: faq_pages_components_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.faq_pages_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faq_pages_components_id_seq OWNER TO strapi;

--
-- Name: faq_pages_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.faq_pages_components_id_seq OWNED BY public.faq_pages_components.id;


--
-- Name: faq_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.faq_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faq_pages_id_seq OWNER TO strapi;

--
-- Name: faq_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.faq_pages_id_seq OWNED BY public.faq_pages.id;


--
-- Name: home_pages; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.home_pages (
    id integer NOT NULL,
    title character varying(255),
    motto text,
    "extraContent" text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.home_pages OWNER TO strapi;

--
-- Name: home_pages_components; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.home_pages_components (
    id integer NOT NULL,
    field character varying(255) NOT NULL,
    "order" integer NOT NULL,
    component_type character varying(255) NOT NULL,
    component_id integer NOT NULL,
    home_page_id integer NOT NULL
);


ALTER TABLE public.home_pages_components OWNER TO strapi;

--
-- Name: home_pages_components_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.home_pages_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_pages_components_id_seq OWNER TO strapi;

--
-- Name: home_pages_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.home_pages_components_id_seq OWNED BY public.home_pages_components.id;


--
-- Name: home_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.home_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_pages_id_seq OWNER TO strapi;

--
-- Name: home_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.home_pages_id_seq OWNED BY public.home_pages.id;


--
-- Name: i18n_locales; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.i18n_locales (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.i18n_locales OWNER TO strapi;

--
-- Name: i18n_locales_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.i18n_locales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locales_id_seq OWNER TO strapi;

--
-- Name: i18n_locales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.i18n_locales_id_seq OWNED BY public.i18n_locales.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    name character varying(255),
    company character varying(255),
    email character varying(255),
    content text,
    subject character varying(255),
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.messages OWNER TO strapi;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO strapi;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: privacy_policies; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.privacy_policies (
    id integer NOT NULL,
    title character varying(255),
    motto text,
    "extraContent" text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.privacy_policies OWNER TO strapi;

--
-- Name: privacy_policies_components; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.privacy_policies_components (
    id integer NOT NULL,
    field character varying(255) NOT NULL,
    "order" integer NOT NULL,
    component_type character varying(255) NOT NULL,
    component_id integer NOT NULL,
    privacy_policy_id integer NOT NULL
);


ALTER TABLE public.privacy_policies_components OWNER TO strapi;

--
-- Name: privacy_policies_components_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.privacy_policies_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.privacy_policies_components_id_seq OWNER TO strapi;

--
-- Name: privacy_policies_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.privacy_policies_components_id_seq OWNED BY public.privacy_policies_components.id;


--
-- Name: privacy_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.privacy_policies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.privacy_policies_id_seq OWNER TO strapi;

--
-- Name: privacy_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.privacy_policies_id_seq OWNED BY public.privacy_policies.id;


--
-- Name: product_filters; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.product_filters (
    id integer NOT NULL,
    filter_name character varying(255),
    slug character varying(255),
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.product_filters OWNER TO strapi;

--
-- Name: product_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.product_filters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_filters_id_seq OWNER TO strapi;

--
-- Name: product_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.product_filters_id_seq OWNED BY public.product_filters.id;


--
-- Name: product_main_categories; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.product_main_categories (
    id integer NOT NULL,
    categ_name character varying(255),
    slug character varying(255),
    description text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.product_main_categories OWNER TO strapi;

--
-- Name: product_main_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.product_main_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_main_categories_id_seq OWNER TO strapi;

--
-- Name: product_main_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.product_main_categories_id_seq OWNED BY public.product_main_categories.id;


--
-- Name: product_secondary_categories; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.product_secondary_categories (
    id integer NOT NULL,
    categ_name character varying(255),
    slug character varying(255),
    description text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.product_secondary_categories OWNER TO strapi;

--
-- Name: product_secondary_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.product_secondary_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_secondary_categories_id_seq OWNER TO strapi;

--
-- Name: product_secondary_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.product_secondary_categories_id_seq OWNED BY public.product_secondary_categories.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.products (
    id integer NOT NULL,
    product_name character varying(255),
    is_digital_product boolean,
    product_description text,
    slug character varying(255),
    price numeric(10,2),
    "SKU" character varying(255),
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    "DiscountPercent" numeric(10,2),
    "DiscountPercentage" numeric(10,2)
);


ALTER TABLE public.products OWNER TO strapi;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO strapi;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products_product_main_categories__product_main_categories_produ; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.products_product_main_categories__product_main_categories_produ (
    id integer NOT NULL,
    "product-main-category_id" integer,
    product_id integer
);


ALTER TABLE public.products_product_main_categories__product_main_categories_produ OWNER TO strapi;

--
-- Name: products_product_main_categories__product_main_categorie_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.products_product_main_categories__product_main_categorie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_main_categories__product_main_categorie_id_seq OWNER TO strapi;

--
-- Name: products_product_main_categories__product_main_categorie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.products_product_main_categories__product_main_categorie_id_seq OWNED BY public.products_product_main_categories__product_main_categories_produ.id;


--
-- Name: products_product_secondary_categories__product_secondary_catego; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.products_product_secondary_categories__product_secondary_catego (
    id integer NOT NULL,
    "product-secondary-category_id" integer,
    product_id integer
);


ALTER TABLE public.products_product_secondary_categories__product_secondary_catego OWNER TO strapi;

--
-- Name: products_product_secondary_categories__product_secondary_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.products_product_secondary_categories__product_secondary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_secondary_categories__product_secondary_id_seq OWNER TO strapi;

--
-- Name: products_product_secondary_categories__product_secondary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.products_product_secondary_categories__product_secondary_id_seq OWNED BY public.products_product_secondary_categories__product_secondary_catego.id;


--
-- Name: safe_guardings; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.safe_guardings (
    id integer NOT NULL,
    title character varying(255),
    motto text,
    "extraContent" text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.safe_guardings OWNER TO strapi;

--
-- Name: safe_guardings_components; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.safe_guardings_components (
    id integer NOT NULL,
    field character varying(255) NOT NULL,
    "order" integer NOT NULL,
    component_type character varying(255) NOT NULL,
    component_id integer NOT NULL,
    safe_guarding_id integer NOT NULL
);


ALTER TABLE public.safe_guardings_components OWNER TO strapi;

--
-- Name: safe_guardings_components_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.safe_guardings_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.safe_guardings_components_id_seq OWNER TO strapi;

--
-- Name: safe_guardings_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.safe_guardings_components_id_seq OWNED BY public.safe_guardings_components.id;


--
-- Name: safe_guardings_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.safe_guardings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.safe_guardings_id_seq OWNER TO strapi;

--
-- Name: safe_guardings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.safe_guardings_id_seq OWNED BY public.safe_guardings.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.services (
    id integer NOT NULL,
    title character varying(255),
    motto text,
    "extraContent" text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.services OWNER TO strapi;

--
-- Name: services_components; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.services_components (
    id integer NOT NULL,
    field character varying(255) NOT NULL,
    "order" integer NOT NULL,
    component_type character varying(255) NOT NULL,
    component_id integer NOT NULL,
    service_id integer NOT NULL
);


ALTER TABLE public.services_components OWNER TO strapi;

--
-- Name: services_components_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.services_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_components_id_seq OWNER TO strapi;

--
-- Name: services_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.services_components_id_seq OWNED BY public.services_components.id;


--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO strapi;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: single_events; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.single_events (
    id integer NOT NULL,
    description text,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    slug character varying(255),
    title character varying(255),
    event_type character varying(255),
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.single_events OWNER TO strapi;

--
-- Name: single_events_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.single_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.single_events_id_seq OWNER TO strapi;

--
-- Name: single_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.single_events_id_seq OWNED BY public.single_events.id;


--
-- Name: social_media_accounts; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.social_media_accounts (
    id integer NOT NULL,
    "URL" character varying(255),
    title character varying(255),
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.social_media_accounts OWNER TO strapi;

--
-- Name: social_media_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.social_media_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_media_accounts_id_seq OWNER TO strapi;

--
-- Name: social_media_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.social_media_accounts_id_seq OWNED BY public.social_media_accounts.id;


--
-- Name: strapi_administrator; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_administrator (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255) NOT NULL,
    password character varying(255),
    "resetPasswordToken" character varying(255),
    "registrationToken" character varying(255),
    "isActive" boolean,
    blocked boolean,
    "preferedLanguage" character varying(255)
);


ALTER TABLE public.strapi_administrator OWNER TO strapi;

--
-- Name: strapi_administrator_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_administrator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_administrator_id_seq OWNER TO strapi;

--
-- Name: strapi_administrator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_administrator_id_seq OWNED BY public.strapi_administrator.id;


--
-- Name: strapi_permission; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_permission (
    id integer NOT NULL,
    action character varying(255) NOT NULL,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    role integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.strapi_permission OWNER TO strapi;

--
-- Name: strapi_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_permission_id_seq OWNER TO strapi;

--
-- Name: strapi_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_permission_id_seq OWNED BY public.strapi_permission.id;


--
-- Name: strapi_role; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_role (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    description character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.strapi_role OWNER TO strapi;

--
-- Name: strapi_role_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_role_id_seq OWNER TO strapi;

--
-- Name: strapi_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_role_id_seq OWNED BY public.strapi_role.id;


--
-- Name: strapi_users_roles; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_users_roles (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.strapi_users_roles OWNER TO strapi;

--
-- Name: strapi_users_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_users_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_users_roles_id_seq OWNER TO strapi;

--
-- Name: strapi_users_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_users_roles_id_seq OWNED BY public.strapi_users_roles.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO strapi;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO strapi;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: team_members; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.team_members (
    id integer NOT NULL,
    member_name character varying(255),
    member_description text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.team_members OWNER TO strapi;

--
-- Name: team_members_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.team_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_members_id_seq OWNER TO strapi;

--
-- Name: team_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.team_members_id_seq OWNED BY public.team_members.id;


--
-- Name: terms_conditions; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.terms_conditions (
    id integer NOT NULL,
    title character varying(255),
    motto text,
    "extraContent" text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.terms_conditions OWNER TO strapi;

--
-- Name: terms_conditions_components; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.terms_conditions_components (
    id integer NOT NULL,
    field character varying(255) NOT NULL,
    "order" integer NOT NULL,
    component_type character varying(255) NOT NULL,
    component_id integer NOT NULL,
    terms_condition_id integer NOT NULL
);


ALTER TABLE public.terms_conditions_components OWNER TO strapi;

--
-- Name: terms_conditions_components_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.terms_conditions_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.terms_conditions_components_id_seq OWNER TO strapi;

--
-- Name: terms_conditions_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.terms_conditions_components_id_seq OWNED BY public.terms_conditions_components.id;


--
-- Name: terms_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.terms_conditions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.terms_conditions_id_seq OWNER TO strapi;

--
-- Name: terms_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.terms_conditions_id_seq OWNED BY public.terms_conditions.id;


--
-- Name: testimonials; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.testimonials (
    id integer NOT NULL,
    author_name character varying(255),
    text text,
    published_at timestamp with time zone,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.testimonials OWNER TO strapi;

--
-- Name: testimonials_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.testimonials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testimonials_id_seq OWNER TO strapi;

--
-- Name: testimonials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.testimonials_id_seq OWNED BY public.testimonials.id;


--
-- Name: upload_file; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.upload_file (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "alternativeText" character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255) NOT NULL,
    ext character varying(255),
    mime character varying(255) NOT NULL,
    size numeric(10,2) NOT NULL,
    url character varying(255) NOT NULL,
    "previewUrl" character varying(255),
    provider character varying(255) NOT NULL,
    provider_metadata jsonb,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.upload_file OWNER TO strapi;

--
-- Name: upload_file_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.upload_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_file_id_seq OWNER TO strapi;

--
-- Name: upload_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.upload_file_id_seq OWNED BY public.upload_file.id;


--
-- Name: upload_file_morph; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public.upload_file_morph (
    id integer NOT NULL,
    upload_file_id integer,
    related_id integer,
    related_type text,
    field text,
    "order" integer
);


ALTER TABLE public.upload_file_morph OWNER TO strapi;

--
-- Name: upload_file_morph_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public.upload_file_morph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_file_morph_id_seq OWNER TO strapi;

--
-- Name: upload_file_morph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public.upload_file_morph_id_seq OWNED BY public.upload_file_morph.id;


--
-- Name: users-permissions_permission; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public."users-permissions_permission" (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    controller character varying(255) NOT NULL,
    action character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    policy character varying(255),
    role integer,
    created_by integer,
    updated_by integer
);


ALTER TABLE public."users-permissions_permission" OWNER TO strapi;

--
-- Name: users-permissions_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public."users-permissions_permission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-permissions_permission_id_seq" OWNER TO strapi;

--
-- Name: users-permissions_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public."users-permissions_permission_id_seq" OWNED BY public."users-permissions_permission".id;


--
-- Name: users-permissions_role; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public."users-permissions_role" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255),
    created_by integer,
    updated_by integer
);


ALTER TABLE public."users-permissions_role" OWNER TO strapi;

--
-- Name: users-permissions_role_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public."users-permissions_role_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-permissions_role_id_seq" OWNER TO strapi;

--
-- Name: users-permissions_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public."users-permissions_role_id_seq" OWNED BY public."users-permissions_role".id;


--
-- Name: users-permissions_user; Type: TABLE; Schema: public; Owner: strapi
--

CREATE TABLE public."users-permissions_user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    provider character varying(255),
    password character varying(255),
    "resetPasswordToken" character varying(255),
    "confirmationToken" character varying(255),
    confirmed boolean,
    blocked boolean,
    role integer,
    created_by integer,
    updated_by integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."users-permissions_user" OWNER TO strapi;

--
-- Name: users-permissions_user_id_seq; Type: SEQUENCE; Schema: public; Owner: strapi
--

CREATE SEQUENCE public."users-permissions_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-permissions_user_id_seq" OWNER TO strapi;

--
-- Name: users-permissions_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: strapi
--

ALTER SEQUENCE public."users-permissions_user_id_seq" OWNED BY public."users-permissions_user".id;


--
-- Name: aboutuses id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.aboutuses ALTER COLUMN id SET DEFAULT nextval('public.aboutuses_id_seq'::regclass);


--
-- Name: aboutuses_components id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.aboutuses_components ALTER COLUMN id SET DEFAULT nextval('public.aboutuses_components_id_seq'::regclass);


--
-- Name: article_categories id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.article_categories ALTER COLUMN id SET DEFAULT nextval('public.article_categories_id_seq'::regclass);


--
-- Name: article_tags id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.article_tags ALTER COLUMN id SET DEFAULT nextval('public.article_tags_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: articles_article_categories__article_categories_articles id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles_article_categories__article_categories_articles ALTER COLUMN id SET DEFAULT nextval('public.articles_article_categories__article_categories_articles_id_seq'::regclass);


--
-- Name: articles_article_tags__article_tags_articles id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles_article_tags__article_tags_articles ALTER COLUMN id SET DEFAULT nextval('public.articles_article_tags__article_tags_articles_id_seq'::regclass);


--
-- Name: articles_components id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles_components ALTER COLUMN id SET DEFAULT nextval('public.articles_components_id_seq'::regclass);


--
-- Name: articles_pages id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles_pages ALTER COLUMN id SET DEFAULT nextval('public.articles_pages_id_seq'::regclass);


--
-- Name: articles_pages_components id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles_pages_components ALTER COLUMN id SET DEFAULT nextval('public.articles_pages_components_id_seq'::regclass);


--
-- Name: components_page_content_page_contents id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.components_page_content_page_contents ALTER COLUMN id SET DEFAULT nextval('public.components_page_content_page_contents_id_seq'::regclass);


--
-- Name: components_page_section_page_sections id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.components_page_section_page_sections ALTER COLUMN id SET DEFAULT nextval('public.components_page_section_page_sections_id_seq'::regclass);


--
-- Name: components_page_section_sections id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.components_page_section_sections ALTER COLUMN id SET DEFAULT nextval('public.components_page_section_sections_id_seq'::regclass);


--
-- Name: components_testimonials_testimonials id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.components_testimonials_testimonials ALTER COLUMN id SET DEFAULT nextval('public.components_testimonials_testimonials_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: contacts_components id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contacts_components ALTER COLUMN id SET DEFAULT nextval('public.contacts_components_id_seq'::regclass);


--
-- Name: cookie_policies id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.cookie_policies ALTER COLUMN id SET DEFAULT nextval('public.cookie_policies_id_seq'::regclass);


--
-- Name: cookie_policies_components id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.cookie_policies_components ALTER COLUMN id SET DEFAULT nextval('public.cookie_policies_components_id_seq'::regclass);


--
-- Name: core_store id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.core_store ALTER COLUMN id SET DEFAULT nextval('public.core_store_id_seq'::regclass);


--
-- Name: discounts id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.discounts ALTER COLUMN id SET DEFAULT nextval('public.discounts_id_seq'::regclass);


--
-- Name: discounts_products__products_discounts id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.discounts_products__products_discounts ALTER COLUMN id SET DEFAULT nextval('public.discounts_products__products_discounts_id_seq'::regclass);


--
-- Name: domain_experts id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.domain_experts ALTER COLUMN id SET DEFAULT nextval('public.domain_experts_id_seq'::regclass);


--
-- Name: events_pages id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.events_pages ALTER COLUMN id SET DEFAULT nextval('public.events_pages_id_seq'::regclass);


--
-- Name: events_pages_components id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.events_pages_components ALTER COLUMN id SET DEFAULT nextval('public.events_pages_components_id_seq'::regclass);


--
-- Name: faq_pages id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.faq_pages ALTER COLUMN id SET DEFAULT nextval('public.faq_pages_id_seq'::regclass);


--
-- Name: faq_pages_components id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.faq_pages_components ALTER COLUMN id SET DEFAULT nextval('public.faq_pages_components_id_seq'::regclass);


--
-- Name: home_pages id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.home_pages ALTER COLUMN id SET DEFAULT nextval('public.home_pages_id_seq'::regclass);


--
-- Name: home_pages_components id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.home_pages_components ALTER COLUMN id SET DEFAULT nextval('public.home_pages_components_id_seq'::regclass);


--
-- Name: i18n_locales id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.i18n_locales ALTER COLUMN id SET DEFAULT nextval('public.i18n_locales_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: privacy_policies id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.privacy_policies ALTER COLUMN id SET DEFAULT nextval('public.privacy_policies_id_seq'::regclass);


--
-- Name: privacy_policies_components id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.privacy_policies_components ALTER COLUMN id SET DEFAULT nextval('public.privacy_policies_components_id_seq'::regclass);


--
-- Name: product_filters id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_filters ALTER COLUMN id SET DEFAULT nextval('public.product_filters_id_seq'::regclass);


--
-- Name: product_main_categories id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_main_categories ALTER COLUMN id SET DEFAULT nextval('public.product_main_categories_id_seq'::regclass);


--
-- Name: product_secondary_categories id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_secondary_categories ALTER COLUMN id SET DEFAULT nextval('public.product_secondary_categories_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_product_main_categories__product_main_categories_produ id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products_product_main_categories__product_main_categories_produ ALTER COLUMN id SET DEFAULT nextval('public.products_product_main_categories__product_main_categorie_id_seq'::regclass);


--
-- Name: products_product_secondary_categories__product_secondary_catego id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products_product_secondary_categories__product_secondary_catego ALTER COLUMN id SET DEFAULT nextval('public.products_product_secondary_categories__product_secondary_id_seq'::regclass);


--
-- Name: safe_guardings id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.safe_guardings ALTER COLUMN id SET DEFAULT nextval('public.safe_guardings_id_seq'::regclass);


--
-- Name: safe_guardings_components id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.safe_guardings_components ALTER COLUMN id SET DEFAULT nextval('public.safe_guardings_components_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: services_components id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.services_components ALTER COLUMN id SET DEFAULT nextval('public.services_components_id_seq'::regclass);


--
-- Name: single_events id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.single_events ALTER COLUMN id SET DEFAULT nextval('public.single_events_id_seq'::regclass);


--
-- Name: social_media_accounts id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.social_media_accounts ALTER COLUMN id SET DEFAULT nextval('public.social_media_accounts_id_seq'::regclass);


--
-- Name: strapi_administrator id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_administrator ALTER COLUMN id SET DEFAULT nextval('public.strapi_administrator_id_seq'::regclass);


--
-- Name: strapi_permission id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_permission ALTER COLUMN id SET DEFAULT nextval('public.strapi_permission_id_seq'::regclass);


--
-- Name: strapi_role id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_role ALTER COLUMN id SET DEFAULT nextval('public.strapi_role_id_seq'::regclass);


--
-- Name: strapi_users_roles id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_users_roles ALTER COLUMN id SET DEFAULT nextval('public.strapi_users_roles_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: team_members id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.team_members ALTER COLUMN id SET DEFAULT nextval('public.team_members_id_seq'::regclass);


--
-- Name: terms_conditions id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.terms_conditions ALTER COLUMN id SET DEFAULT nextval('public.terms_conditions_id_seq'::regclass);


--
-- Name: terms_conditions_components id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.terms_conditions_components ALTER COLUMN id SET DEFAULT nextval('public.terms_conditions_components_id_seq'::regclass);


--
-- Name: testimonials id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.testimonials ALTER COLUMN id SET DEFAULT nextval('public.testimonials_id_seq'::regclass);


--
-- Name: upload_file id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_file ALTER COLUMN id SET DEFAULT nextval('public.upload_file_id_seq'::regclass);


--
-- Name: upload_file_morph id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_file_morph ALTER COLUMN id SET DEFAULT nextval('public.upload_file_morph_id_seq'::regclass);


--
-- Name: users-permissions_permission id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public."users-permissions_permission" ALTER COLUMN id SET DEFAULT nextval('public."users-permissions_permission_id_seq"'::regclass);


--
-- Name: users-permissions_role id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public."users-permissions_role" ALTER COLUMN id SET DEFAULT nextval('public."users-permissions_role_id_seq"'::regclass);


--
-- Name: users-permissions_user id; Type: DEFAULT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public."users-permissions_user" ALTER COLUMN id SET DEFAULT nextval('public."users-permissions_user_id_seq"'::regclass);


--
-- Data for Name: aboutuses; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.aboutuses (id, title, motto, "extraContent", published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Abobut us	\N	\N	2021-09-29 21:43:40.024+01	1	1	2021-09-29 21:43:38.779+01	2021-09-29 23:12:51.747+01
\.


--
-- Data for Name: aboutuses_components; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.aboutuses_components (id, field, "order", component_type, component_id, aboutus_id) FROM stdin;
2	sections	1	components_page_section_page_sections	13	1
3	content	1	components_page_content_page_contents	11	1
\.


--
-- Data for Name: article_categories; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.article_categories (id, category, slug, published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
2	second category	second-category	2021-09-29 22:17:34.616+01	1	1	2021-09-29 22:17:33.015+01	2021-09-29 22:17:34.635+01
1	first category	first-category	2021-09-29 22:17:38.428+01	1	1	2021-09-29 22:17:26.856+01	2021-09-29 22:17:38.446+01
\.


--
-- Data for Name: article_tags; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.article_tags (id, tag_name, slug, published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	mid school	mid-school	2021-09-29 22:17:47.115+01	1	1	2021-09-29 22:17:45.718+01	2021-09-29 22:17:47.127+01
2	preschool	preschool	2021-09-29 22:17:55.604+01	1	1	2021-09-29 22:17:54.101+01	2021-09-29 22:17:55.618+01
\.


--
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.articles (id, title, slug, unpublish_date, description, author, featured, future_publish_date, published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	First Public Article	first-public-article	\N	\N	1	t	\N	2021-09-29 22:18:41.65+01	1	1	2021-09-29 22:18:40.246+01	2021-09-30 23:46:10.519+01
2	Second Public Article	second-public-article	\N	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	1	t	\N	2021-09-29 22:19:58.105+01	1	1	2021-09-29 22:19:56.463+01	2021-09-29 23:07:54.46+01
3	third article	third-article	\N	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	1	t	2021-09-30 12:00:00+01	2021-09-29 22:20:27.191+01	1	1	2021-09-29 22:20:24.152+01	2021-09-29 23:07:54.46+01
\.


--
-- Data for Name: articles_article_categories__article_categories_articles; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.articles_article_categories__article_categories_articles (id, "article-category_id", article_id) FROM stdin;
1	2	1
2	2	2
3	1	2
4	2	3
\.


--
-- Data for Name: articles_article_tags__article_tags_articles; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.articles_article_tags__article_tags_articles (id, "article-tag_id", article_id) FROM stdin;
1	1	1
2	2	2
3	1	3
\.


--
-- Data for Name: articles_components; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.articles_components (id, field, "order", component_type, component_id, article_id) FROM stdin;
2	content	1	components_page_content_page_contents	13	2
3	content	1	components_page_content_page_contents	14	3
1	content	1	components_page_content_page_contents	12	1
\.


--
-- Data for Name: articles_pages; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.articles_pages (id, title, motto, "extraContent", published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Articles and News	\N	\N	2021-09-29 21:41:08.566+01	1	1	2021-09-29 21:41:07.466+01	2021-09-29 21:41:08.587+01
\.


--
-- Data for Name: articles_pages_components; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.articles_pages_components (id, field, "order", component_type, component_id, articles_page_id) FROM stdin;
1	content	1	components_page_content_page_contents	10	1
\.


--
-- Data for Name: components_page_content_page_contents; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.components_page_content_page_contents (id, subtitle, content) FROM stdin;
1	\N	<p>Lorem ipsum dolor sit amet. Et modi autem et necessitatibus nisi ex pariatur nihil. Sed eaque numquam At dolores incidunt ad dicta iure. </p><p>Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur. </p><p>Sed commodi veritatis et quos sunt vel veritatis beatae. Et repudiandae labore et mollitia galisum sit molestias voluptatum ut nobis aperiam et eligendi consequatur non alias magnam ut alias facere. Ut quibusdam voluptatem ad consequatur corrupti et nemo earum sed voluptas sequi id optio quod. Eum accusamus aperiam quo minus consequuntur est voluptatibus consequuntur in voluptatum voluptatem. </p><p>Non quibusdam corporis et ipsum itaque id debitis error qui doloribus nobis  voluptas exercitationem est saepe excepturi qui rerum architecto. Qui minima saepe et commodi dolor ea amet excepturi nam natus doloremque est magnam veritatis ad sequi minima qui quia nemo? </p><p>Non cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis  consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque. </p><p>Et nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam. </p>\n
2	\N	Lorem ipsum dolor sit amet. Et modi autem et necessitatibus nisi ex pariatur nihil. Sed eaque numquam At dolores incidunt ad dicta iure.\n\nEa enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.\n\nSed commodi veritatis et quos sunt vel veritatis beatae. Et repudiandae labore et mollitia galisum sit molestias voluptatum ut nobis aperiam et eligendi consequatur non alias magnam ut alias facere. Ut quibusdam voluptatem ad consequatur corrupti et nemo earum sed voluptas sequi id optio quod. Eum accusamus aperiam quo minus consequuntur est voluptatibus consequuntur in voluptatum voluptatem.\n\nNon quibusdam corporis et ipsum itaque id debitis error qui doloribus nobis voluptas exercitationem est saepe excepturi qui rerum architecto. Qui minima saepe et commodi dolor ea amet excepturi nam natus doloremque est magnam veritatis ad sequi minima qui quia nemo?\n\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.
3	\N	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.
4	\N	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.
6	\N	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.
7	\N	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.
8	\N	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.
9	\N	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.
10	\N	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.
13	Subtitle article	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.
14	Subtitle article	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.
11	\N	Black Stream Education was founded in 2019 by Jen Fidai, as a way of enabling more young people to access top-tier tutoring services at sustainable prices.\n\nWe are an education provision providing home education, tutoring and consultancy for young people up to the age of 19. Although we're based in Warwickshire (Rugby to be exact), we offer all of our services nationwide.\n\nAcross the various pages of this website, you will find more details about our services, our staff and what we believe in. \n\nPlease do get in touch to talk about any questions or comments you may have. We love getting to know you, and your feedback and interactions help us to know what we're doing well and where we need to improve.
12	Subtitle article	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.
5	Where caring is sharing	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.
\.


--
-- Data for Name: components_page_section_page_sections; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.components_page_section_page_sections (id, section_content, section_title) FROM stdin;
1	Lorem ipsum dolor sit amet. Et modi autem et necessitatibus nisi ex pariatur nihil. Sed eaque numquam At dolores incidunt ad dicta iure.\n\nEa enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.\n	Sciences
2	\nSed commodi veritatis et quos sunt vel veritatis beatae. Et repudiandae labore et mollitia galisum sit molestias voluptatum ut nobis aperiam et eligendi consequatur non alias magnam ut alias facere. Ut quibusdam voluptatem ad consequatur corrupti et nemo earum sed voluptas sequi id optio quod. Eum accusamus aperiam quo minus consequuntur est voluptatibus consequuntur in voluptatum voluptatem.\n\nNon quibusdam corporis et ipsum itaque id debitis error qui doloribus nobis voluptas exercitationem est saepe excepturi qui rerum architecto. Qui minima saepe et commodi dolor ea amet excepturi nam natus doloremque est magnam veritatis ad sequi minima qui quia nemo?\n\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.	Speaking
3	\nSed commodi veritatis et quos sunt vel veritatis beatae. Et repudiandae labore et mollitia galisum sit molestias voluptatum ut nobis aperiam et eligendi consequatur non alias magnam ut alias facere. Ut quibusdam voluptatem ad consequatur corrupti et nemo earum sed voluptas sequi id optio quod. Eum accusamus aperiam quo minus consequuntur est voluptatibus consequuntur in voluptatum voluptatem.\n\nNon quibusdam corporis et ipsum itaque id debitis error qui doloribus nobis voluptas exercitationem est saepe excepturi qui rerum architecto. Qui minima saepe et commodi dolor ea amet excepturi nam natus doloremque est magnam veritatis ad sequi minima qui quia nemo?\n\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.	History
4	\nSed commodi veritatis et quos sunt vel veritatis beatae. Et repudiandae labore et mollitia galisum sit molestias voluptatum ut nobis aperiam et eligendi consequatur non alias magnam ut alias facere. Ut quibusdam voluptatem ad consequatur corrupti et nemo earum sed voluptas sequi id optio quod. Eum accusamus aperiam quo minus consequuntur est voluptatibus consequuntur in voluptatum voluptatem.\n\nNon quibusdam corporis et ipsum itaque id debitis error qui doloribus nobis voluptas exercitationem est saepe excepturi qui rerum architecto. Qui minima saepe et commodi dolor ea amet excepturi nam natus doloremque est magnam veritatis ad sequi minima qui quia nemo?\n\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.	Arts
5	\nSed commodi veritatis et quos sunt vel veritatis beatae. Et repudiandae labore et mollitia galisum sit molestias voluptatum ut nobis aperiam et eligendi consequatur non alias magnam ut alias facere. Ut quibusdam voluptatem ad consequatur corrupti et nemo earum sed voluptas sequi id optio quod. Eum accusamus aperiam quo minus consequuntur est voluptatibus consequuntur in voluptatum voluptatem.\n\nNon quibusdam corporis et ipsum itaque id debitis error qui doloribus nobis voluptas exercitationem est saepe excepturi qui rerum architecto. Qui minima saepe et commodi dolor ea amet excepturi nam natus doloremque est magnam veritatis ad sequi minima qui quia nemo?\n	Geography
6	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.	Section 1
7	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.	Section 2
8	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.	section 3
9	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.	section 1
13	Our founder, Jen, started BSE in 2019, after a decade of tutoring, because there was sometimes such a disparity between families that could afford her skills and those that needed them. As Jen's waiting list grew, the more it became obvious that more tutors were needed. And so the search began...\n\nJen and her spouse had built their relationship on their shared love of learning and sheer curiosity for the world and its workings, and, through the strength of their partnership, the company was born. Through marriage, Jen's surname became Douglas, and this was the inspiration for the company name. \n\nOf Scottish origin, the name Douglas is thought to come from the Scottish Gaelic 'dubh glas', which means black stream. I think you can see where I'm going here....\n\nThe recent (late 2021) re-branding and website launch have cascaded a slew of developments and changes. From the addition of incredible new tutors to the introduction of an online shop, BSE really has gone from strength to strength, and we continue to scour the country for the very best educators.\n\n	HOW WE BEGAN
11	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.	section 3
14	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.	section 4
15	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.	section 5
10	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.	Section 2
\.


--
-- Data for Name: components_page_section_sections; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.components_page_section_sections (id) FROM stdin;
\.


--
-- Data for Name: components_testimonials_testimonials; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.components_testimonials_testimonials (id, author, content, date_added, rating) FROM stdin;
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.contacts (id, title, motto, "extraContent", published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Contact	\N	\N	2021-09-29 21:40:37.06+01	1	1	2021-09-29 21:40:35.985+01	2021-09-29 21:40:37.081+01
\.


--
-- Data for Name: contacts_components; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.contacts_components (id, field, "order", component_type, component_id, contact_id) FROM stdin;
1	content	1	components_page_content_page_contents	9	1
\.


--
-- Data for Name: cookie_policies; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.cookie_policies (id, title, motto, "extraContent", published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Cookie policy	\N	\N	2021-09-29 21:40:14.146+01	1	1	2021-09-29 21:40:12.972+01	2021-09-29 21:40:14.167+01
\.


--
-- Data for Name: cookie_policies_components; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.cookie_policies_components (id, field, "order", component_type, component_id, cookie_policy_id) FROM stdin;
1	content	1	components_page_content_page_contents	8	1
\.


--
-- Data for Name: core_store; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.core_store (id, key, value, type, environment, tag) FROM stdin;
7	model_def_application::article-categories.article-categories	{"uid":"application::article-categories.article-categories","collectionName":"article_categories","kind":"collectionType","info":{"name":"ArticleCategories","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"category":{"type":"string","unique":true},"articles":{"via":"article_categories","collection":"article","dominant":true,"attribute":"article","column":"id","isVirtual":true},"slug":{"type":"uid","targetField":"category"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
8	model_def_application::article-tag.article-tag	{"uid":"application::article-tag.article-tag","collectionName":"article_tags","kind":"collectionType","info":{"name":"ArticleTag","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"tag_name":{"type":"string","unique":true},"articles":{"via":"article_tags","collection":"article","dominant":true,"attribute":"article","column":"id","isVirtual":true},"slug":{"type":"uid","targetField":"tag_name"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
9	model_def_application::article.article	{"uid":"application::article.article","collectionName":"articles","kind":"collectionType","info":{"name":"Article","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","unique":true},"slug":{"type":"uid","targetField":"title"},"content":{"type":"component","repeatable":false,"component":"content.page-content"},"unpublish_date":{"type":"datetime"},"article_tags":{"via":"articles","collection":"article-tag","attribute":"article-tag","column":"id","isVirtual":true},"article_categories":{"via":"articles","collection":"article-categories","attribute":"article-category","column":"id","isVirtual":true},"description":{"type":"text"},"author":{"plugin":"users-permissions","model":"user","via":"articles"},"featured":{"type":"boolean"},"future_publish_date":{"type":"datetime"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
10	model_def_application::articles-page.articles-page	{"uid":"application::articles-page.articles-page","collectionName":"articles_pages","kind":"singleType","info":{"name":"ArticlesPage","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","unique":true},"content":{"type":"component","repeatable":false,"component":"content.page-content"},"motto":{"type":"richtext"},"extraContent":{"type":"richtext"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
11	model_def_application::contact.contact	{"uid":"application::contact.contact","collectionName":"contacts","kind":"singleType","info":{"name":"Contact","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","unique":true},"content":{"type":"component","repeatable":false,"component":"content.page-content"},"motto":{"type":"richtext"},"extraContent":{"type":"richtext"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
2	model_def_content.page-content	{"uid":"content.page-content","collectionName":"components_page_content_page_contents","info":{"name":"PageContent","icon":"address-card"},"options":{"timestamps":false},"attributes":{"subtitle":{"type":"string"},"header_image":{"model":"file","via":"related","allowedTypes":["images","files","videos"],"plugin":"upload","required":false,"pluginOptions":{}},"content":{"type":"richtext"}}}	object	\N	\N
4	model_def_section.sections	{"uid":"section.sections","collectionName":"components_page_section_sections","info":{"name":"sections","icon":"anchor"},"options":{"timestamps":false},"attributes":{}}	object	\N	\N
5	model_def_testimonials.testimonials	{"uid":"testimonials.testimonials","collectionName":"components_testimonials_testimonials","info":{"name":"testimonials","icon":"air-freshener"},"options":{"timestamps":false},"attributes":{"author":{"type":"string"},"content":{"type":"richtext"},"author_image":{"model":"file","via":"related","allowedTypes":["images","files","videos"],"plugin":"upload","required":false,"pluginOptions":{}},"date_added":{"type":"datetime"},"rating":{"type":"decimal"}}}	object	\N	\N
3	model_def_section.page-section	{"uid":"section.page-section","collectionName":"components_page_section_page_sections","info":{"name":"Page_Section","icon":"align-left"},"options":{"timestamps":false},"attributes":{"section_content":{"type":"richtext"},"section_title":{"type":"string"},"section_image":{"model":"file","via":"related","allowedTypes":["images","files","videos"],"plugin":"upload","required":false,"pluginOptions":{}}}}	object	\N	\N
17	model_def_application::message.message	{"uid":"application::message.message","collectionName":"messages","kind":"collectionType","info":{"name":"message","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string","required":true},"company":{"type":"string"},"email":{"type":"email"},"content":{"type":"richtext","required":true},"subject":{"type":"string"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
18	model_def_application::privacy-policies.privacy-policies	{"uid":"application::privacy-policies.privacy-policies","collectionName":"privacy_policies","kind":"singleType","info":{"name":"Privacy-Policies","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","unique":true},"content":{"type":"component","repeatable":false,"component":"content.page-content"},"motto":{"type":"richtext"},"extraContent":{"type":"richtext"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
19	model_def_application::product-filters.product-filters	{"uid":"application::product-filters.product-filters","collectionName":"product_filters","kind":"collectionType","info":{"name":"ProductFilters","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"filter_name":{"type":"string","unique":true},"slug":{"type":"uid","targetField":"filter_name"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
13	model_def_application::domain-expert.domain-expert	{"uid":"application::domain-expert.domain-expert","collectionName":"domain_experts","kind":"collectionType","info":{"name":"DomainExpert","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","unique":true},"url":{"type":"string"},"image":{"model":"file","via":"related","allowedTypes":["images","files","videos"],"plugin":"upload","required":false,"pluginOptions":{}},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
15	model_def_application::faq-page.faq-page	{"uid":"application::faq-page.faq-page","collectionName":"faq_pages","kind":"singleType","info":{"name":"FAQPage","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","unique":true},"content":{"type":"component","repeatable":false,"component":"content.page-content"},"motto":{"type":"richtext"},"extraContent":{"type":"richtext"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
16	model_def_application::home-page.home-page	{"uid":"application::home-page.home-page","collectionName":"home_pages","kind":"singleType","info":{"name":"HomePage","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","unique":true},"content":{"type":"component","repeatable":false,"component":"content.page-content"},"sections":{"type":"component","repeatable":true,"component":"section.page-section"},"motto":{"type":"richtext"},"extraContent":{"type":"richtext"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
23	model_def_application::safeguarding.safeguarding	{"uid":"application::safeguarding.safeguarding","collectionName":"safe_guardings","kind":"singleType","info":{"name":"Safeguarding","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","unique":true},"sections":{"type":"component","repeatable":true,"component":"section.page-section"},"content":{"type":"component","repeatable":false,"component":"content.page-content"},"motto":{"type":"richtext"},"extraContent":{"type":"richtext"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
25	model_def_application::single-event.single-event	{"uid":"application::single-event.single-event","collectionName":"single_events","kind":"collectionType","info":{"name":"SingleEvent","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"description":{"type":"richtext"},"header_image":{"model":"file","via":"related","allowedTypes":["images","files","videos"],"plugin":"upload","required":false,"pluginOptions":{}},"start_date":{"type":"datetime"},"end_date":{"type":"datetime"},"slug":{"type":"uid","targetField":"title"},"title":{"type":"string"},"event_type":{"type":"enumeration","enum":["leisure","school","party","trip"]},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
26	model_def_application::social-media-account.social-media-account	{"uid":"application::social-media-account.social-media-account","collectionName":"social_media_accounts","kind":"collectionType","info":{"name":"social_media_account","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"URL":{"type":"string"},"image":{"model":"file","via":"related","allowedTypes":["images","files","videos"],"plugin":"upload","required":false,"pluginOptions":{}},"title":{"type":"string","unique":true},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
44	plugin_content_manager_configuration_components::section.sections	{"uid":"section.sections","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":false,"sortable":false}}},"layouts":{"list":["id"],"edit":[],"editRelations":[]},"isComponent":true}	object		
32	model_def_strapi::role	{"uid":"strapi::role","collectionName":"strapi_role","kind":"collectionType","info":{"name":"Role","description":""},"options":{"timestamps":["created_at","updated_at"]},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"collection":"user","via":"roles","plugin":"admin","attribute":"user","column":"id","isVirtual":true},"permissions":{"configurable":false,"plugin":"admin","collection":"permission","via":"role","isVirtual":true}}}	object	\N	\N
34	model_def_plugins::i18n.locale	{"uid":"plugins::i18n.locale","collectionName":"i18n_locales","kind":"collectionType","info":{"name":"locale","description":""},"options":{"timestamps":["created_at","updated_at"]},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
35	model_def_plugins::upload.file	{"uid":"plugins::upload.file","collectionName":"upload_file","kind":"collectionType","info":{"name":"file","description":""},"options":{"timestamps":["created_at","updated_at"]},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"collection":"*","filter":"field","configurable":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
57	plugin_content_manager_configuration_content_types::application::article.article	{"uid":"application::article.article","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"article_tags":{"edit":{"label":"Article_tags","description":"","placeholder":"","visible":true,"editable":true,"mainField":"tag_name"},"list":{"label":"Article_tags","searchable":false,"sortable":false}},"article_categories":{"edit":{"label":"Article_categories","description":"","placeholder":"","visible":true,"editable":true,"mainField":"category"},"list":{"label":"Article_categories","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"author":{"edit":{"label":"Author","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Author","searchable":true,"sortable":true}},"slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"featured":{"edit":{"label":"Featured","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Featured","searchable":true,"sortable":true}},"unpublish_date":{"edit":{"label":"Unpublish_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Unpublish_date","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"future_publish_date":{"edit":{"label":"Future_publish_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Future_publish_date","searchable":true,"sortable":true}},"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"featured","size":4}],[{"name":"future_publish_date","size":6},{"name":"unpublish_date","size":6}],[{"name":"description","size":6}],[{"name":"content","size":12}]],"editRelations":["article_tags","article_categories","author"],"list":["id","title","slug","unpublish_date"]}}	object		
29	model_def_application::testimonial.testimonial	{"uid":"application::testimonial.testimonial","collectionName":"testimonials","kind":"collectionType","info":{"name":"Testimonial","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"author_name":{"type":"string","unique":true},"text":{"type":"richtext"},"author_image":{"model":"file","via":"related","allowedTypes":["images","files","videos"],"plugin":"upload","required":false,"pluginOptions":{}},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
30	model_def_strapi::webhooks	{"uid":"strapi::webhooks","collectionName":"strapi_webhooks","info":{"name":"Strapi webhooks","description":""},"options":{"timestamps":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string"},"url":{"type":"text"},"headers":{"type":"json"},"events":{"type":"json"},"enabled":{"type":"boolean"}}}	object	\N	\N
31	model_def_strapi::permission	{"uid":"strapi::permission","collectionName":"strapi_permission","kind":"collectionType","info":{"name":"Permission","description":""},"options":{"timestamps":["created_at","updated_at"]},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"model":"role","plugin":"admin"}}}	object	\N	\N
37	model_def_plugins::users-permissions.role	{"uid":"plugins::users-permissions.role","collectionName":"users-permissions_role","kind":"collectionType","info":{"name":"role","description":""},"options":{"timestamps":false},"pluginOptions":{"content-manager":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
39	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true}	object	development	
38	model_def_plugins::users-permissions.user	{"uid":"plugins::users-permissions.user","collectionName":"users-permissions_user","kind":"collectionType","info":{"name":"user","description":""},"options":{"draftAndPublish":false,"timestamps":["created_at","updated_at"]},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false},"articles":{"via":"author","collection":"article","isVirtual":true},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
41	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"}}	object		
42	plugin_content_manager_configuration_components::content.page-content	{"uid":"content.page-content","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"subtitle","defaultSortBy":"subtitle","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":false,"sortable":false}},"subtitle":{"edit":{"label":"Subtitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Subtitle","searchable":true,"sortable":true}},"header_image":{"edit":{"label":"Header_image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Header_image","searchable":false,"sortable":false}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}}},"layouts":{"list":["id","subtitle","header_image"],"edit":[[{"name":"subtitle","size":6},{"name":"header_image","size":6}],[{"name":"content","size":12}]],"editRelations":[]},"isComponent":true}	object		
45	plugin_i18n_default_locale	"en"	string		
46	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object		
48	plugin_content_manager_configuration_content_types::application::article-categories.article-categories	{"uid":"application::article-categories.article-categories","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"category","defaultSortBy":"category","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"category":{"edit":{"label":"Category","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Category","searchable":true,"sortable":true}},"articles":{"edit":{"label":"Articles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"Articles","searchable":false,"sortable":false}},"slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","category","articles","slug"],"editRelations":["articles"],"edit":[[{"name":"category","size":6},{"name":"slug","size":6}]]}}	object		
51	plugin_content_manager_configuration_content_types::application::cookie-policy.cookie-policy	{"uid":"application::cookie-policy.cookie-policy","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"motto":{"edit":{"label":"Motto","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Motto","searchable":false,"sortable":false}},"extraContent":{"edit":{"label":"ExtraContent","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ExtraContent","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","created_at","updated_at"],"editRelations":[],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"motto","size":12}],[{"name":"extraContent","size":12}]]}}	object		
47	plugin_content_manager_configuration_content_types::application::about.about	{"uid":"application::about.about","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"sections":{"edit":{"label":"Sections","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Sections","searchable":false,"sortable":false}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"motto":{"edit":{"label":"Motto","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Motto","searchable":false,"sortable":false}},"extraContent":{"edit":{"label":"ExtraContent","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ExtraContent","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"motto","size":12}],[{"name":"extraContent","size":12}],[{"name":"sections","size":12}]],"editRelations":[],"list":["id","title","created_at","updated_at"]}}	object		
49	plugin_content_manager_configuration_content_types::application::article-tag.article-tag	{"uid":"application::article-tag.article-tag","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"tag_name","defaultSortBy":"tag_name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"tag_name":{"edit":{"label":"Tag_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Tag_name","searchable":true,"sortable":true}},"articles":{"edit":{"label":"Articles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"Articles","searchable":false,"sortable":false}},"slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","tag_name","articles","slug"],"editRelations":["articles"],"edit":[[{"name":"tag_name","size":6},{"name":"slug","size":6}]]}}	object		
50	plugin_content_manager_configuration_content_types::application::articles-page.articles-page	{"uid":"application::articles-page.articles-page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"motto":{"edit":{"label":"Motto","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Motto","searchable":false,"sortable":false}},"extraContent":{"edit":{"label":"ExtraContent","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ExtraContent","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","created_at","updated_at"],"editRelations":[],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"motto","size":12}],[{"name":"extraContent","size":12}]]}}	object		
52	plugin_content_manager_configuration_content_types::application::contact.contact	{"uid":"application::contact.contact","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"motto":{"edit":{"label":"Motto","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Motto","searchable":false,"sortable":false}},"extraContent":{"edit":{"label":"ExtraContent","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ExtraContent","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","created_at","updated_at"],"editRelations":[],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"motto","size":12}],[{"name":"extraContent","size":12}]]}}	object		
61	plugin_content_manager_configuration_content_types::application::product-main-categories.product-main-categories	{"uid":"application::product-main-categories.product-main-categories","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"categ_name","defaultSortBy":"categ_name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"categ_name":{"edit":{"label":"Categ_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Categ_name","searchable":true,"sortable":true}},"slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"products":{"edit":{"label":"Products","description":"","placeholder":"","visible":true,"editable":true,"mainField":"product_name"},"list":{"label":"Products","searchable":false,"sortable":false}},"image":{"edit":{"label":"Image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Image","searchable":false,"sortable":false}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","categ_name","slug","products"],"editRelations":["products"],"edit":[[{"name":"categ_name","size":6},{"name":"slug","size":6}],[{"name":"image","size":6}],[{"name":"description","size":12}]]}}	object		
66	plugin_content_manager_configuration_content_types::application::single-event.single-event	{"uid":"application::single-event.single-event","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"header_image":{"edit":{"label":"Header_image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Header_image","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"start_date":{"edit":{"label":"Start_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Start_date","searchable":true,"sortable":true}},"slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"end_date":{"edit":{"label":"End_date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"End_date","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":false,"sortable":false}},"event_type":{"edit":{"label":"Event_type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Event_type","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"start_date","size":6},{"name":"end_date","size":6}],[{"name":"event_type","size":6},{"name":"header_image","size":6}],[{"name":"description","size":12}]],"editRelations":[],"list":["id","header_image","start_date","end_date"]}}	object		
53	plugin_content_manager_configuration_content_types::application::domain-expert.domain-expert	{"uid":"application::domain-expert.domain-expert","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"url":{"edit":{"label":"Url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Url","searchable":true,"sortable":true}},"image":{"edit":{"label":"Image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Image","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","url","image"],"editRelations":[],"edit":[[{"name":"title","size":6},{"name":"url","size":6}],[{"name":"image","size":6}]]}}	object		
74	plugin_content_manager_configuration_content_types::plugins::i18n.locale	{"uid":"plugins::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"code":{"edit":{"label":"Code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Code","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","created_at"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}	object		
64	plugin_content_manager_configuration_content_types::application::safeguarding.safeguarding	{"uid":"application::safeguarding.safeguarding","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"sections":{"edit":{"label":"Sections","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Sections","searchable":false,"sortable":false}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"motto":{"edit":{"label":"Motto","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Motto","searchable":false,"sortable":false}},"extraContent":{"edit":{"label":"ExtraContent","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ExtraContent","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"title","size":6}],[{"name":"motto","size":12}],[{"name":"content","size":12}],[{"name":"extraContent","size":12}],[{"name":"sections","size":12}]],"editRelations":[],"list":["id","title","created_at","updated_at"]}}	object		
54	plugin_content_manager_configuration_content_types::application::events-page.events-page	{"uid":"application::events-page.events-page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"motto":{"edit":{"label":"Motto","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Motto","searchable":false,"sortable":false}},"extraContent":{"edit":{"label":"ExtraContent","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ExtraContent","searchable":false,"sortable":false}},"sections":{"edit":{"label":"Sections","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Sections","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","created_at","updated_at"],"editRelations":[],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"motto","size":12}],[{"name":"extraContent","size":12}],[{"name":"sections","size":12}]]}}	object		
58	plugin_content_manager_configuration_content_types::application::message.message	{"uid":"application::message.message","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"company":{"edit":{"label":"Company","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Company","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"subject":{"edit":{"label":"Subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Subject","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","company","email"],"editRelations":[],"edit":[[{"name":"name","size":6},{"name":"company","size":6}],[{"name":"email","size":6}],[{"name":"content","size":12}],[{"name":"subject","size":6}]]}}	object		
68	plugin_content_manager_configuration_content_types::application::team-member.team-member	{"uid":"application::team-member.team-member","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"member_name","defaultSortBy":"member_name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"member_name":{"edit":{"label":"Member_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Member_name","searchable":true,"sortable":true}},"member_image":{"edit":{"label":"Member_image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Member_image","searchable":false,"sortable":false}},"member_description":{"edit":{"label":"Member_description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Member_description","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","member_name","member_image","created_at"],"editRelations":[],"edit":[[{"name":"member_name","size":6},{"name":"member_image","size":6}],[{"name":"member_description","size":12}]]}}	object		
78	plugin_content_manager_configuration_content_types::plugins::users-permissions.user	{"uid":"plugins::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"ConfirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"ConfirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"Confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}},"articles":{"edit":{"label":"Articles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"Articles","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"editRelations":["role","articles"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4}]]}}	object		
55	plugin_content_manager_configuration_content_types::application::faq-page.faq-page	{"uid":"application::faq-page.faq-page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"motto":{"edit":{"label":"Motto","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Motto","searchable":false,"sortable":false}},"extraContent":{"edit":{"label":"ExtraContent","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ExtraContent","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","created_at","updated_at"],"editRelations":[],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"motto","size":12}],[{"name":"extraContent","size":12}]]}}	object		
59	plugin_content_manager_configuration_content_types::application::privacy-policies.privacy-policies	{"uid":"application::privacy-policies.privacy-policies","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"motto":{"edit":{"label":"Motto","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Motto","searchable":false,"sortable":false}},"extraContent":{"edit":{"label":"ExtraContent","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ExtraContent","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","created_at","updated_at"],"editRelations":[],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"motto","size":12}],[{"name":"extraContent","size":12}]]}}	object		
69	plugin_content_manager_configuration_content_types::application::terms-conditions.terms-conditions	{"uid":"application::terms-conditions.terms-conditions","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"motto":{"edit":{"label":"Motto","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Motto","searchable":false,"sortable":false}},"extraContent":{"edit":{"label":"ExtraContent","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ExtraContent","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","created_at","updated_at"],"editRelations":[],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"motto","size":12}],[{"name":"extraContent","size":12}]]}}	object		
80	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null}}	object		
56	plugin_content_manager_configuration_content_types::application::home-page.home-page	{"uid":"application::home-page.home-page","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"sections":{"edit":{"label":"Sections","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Sections","searchable":false,"sortable":false}},"motto":{"edit":{"label":"Motto","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Motto","searchable":false,"sortable":false}},"extraContent":{"edit":{"label":"ExtraContent","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ExtraContent","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","created_at","updated_at"],"editRelations":[],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"sections","size":12}],[{"name":"motto","size":12}],[{"name":"extraContent","size":12}]]}}	object		
60	plugin_content_manager_configuration_content_types::application::product-filters.product-filters	{"uid":"application::product-filters.product-filters","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"filter_name","defaultSortBy":"filter_name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"filter_name":{"edit":{"label":"Filter_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Filter_name","searchable":true,"sortable":true}},"slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","filter_name","slug","created_at"],"editRelations":[],"edit":[[{"name":"filter_name","size":6},{"name":"slug","size":6}]]}}	object		
70	plugin_content_manager_configuration_content_types::application::testimonial.testimonial	{"uid":"application::testimonial.testimonial","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"author_name","defaultSortBy":"author_name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"author_name":{"edit":{"label":"Author_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Author_name","searchable":true,"sortable":true}},"text":{"edit":{"label":"Text","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Text","searchable":false,"sortable":false}},"author_image":{"edit":{"label":"Author_image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Author_image","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","author_name","author_image","created_at"],"editRelations":[],"edit":[[{"name":"author_name","size":6}],[{"name":"text","size":12}],[{"name":"author_image","size":6}]]}}	object		
62	plugin_content_manager_configuration_content_types::application::product-secondary-categories.product-secondary-categories	{"uid":"application::product-secondary-categories.product-secondary-categories","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"categ_name","defaultSortBy":"categ_name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"categ_name":{"edit":{"label":"Categ_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Categ_name","searchable":true,"sortable":true}},"slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"products":{"edit":{"label":"Products","description":"","placeholder":"","visible":true,"editable":true,"mainField":"product_name"},"list":{"label":"Products","searchable":false,"sortable":false}},"image":{"edit":{"label":"Image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Image","searchable":false,"sortable":false}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","categ_name","slug","products"],"editRelations":["products"],"edit":[[{"name":"categ_name","size":6},{"name":"slug","size":6}],[{"name":"image","size":6}],[{"name":"description","size":12}]]}}	object		
72	plugin_content_manager_configuration_content_types::strapi::role	{"uid":"strapi::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"code":{"edit":{"label":"Code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Code","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"Users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"editRelations":["users","permissions"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6}]]}}	object		
73	plugin_content_manager_configuration_content_types::strapi::user	{"uid":"strapi::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"Firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"Lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"Username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Username","searchable":true,"sortable":true}},"email":{"edit":{"label":"Email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Email","searchable":true,"sortable":true}},"password":{"edit":{"label":"Password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"ResetPasswordToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ResetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"RegistrationToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"RegistrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"IsActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"IsActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"Roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"Blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"PreferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PreferedLanguage","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"editRelations":["roles"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordToken","size":6}],[{"name":"registrationToken","size":6},{"name":"isActive","size":4}],[{"name":"blocked","size":4},{"name":"preferedLanguage","size":6}]]}}	object		
63	plugin_content_manager_configuration_content_types::application::product.product	{"uid":"application::product.product","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"product_name","defaultSortBy":"product_name","defaultSortOrder":"ASC"},"metadatas":{"product_main_image":{"edit":{"label":"Product_main_image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Product_main_image","searchable":false,"sortable":false}},"product_images":{"edit":{"label":"Product_images","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Product_images","searchable":false,"sortable":false}},"price":{"edit":{"label":"Price","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Price","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"slug":{"edit":{"label":"Slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Slug","searchable":true,"sortable":true}},"product_description":{"edit":{"label":"Product_description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Product_description","searchable":false,"sortable":false}},"product_main_categories":{"edit":{"label":"Product_main_categories","description":"","placeholder":"","visible":true,"editable":true,"mainField":"categ_name"},"list":{"label":"Product_main_categories","searchable":false,"sortable":false}},"discounts":{"edit":{"label":"Discounts","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Discounts","searchable":false,"sortable":false}},"is_digital_product":{"edit":{"label":"Is_digital_product","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Is_digital_product","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}},"product_secondary_categories":{"edit":{"label":"Product_secondary_categories","description":"","placeholder":"","visible":true,"editable":true,"mainField":"categ_name"},"list":{"label":"Product_secondary_categories","searchable":false,"sortable":false}},"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"DiscountPercentage":{"edit":{"label":"DiscountPercentage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"DiscountPercentage","searchable":true,"sortable":true}},"product_name":{"edit":{"label":"Product_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Product_name","searchable":true,"sortable":true}},"SKU":{"edit":{"label":"SKU","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"SKU","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"product_name","size":6},{"name":"slug","size":6}],[{"name":"SKU","size":6},{"name":"is_digital_product","size":4}],[{"name":"price","size":4},{"name":"DiscountPercentage","size":4}],[{"name":"product_main_image","size":6},{"name":"product_images","size":6}],[{"name":"product_description","size":12}]],"editRelations":["product_main_categories","product_secondary_categories","discounts"],"list":["id","product_name","product_main_image","product_images"]}}	object		
79	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":false,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object		
65	plugin_content_manager_configuration_content_types::application::services.services	{"uid":"application::services.services","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"sections":{"edit":{"label":"Sections","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Sections","searchable":false,"sortable":false}},"motto":{"edit":{"label":"Motto","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Motto","searchable":false,"sortable":false}},"extraContent":{"edit":{"label":"ExtraContent","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ExtraContent","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","created_at","updated_at"],"editRelations":[],"edit":[[{"name":"title","size":6}],[{"name":"content","size":12}],[{"name":"sections","size":12}],[{"name":"motto","size":12}],[{"name":"extraContent","size":12}]]}}	object		
75	plugin_content_manager_configuration_content_types::plugins::upload.file	{"uid":"plugins::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"AlternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"AlternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"Caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"Width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Width","searchable":true,"sortable":true}},"height":{"edit":{"label":"Height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"Formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"Hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"Ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"Mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"Size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Size","searchable":true,"sortable":true}},"url":{"edit":{"label":"Url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"PreviewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"PreviewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"Provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"Provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Provider_metadata","searchable":false,"sortable":false}},"related":{"edit":{"label":"Related","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Related","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"editRelations":["related"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}]]}}	object		
77	plugin_content_manager_configuration_content_types::plugins::users-permissions.role	{"uid":"plugins::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"description":{"edit":{"label":"Description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Description","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"Permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"type"},"list":{"label":"Permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"Users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"Users","searchable":false,"sortable":false}}},"layouts":{"list":["id","name","description","type"],"editRelations":["permissions","users"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6}]]}}	object		
67	plugin_content_manager_configuration_content_types::application::social-media-account.social-media-account	{"uid":"application::social-media-account.social-media-account","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"URL","defaultSortBy":"URL","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"URL":{"edit":{"label":"URL","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"URL","searchable":true,"sortable":true}},"image":{"edit":{"label":"Image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Image","searchable":false,"sortable":false}},"title":{"edit":{"label":"Title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Title","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"edit":[[{"name":"title","size":6},{"name":"URL","size":6}],[{"name":"image","size":6}]],"editRelations":[],"list":["id","URL","image","title"]}}	object		
71	plugin_content_manager_configuration_content_types::strapi::permission	{"uid":"strapi::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"Subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"Properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"Conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"editRelations":["role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}]]}}	object		
76	plugin_content_manager_configuration_content_types::plugins::users-permissions.permission	{"uid":"plugins::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"type","defaultSortBy":"type","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"type":{"edit":{"label":"Type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Type","searchable":true,"sortable":true}},"controller":{"edit":{"label":"Controller","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Controller","searchable":true,"sortable":true}},"action":{"edit":{"label":"Action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Action","searchable":true,"sortable":true}},"enabled":{"edit":{"label":"Enabled","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Enabled","searchable":true,"sortable":true}},"policy":{"edit":{"label":"Policy","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Policy","searchable":true,"sortable":true}},"role":{"edit":{"label":"Role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"Role","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","controller","action"],"editRelations":["role"],"edit":[[{"name":"type","size":6},{"name":"controller","size":6}],[{"name":"action","size":6},{"name":"enabled","size":4}],[{"name":"policy","size":6}]]}}	object		
21	model_def_application::product-secondary-categories.product-secondary-categories	{"uid":"application::product-secondary-categories.product-secondary-categories","collectionName":"product_secondary_categories","kind":"collectionType","info":{"name":"ProductSecondaryCategories","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"categ_name":{"type":"string","unique":true},"slug":{"type":"uid","targetField":"categ_name"},"products":{"via":"product_secondary_categories","collection":"product","dominant":true,"attribute":"product","column":"id","isVirtual":true},"image":{"model":"file","via":"related","allowedTypes":["images","files","videos"],"plugin":"upload","required":false,"pluginOptions":{}},"description":{"type":"richtext"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
24	model_def_application::services.services	{"uid":"application::services.services","collectionName":"services","kind":"singleType","info":{"name":"Services","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","unique":true},"content":{"type":"component","repeatable":false,"component":"content.page-content"},"sections":{"type":"component","repeatable":true,"component":"section.page-section"},"motto":{"type":"richtext"},"extraContent":{"type":"richtext"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
12	model_def_application::cookie-policy.cookie-policy	{"uid":"application::cookie-policy.cookie-policy","collectionName":"cookie_policies","kind":"singleType","info":{"name":"cookie-policy","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","unique":true},"content":{"type":"component","repeatable":false,"component":"content.page-content"},"motto":{"type":"richtext"},"extraContent":{"type":"richtext"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
14	model_def_application::events-page.events-page	{"uid":"application::events-page.events-page","collectionName":"events_pages","kind":"singleType","info":{"name":"EventsPage","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","unique":true},"content":{"type":"component","repeatable":false,"component":"content.page-content"},"motto":{"type":"richtext"},"extraContent":{"type":"richtext"},"sections":{"type":"component","repeatable":true,"component":"section.page-section"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
20	model_def_application::product-main-categories.product-main-categories	{"uid":"application::product-main-categories.product-main-categories","collectionName":"product_main_categories","kind":"collectionType","info":{"name":"ProductMainCategories","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"categ_name":{"type":"string","unique":true},"slug":{"type":"uid"},"products":{"via":"product_main_categories","collection":"product","dominant":true,"attribute":"product","column":"id","isVirtual":true},"image":{"model":"file","via":"related","allowedTypes":["images","files","videos"],"plugin":"upload","required":false,"pluginOptions":{}},"description":{"type":"richtext"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
43	plugin_content_manager_configuration_components::testimonials.testimonials	{"uid":"testimonials.testimonials","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"author","defaultSortBy":"author","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":false,"sortable":false}},"author":{"edit":{"label":"Author","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Author","searchable":true,"sortable":true}},"content":{"edit":{"label":"Content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Content","searchable":false,"sortable":false}},"author_image":{"edit":{"label":"Author_image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Author_image","searchable":false,"sortable":false}},"date_added":{"edit":{"label":"Date_added","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Date_added","searchable":true,"sortable":true}},"rating":{"edit":{"label":"Rating","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Rating","searchable":true,"sortable":true}}},"layouts":{"list":["id","author","author_image","date_added"],"edit":[[{"name":"author","size":6}],[{"name":"content","size":12}],[{"name":"author_image","size":6},{"name":"date_added","size":6}],[{"name":"rating","size":4}]],"editRelations":[]},"isComponent":true}	object		
40	plugin_content_manager_configuration_components::section.page-section	{"uid":"section.page-section","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"section_title","defaultSortBy":"section_title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":false,"sortable":false}},"section_content":{"edit":{"label":"Section_content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Section_content","searchable":false,"sortable":false}},"section_title":{"edit":{"label":"Section_title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Section_title","searchable":true,"sortable":true}},"section_image":{"edit":{"label":"Section_image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Section_image","searchable":false,"sortable":false}}},"layouts":{"list":["id","section_title","section_image"],"edit":[[{"name":"section_title","size":6},{"name":"section_image","size":6}],[{"name":"section_content","size":12}]],"editRelations":[]},"isComponent":true}	object		
6	model_def_application::about.about	{"uid":"application::about.about","collectionName":"aboutuses","kind":"singleType","info":{"name":"About","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","unique":true},"sections":{"type":"component","repeatable":true,"component":"section.page-section"},"content":{"type":"component","repeatable":false,"component":"content.page-content"},"motto":{"type":"richtext"},"extraContent":{"type":"richtext"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
22	model_def_application::product.product	{"uid":"application::product.product","collectionName":"products","kind":"collectionType","info":{"name":"Product","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"product_name":{"type":"string","unique":true},"product_main_image":{"model":"file","via":"related","allowedTypes":["images","files","videos"],"plugin":"upload","required":false,"pluginOptions":{}},"product_images":{"collection":"file","via":"related","allowedTypes":["images","files","videos"],"plugin":"upload","required":false,"pluginOptions":{}},"is_digital_product":{"type":"boolean","default":false},"product_description":{"type":"richtext"},"slug":{"type":"uid","targetField":"product_name"},"product_main_categories":{"via":"products","collection":"product-main-categories","attribute":"product-main-category","column":"id","isVirtual":true},"price":{"type":"decimal"},"product_secondary_categories":{"via":"products","collection":"product-secondary-categories","attribute":"product-secondary-category","column":"id","isVirtual":true},"SKU":{"type":"string","unique":true,"required":true},"discounts":{"via":"products","collection":"discounts","attribute":"discount","column":"id","isVirtual":true},"DiscountPercentage":{"type":"decimal"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
27	model_def_application::team-member.team-member	{"uid":"application::team-member.team-member","collectionName":"team_members","kind":"collectionType","info":{"name":"teamMember","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"member_name":{"type":"string","unique":true},"member_image":{"model":"file","via":"related","allowedTypes":["images","files","videos"],"plugin":"upload","required":false,"pluginOptions":{}},"member_description":{"type":"richtext"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
1	model_def_strapi::core-store	{"uid":"strapi::core-store","collectionName":"core_store","info":{"name":"core_store","description":""},"options":{"timestamps":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"key":{"type":"string"},"value":{"type":"text"},"type":{"type":"string"},"environment":{"type":"string"},"tag":{"type":"string"}}}	object	\N	\N
81	model_def_application::discounts.discounts	{"uid":"application::discounts.discounts","collectionName":"discounts","kind":"collectionType","info":{"name":"discounts","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string","unique":true},"products":{"via":"discounts","collection":"product","dominant":true,"attribute":"product","column":"id","isVirtual":true},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
82	plugin_content_manager_configuration_content_types::application::discounts.discounts	{"uid":"application::discounts.discounts","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"Id","searchable":true,"sortable":true}},"name":{"edit":{"label":"Name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"Name","searchable":true,"sortable":true}},"products":{"edit":{"label":"Products","description":"","placeholder":"","visible":true,"editable":true,"mainField":"product_name"},"list":{"label":"Products","searchable":false,"sortable":false}},"created_at":{"edit":{"label":"Created_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Created_at","searchable":true,"sortable":true}},"updated_at":{"edit":{"label":"Updated_at","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"Updated_at","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","products"],"edit":[[{"name":"name","size":6}]],"editRelations":["products"]}}	object		
36	model_def_plugins::users-permissions.permission	{"uid":"plugins::users-permissions.permission","collectionName":"users-permissions_permission","kind":"collectionType","info":{"name":"permission","description":""},"options":{"timestamps":false},"pluginOptions":{"content-manager":{"visible":false}},"attributes":{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
33	model_def_strapi::user	{"uid":"strapi::user","collectionName":"strapi_administrator","kind":"collectionType","info":{"name":"User","description":""},"options":{"timestamps":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"collection":"role","collectionName":"strapi_users_roles","via":"users","dominant":true,"plugin":"admin","configurable":false,"private":true,"attribute":"role","column":"id","isVirtual":true},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false}}}	object	\N	\N
28	model_def_application::terms-conditions.terms-conditions	{"uid":"application::terms-conditions.terms-conditions","collectionName":"terms_conditions","kind":"singleType","info":{"name":"Terms-Conditions","description":""},"options":{"increments":true,"timestamps":["created_at","updated_at"],"draftAndPublish":true},"pluginOptions":{},"attributes":{"title":{"type":"string","unique":true},"content":{"type":"component","repeatable":false,"component":"content.page-content"},"motto":{"type":"richtext"},"extraContent":{"type":"richtext"},"published_at":{"type":"datetime","configurable":false,"writable":true,"visible":false},"created_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true},"updated_by":{"model":"user","plugin":"admin","configurable":false,"writable":false,"visible":false,"private":true}}}	object	\N	\N
\.


--
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.discounts (id, name, "NewPrice", published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
2	March Madness	\N	2021-09-29 22:20:50.928+01	1	1	2021-09-29 22:20:49.798+01	2021-09-29 22:20:50.947+01
1	Back to School	\N	2021-09-29 22:20:53.416+01	1	1	2021-09-29 22:20:40.159+01	2021-09-29 22:20:53.429+01
\.


--
-- Data for Name: discounts_products__products_discounts; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.discounts_products__products_discounts (id, discount_id, product_id) FROM stdin;
1	2	1
2	1	2
3	2	3
\.


--
-- Data for Name: domain_experts; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.domain_experts (id, title, url, published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	National Association of Designated Leads	https://www.nadsl.co.uk/	2021-09-29 22:22:07.041+01	1	1	2021-09-29 22:22:05.104+01	2021-09-29 22:22:07.062+01
\.


--
-- Data for Name: events_pages; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.events_pages (id, title, motto, "extraContent", published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Past and Future events	\N	\N	2021-09-29 21:39:59.049+01	1	1	2021-09-29 21:39:57.902+01	2021-09-29 21:39:59.077+01
\.


--
-- Data for Name: events_pages_components; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.events_pages_components (id, field, "order", component_type, component_id, events_page_id) FROM stdin;
1	content	1	components_page_content_page_contents	7	1
\.


--
-- Data for Name: faq_pages; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.faq_pages (id, title, motto, "extraContent", published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	FAQ	\N	\N	2021-09-29 21:39:28.542+01	1	1	2021-09-29 21:39:26.981+01	2021-09-29 21:39:28.559+01
\.


--
-- Data for Name: faq_pages_components; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.faq_pages_components (id, field, "order", component_type, component_id, faq_page_id) FROM stdin;
1	content	1	components_page_content_page_contents	6	1
\.


--
-- Data for Name: home_pages; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.home_pages (id, title, motto, "extraContent", published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	BlackStream Education	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n 	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.	2021-09-29 21:39:11.739+01	1	1	2021-09-29 21:39:10.51+01	2021-09-30 20:43:39.508+01
\.


--
-- Data for Name: home_pages_components; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.home_pages_components (id, field, "order", component_type, component_id, home_page_id) FROM stdin;
1	content	1	components_page_content_page_contents	5	1
2	sections	1	components_page_section_page_sections	9	1
3	sections	2	components_page_section_page_sections	10	1
4	sections	3	components_page_section_page_sections	11	1
5	sections	4	components_page_section_page_sections	14	1
6	sections	5	components_page_section_page_sections	15	1
\.


--
-- Data for Name: i18n_locales; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.i18n_locales (id, name, code, created_by, updated_by, created_at, updated_at) FROM stdin;
1	English (en)	en	\N	\N	2021-09-29 21:16:47.905+01	2021-09-29 21:16:47.905+01
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.messages (id, name, company, email, content, subject, published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: privacy_policies; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.privacy_policies (id, title, motto, "extraContent", published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Privacy Policies	\nNon cumque accusamus cum iusto aliquam rem ducimus consectetur aut voluptatem pariatur et voluptates facilis consequatur dolorem et libero velit. Eos molestiae quibusdam est sunt cumque eum quod fugiat non laboriosam ullam. Et molestiae adipisci sed dolorem laborum et molestias commodi et omnis quibusdam in repudiandae consequatur 33 placeat eaque.\n\nEt nihil aliquam ea exercitationem sequi est placeat fugiat est quia aperiam hic dolorem omnis aut exercitationem soluta! Aut consequuntur iure qui natus quam et perspiciatis blanditiis rem expedita omnis. Id sunt porro a quos illo 33 labore eveniet. In dolor iusto sed sunt sequi quo obcaecati quod cum blanditiis quam sed tenetur illum et atque aliquam.	\N	2021-09-29 21:36:37.672+01	1	1	2021-09-29 21:36:36.487+01	2021-09-29 21:36:37.703+01
\.


--
-- Data for Name: privacy_policies_components; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.privacy_policies_components (id, field, "order", component_type, component_id, privacy_policy_id) FROM stdin;
1	content	1	components_page_content_page_contents	4	1
\.


--
-- Data for Name: product_filters; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.product_filters (id, filter_name, slug, published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_main_categories; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.product_main_categories (id, categ_name, slug, description, published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	stationery	stationery	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	2021-09-29 22:09:04.26+01	1	1	2021-09-29 22:09:02.217+01	2021-09-29 22:09:04.28+01
2	books	books	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	2021-09-29 22:09:21.378+01	1	1	2021-09-29 22:09:20.033+01	2021-09-29 22:09:21.405+01
\.


--
-- Data for Name: product_secondary_categories; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.product_secondary_categories (id, categ_name, slug, description, published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Pencils	pencils	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	2021-09-29 22:09:39.341+01	1	1	2021-09-29 22:09:37.518+01	2021-09-29 22:09:39.36+01
2	forms	forms	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	2021-09-29 22:09:56.456+01	1	1	2021-09-29 22:09:55.197+01	2021-09-29 22:09:56.473+01
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.products (id, product_name, is_digital_product, product_description, slug, price, "SKU", published_at, created_by, updated_by, created_at, updated_at, "DiscountPercent", "DiscountPercentage") FROM stdin;
2	calendar	t	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	calendar	7.00	calendar123	2021-09-29 22:24:03.001+01	1	1	2021-09-29 22:24:01.304+01	2021-09-30 23:38:50.918+01	\N	5.00
3	pencil	f	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	pencil	2.50	pencil123	2021-09-29 22:24:35.069+01	1	1	2021-09-29 22:24:33.644+01	2021-09-30 21:08:23.284+01	\N	\N
1	worksheet 	t	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	worksheet	15.00	worksheet123	2021-09-29 22:23:23.339+01	1	1	2021-09-29 22:23:21.701+01	2021-09-30 21:08:16.294+01	\N	10.00
\.


--
-- Data for Name: products_product_main_categories__product_main_categories_produ; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.products_product_main_categories__product_main_categories_produ (id, "product-main-category_id", product_id) FROM stdin;
1	1	1
2	1	2
3	1	3
5	2	1
6	2	3
\.


--
-- Data for Name: products_product_secondary_categories__product_secondary_catego; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.products_product_secondary_categories__product_secondary_catego (id, "product-secondary-category_id", product_id) FROM stdin;
1	1	1
3	1	3
4	2	1
5	2	3
6	1	2
\.


--
-- Data for Name: safe_guardings; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.safe_guardings (id, title, motto, "extraContent", published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Safeguarding	\N	\N	2021-09-29 21:34:45.365+01	1	1	2021-09-29 21:34:44.192+01	2021-09-29 21:34:45.412+01
\.


--
-- Data for Name: safe_guardings_components; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.safe_guardings_components (id, field, "order", component_type, component_id, safe_guarding_id) FROM stdin;
1	sections	1	components_page_section_page_sections	6	1
2	sections	2	components_page_section_page_sections	7	1
3	sections	3	components_page_section_page_sections	8	1
4	content	1	components_page_content_page_contents	3	1
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.services (id, title, motto, "extraContent", published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Services	\N	\N	2021-09-29 21:29:35.278+01	1	1	2021-09-29 21:29:34.082+01	2021-09-29 21:32:47.345+01
\.


--
-- Data for Name: services_components; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.services_components (id, field, "order", component_type, component_id, service_id) FROM stdin;
1	content	1	components_page_content_page_contents	2	1
2	sections	1	components_page_section_page_sections	1	1
3	sections	2	components_page_section_page_sections	2	1
4	sections	3	components_page_section_page_sections	3	1
5	sections	4	components_page_section_page_sections	4	1
6	sections	5	components_page_section_page_sections	5	1
\.


--
-- Data for Name: single_events; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.single_events (id, description, start_date, end_date, slug, title, event_type, published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.\nEa enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.\nEa enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.\nEa enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	2021-09-28 12:00:00+01	2021-10-28 12:00:00+01	first-event	first event	school	2021-09-29 21:55:11.725+01	1	1	2021-09-29 21:55:10.416+01	2021-09-29 21:55:11.74+01
2	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.\n\nEa enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.\nEa enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	2021-09-30 12:00:00+01	2021-10-01 12:00:00+01	second-event	second event	party	2021-09-29 21:55:33.195+01	1	1	2021-09-29 21:55:31.934+01	2021-09-29 21:55:33.212+01
3	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	2021-10-05 12:00:00+01	2021-10-05 13:00:00+01	thirds-event	thirds event	trip	2021-09-29 21:56:05.153+01	1	1	2021-09-29 21:56:03.97+01	2021-09-29 21:56:05.164+01
\.


--
-- Data for Name: social_media_accounts; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.social_media_accounts (id, "URL", title, published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	https://twitter.com/	Twitter	2021-09-29 21:52:35.311+01	1	1	2021-09-29 21:52:33.565+01	2021-09-29 21:52:35.328+01
2	https://facebook.com	Facebook	2021-09-29 21:53:28.586+01	1	1	2021-09-29 21:53:27.145+01	2021-09-29 21:53:28.599+01
3	https://tiktok.com	TikTok	2021-09-29 21:53:46.806+01	1	1	2021-09-29 21:53:40.324+01	2021-09-29 21:53:46.819+01
\.


--
-- Data for Name: strapi_administrator; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_administrator (id, firstname, lastname, username, email, password, "resetPasswordToken", "registrationToken", "isActive", blocked, "preferedLanguage") FROM stdin;
3	editor	editor	\N	editor@example.com	$2a$10$DCqRn0I2VckhH3TheC3rPOi03KhY0nyQf/x9WFPZRkgrBtIPoBmR.	\N	\N	t	\N	\N
2	second 	author	author@example.com	author@example.com	$2a$10$7tl1/6fQp.fPB3LVTVaq2ug.LR.NtI8pblAtumE6GRTepadsLAohW	\N	\N	t	\N	\N
1	john	Mica	john@threebros.design	john@threebros.design	$2a$10$x9kl.gwu1Dl3bqCeS2jGP.E7RDWlJ9K9SPkY2kPA9k3BFXbulL3oa	\N	\N	t	\N	\N
\.


--
-- Data for Name: strapi_permission; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_permission (id, action, subject, properties, conditions, role, created_at, updated_at) FROM stdin;
1	plugins::content-manager.explorer.create	application::about.about	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:53.84+01	2021-09-29 21:16:53.884+01
2	plugins::content-manager.explorer.create	application::article-categories.article-categories	{"fields": ["category", "articles", "slug"]}	[]	2	2021-09-29 21:16:53.84+01	2021-09-29 21:16:53.884+01
3	plugins::content-manager.explorer.create	application::article-tag.article-tag	{"fields": ["tag_name", "articles", "slug"]}	[]	2	2021-09-29 21:16:53.843+01	2021-09-29 21:16:53.884+01
4	plugins::content-manager.explorer.create	application::article.article	{"fields": ["title", "slug", "content.subtitle", "content.header_image", "content.content", "unpublish_date", "article_tags", "article_categories", "description", "author", "featured", "future_publish_date"]}	[]	2	2021-09-29 21:16:53.843+01	2021-09-29 21:16:53.888+01
5	plugins::content-manager.explorer.create	application::articles-page.articles-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:53.843+01	2021-09-29 21:16:53.888+01
8	plugins::content-manager.explorer.create	application::domain-expert.domain-expert	{"fields": ["title", "url", "image"]}	[]	2	2021-09-29 21:16:53.845+01	2021-09-29 21:16:53.889+01
6	plugins::content-manager.explorer.create	application::contact.contact	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:53.843+01	2021-09-29 21:16:53.893+01
9	plugins::content-manager.explorer.create	application::events-page.events-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent", "sections.section_content", "sections.section_title", "sections.section_image"]}	[]	2	2021-09-29 21:16:53.845+01	2021-09-29 21:16:53.893+01
7	plugins::content-manager.explorer.create	application::cookie-policy.cookie-policy	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:53.844+01	2021-09-29 21:16:53.893+01
10	plugins::content-manager.explorer.create	application::faq-page.faq-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:53.845+01	2021-09-29 21:16:53.899+01
11	plugins::content-manager.explorer.create	application::home-page.home-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:53.922+01	2021-09-29 21:16:53.996+01
2136	plugins::content-manager.explorer.delete	application::about.about	{}	[]	1	2021-09-30 23:47:49.943+01	2021-09-30 23:47:49.959+01
12	plugins::content-manager.explorer.create	application::message.message	{"fields": ["name", "company", "email", "content", "subject"]}	[]	2	2021-09-29 21:16:53.949+01	2021-09-29 21:16:54.012+01
13	plugins::content-manager.explorer.create	application::privacy-policies.privacy-policies	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:53.95+01	2021-09-29 21:16:54.012+01
14	plugins::content-manager.explorer.create	application::product-filters.product-filters	{"fields": ["filter_name", "slug"]}	[]	2	2021-09-29 21:16:53.95+01	2021-09-29 21:16:54.012+01
15	plugins::content-manager.explorer.create	application::product-main-categories.product-main-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	[]	2	2021-09-29 21:16:53.954+01	2021-09-29 21:16:54.013+01
16	plugins::content-manager.explorer.create	application::product-secondary-categories.product-secondary-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	[]	2	2021-09-29 21:16:53.987+01	2021-09-29 21:16:54.017+01
17	plugins::content-manager.explorer.create	application::product.product	{"fields": ["product_name", "product_main_image", "product_images", "is_digital_product", "product_description", "slug", "product_main_categories", "price", "product_secondary_categories", "SKU"]}	[]	2	2021-09-29 21:16:53.988+01	2021-09-29 21:16:54.017+01
20	plugins::content-manager.explorer.create	application::single-event.single-event	{"fields": ["description", "header_image", "start_date", "end_date", "slug", "title", "event_type"]}	[]	2	2021-09-29 21:16:54.001+01	2021-09-29 21:16:54.028+01
22	plugins::content-manager.explorer.create	application::team-member.team-member	{"fields": ["member_name", "member_image", "member_description"]}	[]	2	2021-09-29 21:16:54.047+01	2021-09-29 21:16:54.113+01
21	plugins::content-manager.explorer.create	application::social-media-account.social-media-account	{"fields": ["URL", "image", "title"]}	[]	2	2021-09-29 21:16:54.044+01	2021-09-29 21:16:54.114+01
30	plugins::content-manager.explorer.read	application::contact.contact	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.114+01	2021-09-29 21:16:54.142+01
32	plugins::content-manager.explorer.read	application::domain-expert.domain-expert	{"fields": ["title", "url", "image"]}	[]	2	2021-09-29 21:16:54.199+01	2021-09-29 21:16:54.235+01
37	plugins::content-manager.explorer.read	application::privacy-policies.privacy-policies	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.212+01	2021-09-29 21:16:54.255+01
40	plugins::content-manager.explorer.read	application::product-secondary-categories.product-secondary-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	[]	2	2021-09-29 21:16:54.236+01	2021-09-29 21:16:54.288+01
47	plugins::content-manager.explorer.read	application::terms-conditions.terms-conditions	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.339+01	2021-09-29 21:16:54.389+01
48	plugins::content-manager.explorer.read	application::testimonial.testimonial	{"fields": ["author_name", "text", "author_image"]}	[]	2	2021-09-29 21:16:54.339+01	2021-09-29 21:16:54.402+01
50	plugins::content-manager.explorer.update	application::article-categories.article-categories	{"fields": ["category", "articles", "slug"]}	[]	2	2021-09-29 21:16:54.372+01	2021-09-29 21:16:54.425+01
57	plugins::content-manager.explorer.update	application::events-page.events-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent", "sections.section_content", "sections.section_title", "sections.section_image"]}	[]	2	2021-09-29 21:16:54.458+01	2021-09-29 21:16:54.512+01
60	plugins::content-manager.explorer.update	application::message.message	{"fields": ["name", "company", "email", "content", "subject"]}	[]	2	2021-09-29 21:16:54.503+01	2021-09-29 21:16:54.535+01
381	admin::webhooks.update	\N	{}	[]	1	2021-09-29 21:16:58.461+01	2021-09-29 21:16:58.512+01
385	admin::users.update	\N	{}	[]	1	2021-09-29 21:16:58.506+01	2021-09-29 21:16:58.53+01
388	admin::roles.read	\N	{}	[]	1	2021-09-29 21:16:58.551+01	2021-09-29 21:16:58.571+01
389	admin::roles.update	\N	{}	[]	1	2021-09-29 21:16:58.554+01	2021-09-29 21:16:58.571+01
18	plugins::content-manager.explorer.create	application::safeguarding.safeguarding	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:53.988+01	2021-09-29 21:16:54.017+01
28	plugins::content-manager.explorer.read	application::article.article	{"fields": ["title", "slug", "content.subtitle", "content.header_image", "content.content", "unpublish_date", "article_tags", "article_categories", "description", "author", "featured", "future_publish_date"]}	[]	2	2021-09-29 21:16:54.056+01	2021-09-29 21:16:54.129+01
33	plugins::content-manager.explorer.read	application::events-page.events-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent", "sections.section_content", "sections.section_title", "sections.section_image"]}	[]	2	2021-09-29 21:16:54.211+01	2021-09-29 21:16:54.254+01
42	plugins::content-manager.explorer.read	application::safeguarding.safeguarding	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.334+01	2021-09-29 21:16:54.372+01
56	plugins::content-manager.explorer.update	application::domain-expert.domain-expert	{"fields": ["title", "url", "image"]}	[]	2	2021-09-29 21:16:54.454+01	2021-09-29 21:16:54.502+01
65	plugins::content-manager.explorer.update	application::product.product	{"fields": ["product_name", "product_main_image", "product_images", "is_digital_product", "product_description", "slug", "product_main_categories", "price", "product_secondary_categories", "SKU"]}	[]	2	2021-09-29 21:16:54.556+01	2021-09-29 21:16:54.624+01
76	plugins::content-manager.explorer.delete	application::article.article	{}	[]	2	2021-09-29 21:16:54.726+01	2021-09-29 21:16:54.756+01
86	plugins::content-manager.explorer.delete	application::product-filters.product-filters	{}	[]	2	2021-09-29 21:16:54.816+01	2021-09-29 21:16:54.853+01
95	plugins::content-manager.explorer.delete	application::testimonial.testimonial	{}	[]	2	2021-09-29 21:16:54.892+01	2021-09-29 21:16:54.919+01
104	plugins::content-manager.explorer.publish	application::events-page.events-page	{}	[]	2	2021-09-29 21:16:54.963+01	2021-09-29 21:16:54.992+01
112	plugins::content-manager.explorer.publish	application::product-secondary-categories.product-secondary-categories	{}	[]	2	2021-09-29 21:16:55.047+01	2021-09-29 21:16:55.077+01
121	plugins::upload.read	\N	{}	[]	2	2021-09-29 21:16:55.141+01	2021-09-29 21:16:55.169+01
129	plugins::content-manager.explorer.create	application::articles-page.articles-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.265+01	2021-09-29 21:16:55.33+01
141	plugins::content-manager.explorer.create	application::product-secondary-categories.product-secondary-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.379+01	2021-09-29 21:16:55.407+01
151	plugins::content-manager.explorer.read	application::article-categories.article-categories	{"fields": ["category", "articles", "slug"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.462+01	2021-09-29 21:16:55.537+01
160	plugins::content-manager.explorer.read	application::home-page.home-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.689+01	2021-09-29 21:16:55.721+01
166	plugins::content-manager.explorer.read	application::product.product	{"fields": ["product_name", "product_main_image", "product_images", "is_digital_product", "product_description", "slug", "product_main_categories", "price", "product_secondary_categories", "SKU"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.81+01	2021-09-29 21:16:55.836+01
176	plugins::content-manager.explorer.update	application::article-tag.article-tag	{"fields": ["tag_name", "articles", "slug"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.92+01	2021-09-29 21:16:56.088+01
193	plugins::content-manager.explorer.update	application::single-event.single-event	{"fields": ["description", "header_image", "start_date", "end_date", "slug", "title", "event_type"]}	["admin::is-creator"]	3	2021-09-29 21:16:56.227+01	2021-09-29 21:16:56.346+01
200	plugins::content-manager.explorer.delete	application::article-tag.article-tag	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.464+01	2021-09-29 21:16:56.52+01
207	plugins::content-manager.explorer.delete	application::faq-page.faq-page	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.61+01	2021-09-29 21:16:56.651+01
219	plugins::content-manager.explorer.delete	application::team-member.team-member	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.719+01	2021-09-29 21:16:56.824+01
230	plugins::content-manager.explorer.create	application::article.article	{"fields": ["title", "slug", "content.subtitle", "content.header_image", "content.content", "unpublish_date", "article_tags", "article_categories", "description", "author", "featured", "future_publish_date"]}	[]	1	2021-09-29 21:16:57.014+01	2021-09-29 21:16:57.037+01
239	plugins::content-manager.explorer.create	application::privacy-policies.privacy-policies	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.071+01	2021-09-29 21:16:57.095+01
253	plugins::content-manager.explorer.read	application::article.article	{"fields": ["title", "slug", "content.subtitle", "content.header_image", "content.content", "unpublish_date", "article_tags", "article_categories", "description", "author", "featured", "future_publish_date"]}	[]	1	2021-09-29 21:16:57.139+01	2021-09-29 21:16:57.162+01
260	plugins::content-manager.explorer.read	application::domain-expert.domain-expert	{"fields": ["title", "url", "image"]}	[]	1	2021-09-29 21:16:57.198+01	2021-09-29 21:16:57.227+01
2137	plugins::content-manager.explorer.delete	application::article-categories.article-categories	{}	[]	1	2021-09-30 23:47:49.943+01	2021-09-30 23:47:49.96+01
278	plugins::content-manager.explorer.update	application::article-categories.article-categories	{"fields": ["category", "articles", "slug"]}	[]	1	2021-09-29 21:16:57.393+01	2021-09-29 21:16:57.435+01
292	plugins::content-manager.explorer.update	application::product-secondary-categories.product-secondary-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	[]	1	2021-09-29 21:16:57.482+01	2021-09-29 21:16:57.508+01
298	plugins::content-manager.explorer.update	application::terms-conditions.terms-conditions	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.545+01	2021-09-29 21:16:57.565+01
2150	plugins::content-manager.explorer.delete	application::product-main-categories.product-main-categories	{}	[]	1	2021-09-30 23:47:49.993+01	2021-09-30 23:47:50.009+01
2158	plugins::content-manager.explorer.delete	application::team-member.team-member	{}	[]	1	2021-09-30 23:47:50.037+01	2021-09-30 23:47:50.053+01
375	plugins::users-permissions.advanced-settings.update	\N	{}	[]	1	2021-09-29 21:16:58.378+01	2021-09-29 21:16:58.444+01
2174	plugins::content-manager.explorer.publish	application::message.message	{}	[]	1	2021-09-30 23:47:50.086+01	2021-09-30 23:47:50.107+01
19	plugins::content-manager.explorer.create	application::services.services	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:53.996+01	2021-09-29 21:16:54.022+01
29	plugins::content-manager.explorer.read	application::articles-page.articles-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.062+01	2021-09-29 21:16:54.136+01
39	plugins::content-manager.explorer.read	application::product-main-categories.product-main-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	[]	2	2021-09-29 21:16:54.224+01	2021-09-29 21:16:54.282+01
49	plugins::content-manager.explorer.update	application::about.about	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.367+01	2021-09-29 21:16:54.409+01
59	plugins::content-manager.explorer.update	application::home-page.home-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.464+01	2021-09-29 21:16:54.517+01
69	plugins::content-manager.explorer.update	application::social-media-account.social-media-account	{"fields": ["URL", "image", "title"]}	[]	2	2021-09-29 21:16:54.587+01	2021-09-29 21:16:54.7+01
79	plugins::content-manager.explorer.delete	application::cookie-policy.cookie-policy	{}	[]	2	2021-09-29 21:16:54.738+01	2021-09-29 21:16:54.782+01
88	plugins::content-manager.explorer.delete	application::product-secondary-categories.product-secondary-categories	{}	[]	2	2021-09-29 21:16:54.827+01	2021-09-29 21:16:54.87+01
98	plugins::content-manager.explorer.publish	application::article-categories.article-categories	{}	[]	2	2021-09-29 21:16:54.907+01	2021-09-29 21:16:54.933+01
108	plugins::content-manager.explorer.publish	application::message.message	{}	[]	2	2021-09-29 21:16:54.986+01	2021-09-29 21:16:55.008+01
119	plugins::content-manager.explorer.publish	application::terms-conditions.terms-conditions	{}	[]	2	2021-09-29 21:16:55.086+01	2021-09-29 21:16:55.126+01
133	plugins::content-manager.explorer.create	application::domain-expert.domain-expert	{"fields": ["title", "url", "image"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.268+01	2021-09-29 21:16:55.333+01
140	plugins::content-manager.explorer.create	application::product-main-categories.product-main-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.379+01	2021-09-29 21:16:55.406+01
147	plugins::content-manager.explorer.create	application::team-member.team-member	{"fields": ["member_name", "member_image", "member_description"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.456+01	2021-09-29 21:16:55.506+01
159	plugins::content-manager.explorer.read	application::faq-page.faq-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.685+01	2021-09-29 21:16:55.722+01
175	plugins::content-manager.explorer.update	application::article-categories.article-categories	{"fields": ["category", "articles", "slug"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.82+01	2021-09-29 21:16:55.844+01
180	plugins::content-manager.explorer.update	application::cookie-policy.cookie-policy	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.924+01	2021-09-29 21:16:56.087+01
188	plugins::content-manager.explorer.update	application::product-main-categories.product-main-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	["admin::is-creator"]	3	2021-09-29 21:16:56.212+01	2021-09-29 21:16:56.338+01
198	plugins::content-manager.explorer.delete	application::about.about	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.46+01	2021-09-29 21:16:56.521+01
210	plugins::content-manager.explorer.delete	application::privacy-policies.privacy-policies	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.612+01	2021-09-29 21:16:56.656+01
221	plugins::content-manager.explorer.delete	application::testimonial.testimonial	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.725+01	2021-09-29 21:16:56.833+01
232	plugins::content-manager.explorer.create	application::contact.contact	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.014+01	2021-09-29 21:16:57.038+01
2138	plugins::content-manager.explorer.delete	application::article-tag.article-tag	{}	[]	1	2021-09-30 23:47:49.943+01	2021-09-30 23:47:49.963+01
254	plugins::content-manager.explorer.read	application::article-categories.article-categories	{"fields": ["category", "articles", "slug"]}	[]	1	2021-09-29 21:16:57.139+01	2021-09-29 21:16:57.168+01
264	plugins::content-manager.explorer.read	application::privacy-policies.privacy-policies	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.202+01	2021-09-29 21:16:57.236+01
273	plugins::content-manager.explorer.read	application::team-member.team-member	{"fields": ["member_name", "member_image", "member_description"]}	[]	1	2021-09-29 21:16:57.302+01	2021-09-29 21:16:57.34+01
280	plugins::content-manager.explorer.update	application::article.article	{"fields": ["title", "slug", "content.subtitle", "content.header_image", "content.content", "unpublish_date", "article_tags", "article_categories", "description", "author", "featured", "future_publish_date"]}	[]	1	2021-09-29 21:16:57.412+01	2021-09-29 21:16:57.441+01
287	plugins::content-manager.explorer.update	application::home-page.home-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.48+01	2021-09-29 21:16:57.504+01
297	plugins::content-manager.explorer.update	application::social-media-account.social-media-account	{"fields": ["URL", "image", "title"]}	[]	1	2021-09-29 21:16:57.54+01	2021-09-29 21:16:57.561+01
2149	plugins::content-manager.explorer.delete	application::product-filters.product-filters	{}	[]	1	2021-09-30 23:47:49.992+01	2021-09-30 23:47:50.009+01
2160	plugins::content-manager.explorer.delete	application::testimonial.testimonial	{}	[]	1	2021-09-30 23:47:50.038+01	2021-09-30 23:47:50.058+01
2175	plugins::content-manager.explorer.publish	application::privacy-policies.privacy-policies	{}	[]	1	2021-09-30 23:47:50.09+01	2021-09-30 23:47:50.107+01
2181	plugins::content-manager.explorer.publish	application::single-event.single-event	{}	[]	1	2021-09-30 23:47:50.135+01	2021-09-30 23:47:50.152+01
2186	plugins::content-manager.explorer.publish	application::testimonial.testimonial	{}	[]	1	2021-09-30 23:47:50.176+01	2021-09-30 23:47:50.179+01
358	plugins::upload.settings.read	\N	{}	[]	1	2021-09-29 21:16:58.224+01	2021-09-29 21:16:58.269+01
368	plugins::users-permissions.roles.update	\N	{}	[]	1	2021-09-29 21:16:58.313+01	2021-09-29 21:16:58.358+01
23	plugins::content-manager.explorer.create	application::terms-conditions.terms-conditions	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.047+01	2021-09-29 21:16:54.123+01
35	plugins::content-manager.explorer.read	application::home-page.home-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.212+01	2021-09-29 21:16:54.254+01
44	plugins::content-manager.explorer.read	application::single-event.single-event	{"fields": ["description", "header_image", "start_date", "end_date", "slug", "title", "event_type"]}	[]	2	2021-09-29 21:16:54.338+01	2021-09-29 21:16:54.389+01
52	plugins::content-manager.explorer.update	application::article.article	{"fields": ["title", "slug", "content.subtitle", "content.header_image", "content.content", "unpublish_date", "article_tags", "article_categories", "description", "author", "featured", "future_publish_date"]}	[]	2	2021-09-29 21:16:54.449+01	2021-09-29 21:16:54.473+01
62	plugins::content-manager.explorer.update	application::product-filters.product-filters	{"fields": ["filter_name", "slug"]}	[]	2	2021-09-29 21:16:54.543+01	2021-09-29 21:16:54.587+01
72	plugins::content-manager.explorer.update	application::testimonial.testimonial	{"fields": ["author_name", "text", "author_image"]}	[]	2	2021-09-29 21:16:54.716+01	2021-09-29 21:16:54.749+01
81	plugins::content-manager.explorer.delete	application::events-page.events-page	{}	[]	2	2021-09-29 21:16:54.806+01	2021-09-29 21:16:54.826+01
91	plugins::content-manager.explorer.delete	application::services.services	{}	[]	2	2021-09-29 21:16:54.881+01	2021-09-29 21:16:54.896+01
101	plugins::content-manager.explorer.publish	application::articles-page.articles-page	{}	[]	2	2021-09-29 21:16:54.938+01	2021-09-29 21:16:54.967+01
111	plugins::content-manager.explorer.publish	application::product-main-categories.product-main-categories	{}	[]	2	2021-09-29 21:16:55.027+01	2021-09-29 21:16:55.059+01
124	plugins::upload.assets.download	\N	{}	[]	2	2021-09-29 21:16:55.144+01	2021-09-29 21:16:55.17+01
127	plugins::content-manager.explorer.create	application::article-tag.article-tag	{"fields": ["tag_name", "articles", "slug"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.264+01	2021-09-29 21:16:55.33+01
142	plugins::content-manager.explorer.create	application::product.product	{"fields": ["product_name", "product_main_image", "product_images", "is_digital_product", "product_description", "slug", "product_main_categories", "price", "product_secondary_categories", "SKU"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.38+01	2021-09-29 21:16:55.406+01
150	plugins::content-manager.explorer.create	application::testimonial.testimonial	{"fields": ["author_name", "text", "author_image"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.456+01	2021-09-29 21:16:55.535+01
156	plugins::content-manager.explorer.read	application::cookie-policy.cookie-policy	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.684+01	2021-09-29 21:16:55.71+01
171	plugins::content-manager.explorer.read	application::team-member.team-member	{"fields": ["member_name", "member_image", "member_description"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.813+01	2021-09-29 21:16:55.837+01
185	plugins::content-manager.explorer.update	application::message.message	{"fields": ["name", "company", "email", "content", "subject"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.938+01	2021-09-29 21:16:56.095+01
192	plugins::content-manager.explorer.update	application::services.services	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:56.227+01	2021-09-29 21:16:56.346+01
199	plugins::content-manager.explorer.delete	application::article-categories.article-categories	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.463+01	2021-09-29 21:16:56.52+01
206	plugins::content-manager.explorer.delete	application::events-page.events-page	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.61+01	2021-09-29 21:16:56.65+01
217	plugins::content-manager.explorer.delete	application::single-event.single-event	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.719+01	2021-09-29 21:16:56.823+01
236	plugins::content-manager.explorer.create	application::faq-page.faq-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.018+01	2021-09-29 21:16:57.041+01
241	plugins::content-manager.explorer.create	application::product-secondary-categories.product-secondary-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	[]	1	2021-09-29 21:16:57.075+01	2021-09-29 21:16:57.093+01
249	plugins::content-manager.explorer.create	application::terms-conditions.terms-conditions	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.134+01	2021-09-29 21:16:57.162+01
262	plugins::content-manager.explorer.read	application::home-page.home-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.202+01	2021-09-29 21:16:57.229+01
271	plugins::content-manager.explorer.read	application::single-event.single-event	{"fields": ["description", "header_image", "start_date", "end_date", "slug", "title", "event_type"]}	[]	1	2021-09-29 21:16:57.272+01	2021-09-29 21:16:57.335+01
282	plugins::content-manager.explorer.update	application::contact.contact	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.413+01	2021-09-29 21:16:57.441+01
289	plugins::content-manager.explorer.update	application::privacy-policies.privacy-policies	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.482+01	2021-09-29 21:16:57.508+01
302	plugins::content-manager.explorer.update	application::testimonial.testimonial	{"fields": ["author_name", "text", "author_image"]}	[]	1	2021-09-29 21:16:57.547+01	2021-09-29 21:16:57.568+01
2139	plugins::content-manager.explorer.delete	application::article.article	{}	[]	1	2021-09-30 23:47:49.944+01	2021-09-30 23:47:49.964+01
2147	plugins::content-manager.explorer.delete	application::message.message	{}	[]	1	2021-09-30 23:47:49.992+01	2021-09-30 23:47:50.009+01
2156	plugins::content-manager.explorer.delete	application::single-event.single-event	{}	[]	1	2021-09-30 23:47:50.037+01	2021-09-30 23:47:50.053+01
2166	plugins::content-manager.explorer.publish	application::articles-page.articles-page	{}	[]	1	2021-09-30 23:47:50.082+01	2021-09-30 23:47:50.103+01
357	plugins::upload.assets.copy-link	\N	{}	[]	1	2021-09-29 21:16:58.224+01	2021-09-29 21:16:58.269+01
367	plugins::users-permissions.roles.read	\N	{}	[]	1	2021-09-29 21:16:58.312+01	2021-09-29 21:16:58.358+01
377	admin::marketplace.plugins.install	\N	{}	[]	1	2021-09-29 21:16:58.452+01	2021-09-29 21:16:58.486+01
24	plugins::content-manager.explorer.create	application::testimonial.testimonial	{"fields": ["author_name", "text", "author_image"]}	[]	2	2021-09-29 21:16:54.047+01	2021-09-29 21:16:54.123+01
36	plugins::content-manager.explorer.read	application::message.message	{"fields": ["name", "company", "email", "content", "subject"]}	[]	2	2021-09-29 21:16:54.212+01	2021-09-29 21:16:54.254+01
46	plugins::content-manager.explorer.read	application::team-member.team-member	{"fields": ["member_name", "member_image", "member_description"]}	[]	2	2021-09-29 21:16:54.339+01	2021-09-29 21:16:54.389+01
54	plugins::content-manager.explorer.update	application::contact.contact	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.449+01	2021-09-29 21:16:54.473+01
67	plugins::content-manager.explorer.update	application::services.services	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.557+01	2021-09-29 21:16:54.638+01
78	plugins::content-manager.explorer.delete	application::contact.contact	{}	[]	2	2021-09-29 21:16:54.731+01	2021-09-29 21:16:54.771+01
89	plugins::content-manager.explorer.delete	application::product.product	{}	[]	2	2021-09-29 21:16:54.827+01	2021-09-29 21:16:54.871+01
99	plugins::content-manager.explorer.publish	application::article-tag.article-tag	{}	[]	2	2021-09-29 21:16:54.92+01	2021-09-29 21:16:54.946+01
109	plugins::content-manager.explorer.publish	application::privacy-policies.privacy-policies	{}	[]	2	2021-09-29 21:16:54.998+01	2021-09-29 21:16:55.04+01
118	plugins::content-manager.explorer.publish	application::team-member.team-member	{}	[]	2	2021-09-29 21:16:55.086+01	2021-09-29 21:16:55.126+01
132	plugins::content-manager.explorer.create	application::cookie-policy.cookie-policy	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.267+01	2021-09-29 21:16:55.332+01
144	plugins::content-manager.explorer.create	application::safeguarding.safeguarding	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.38+01	2021-09-29 21:16:55.416+01
152	plugins::content-manager.explorer.read	application::article.article	{"fields": ["title", "slug", "content.subtitle", "content.header_image", "content.content", "unpublish_date", "article_tags", "article_categories", "description", "author", "featured", "future_publish_date"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.463+01	2021-09-29 21:16:55.537+01
161	plugins::content-manager.explorer.read	application::message.message	{"fields": ["name", "company", "email", "content", "subject"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.689+01	2021-09-29 21:16:55.721+01
167	plugins::content-manager.explorer.read	application::safeguarding.safeguarding	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.81+01	2021-09-29 21:16:55.836+01
183	plugins::content-manager.explorer.update	application::faq-page.faq-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.93+01	2021-09-29 21:16:56.088+01
191	plugins::content-manager.explorer.update	application::safeguarding.safeguarding	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:56.217+01	2021-09-29 21:16:56.349+01
203	plugins::content-manager.explorer.delete	application::contact.contact	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.469+01	2021-09-29 21:16:56.53+01
213	plugins::content-manager.explorer.delete	application::product-secondary-categories.product-secondary-categories	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.639+01	2021-09-29 21:16:56.673+01
223	plugins::upload.assets.create	\N	{}	[]	3	2021-09-29 21:16:56.752+01	2021-09-29 21:16:56.84+01
234	plugins::content-manager.explorer.create	application::domain-expert.domain-expert	{"fields": ["title", "url", "image"]}	[]	1	2021-09-29 21:16:57.015+01	2021-09-29 21:16:57.038+01
240	plugins::content-manager.explorer.create	application::product-main-categories.product-main-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	[]	1	2021-09-29 21:16:57.074+01	2021-09-29 21:16:57.093+01
247	plugins::content-manager.explorer.create	application::social-media-account.social-media-account	{"fields": ["URL", "image", "title"]}	[]	1	2021-09-29 21:16:57.132+01	2021-09-29 21:16:57.156+01
257	plugins::content-manager.explorer.read	application::contact.contact	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.195+01	2021-09-29 21:16:57.223+01
272	plugins::content-manager.explorer.read	application::social-media-account.social-media-account	{"fields": ["URL", "image", "title"]}	[]	1	2021-09-29 21:16:57.273+01	2021-09-29 21:16:57.335+01
283	plugins::content-manager.explorer.update	application::cookie-policy.cookie-policy	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.413+01	2021-09-29 21:16:57.442+01
291	plugins::content-manager.explorer.update	application::product-filters.product-filters	{"fields": ["filter_name", "slug"]}	[]	1	2021-09-29 21:16:57.482+01	2021-09-29 21:16:57.508+01
299	plugins::content-manager.explorer.update	plugins::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "articles"]}	[]	1	2021-09-29 21:16:57.547+01	2021-09-29 21:16:57.564+01
2140	plugins::content-manager.explorer.delete	application::contact.contact	{}	[]	1	2021-09-30 23:47:49.944+01	2021-09-30 23:47:49.964+01
2151	plugins::content-manager.explorer.delete	application::product-secondary-categories.product-secondary-categories	{}	[]	1	2021-09-30 23:47:49.993+01	2021-09-30 23:47:50.01+01
2157	plugins::content-manager.explorer.delete	application::social-media-account.social-media-account	{}	[]	1	2021-09-30 23:47:50.037+01	2021-09-30 23:47:50.053+01
2173	plugins::content-manager.explorer.publish	application::home-page.home-page	{}	[]	1	2021-09-30 23:47:50.086+01	2021-09-30 23:47:50.103+01
352	plugins::email.settings.read	\N	{}	[]	1	2021-09-29 21:16:58.037+01	2021-09-29 21:16:58.115+01
362	plugins::i18n.locale.delete	\N	{}	[]	1	2021-09-29 21:16:58.231+01	2021-09-29 21:16:58.275+01
371	plugins::users-permissions.providers.update	\N	{}	[]	1	2021-09-29 21:16:58.322+01	2021-09-29 21:16:58.377+01
380	admin::webhooks.read	\N	{}	[]	1	2021-09-29 21:16:58.461+01	2021-09-29 21:16:58.511+01
387	admin::roles.create	\N	{}	[]	1	2021-09-29 21:16:58.55+01	2021-09-29 21:16:58.571+01
2183	plugins::content-manager.explorer.publish	application::team-member.team-member	{}	[]	1	2021-09-30 23:47:50.136+01	2021-09-30 23:47:50.152+01
25	plugins::content-manager.explorer.read	application::about.about	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.051+01	2021-09-29 21:16:54.12+01
31	plugins::content-manager.explorer.read	application::cookie-policy.cookie-policy	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.199+01	2021-09-29 21:16:54.234+01
41	plugins::content-manager.explorer.read	application::product.product	{"fields": ["product_name", "product_main_image", "product_images", "is_digital_product", "product_description", "slug", "product_main_categories", "price", "product_secondary_categories", "SKU"]}	[]	2	2021-09-29 21:16:54.325+01	2021-09-29 21:16:54.367+01
55	plugins::content-manager.explorer.update	application::cookie-policy.cookie-policy	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.449+01	2021-09-29 21:16:54.502+01
66	plugins::content-manager.explorer.update	application::safeguarding.safeguarding	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.557+01	2021-09-29 21:16:54.632+01
77	plugins::content-manager.explorer.delete	application::articles-page.articles-page	{}	[]	2	2021-09-29 21:16:54.731+01	2021-09-29 21:16:54.771+01
87	plugins::content-manager.explorer.delete	application::product-main-categories.product-main-categories	{}	[]	2	2021-09-29 21:16:54.821+01	2021-09-29 21:16:54.856+01
97	plugins::content-manager.explorer.publish	application::about.about	{}	[]	2	2021-09-29 21:16:54.904+01	2021-09-29 21:16:54.923+01
107	plugins::content-manager.explorer.publish	application::home-page.home-page	{}	[]	2	2021-09-29 21:16:54.968+01	2021-09-29 21:16:54.997+01
117	plugins::content-manager.explorer.publish	application::social-media-account.social-media-account	{}	[]	2	2021-09-29 21:16:55.054+01	2021-09-29 21:16:55.085+01
134	plugins::content-manager.explorer.create	application::events-page.events-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent", "sections.section_content", "sections.section_title", "sections.section_image"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.269+01	2021-09-29 21:16:55.333+01
145	plugins::content-manager.explorer.create	application::single-event.single-event	{"fields": ["description", "header_image", "start_date", "end_date", "slug", "title", "event_type"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.387+01	2021-09-29 21:16:55.416+01
153	plugins::content-manager.explorer.read	application::articles-page.articles-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.463+01	2021-09-29 21:16:55.537+01
162	plugins::content-manager.explorer.read	application::privacy-policies.privacy-policies	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.69+01	2021-09-29 21:16:55.721+01
168	plugins::content-manager.explorer.read	application::services.services	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.81+01	2021-09-29 21:16:55.836+01
177	plugins::content-manager.explorer.update	application::article.article	{"fields": ["title", "slug", "content.subtitle", "content.header_image", "content.content", "unpublish_date", "article_tags", "article_categories", "description", "author", "featured", "future_publish_date"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.92+01	2021-09-29 21:16:56.088+01
194	plugins::content-manager.explorer.update	application::social-media-account.social-media-account	{"fields": ["URL", "image", "title"]}	["admin::is-creator"]	3	2021-09-29 21:16:56.227+01	2021-09-29 21:16:56.347+01
201	plugins::content-manager.explorer.delete	application::article.article	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.464+01	2021-09-29 21:16:56.52+01
208	plugins::content-manager.explorer.delete	application::home-page.home-page	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.611+01	2021-09-29 21:16:56.651+01
218	plugins::content-manager.explorer.delete	application::social-media-account.social-media-account	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.719+01	2021-09-29 21:16:56.824+01
235	plugins::content-manager.explorer.create	application::events-page.events-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent", "sections.section_content", "sections.section_title", "sections.section_image"]}	[]	1	2021-09-29 21:16:57.015+01	2021-09-29 21:16:57.038+01
245	plugins::content-manager.explorer.create	application::single-event.single-event	{"fields": ["description", "header_image", "start_date", "end_date", "slug", "title", "event_type"]}	[]	1	2021-09-29 21:16:57.076+01	2021-09-29 21:16:57.094+01
251	plugins::content-manager.explorer.create	plugins::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "articles"]}	[]	1	2021-09-29 21:16:57.135+01	2021-09-29 21:16:57.162+01
263	plugins::content-manager.explorer.read	application::message.message	{"fields": ["name", "company", "email", "content", "subject"]}	[]	1	2021-09-29 21:16:57.202+01	2021-09-29 21:16:57.236+01
274	plugins::content-manager.explorer.read	application::terms-conditions.terms-conditions	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.302+01	2021-09-29 21:16:57.34+01
284	plugins::content-manager.explorer.update	application::domain-expert.domain-expert	{"fields": ["title", "url", "image"]}	[]	1	2021-09-29 21:16:57.422+01	2021-09-29 21:16:57.449+01
294	plugins::content-manager.explorer.update	application::safeguarding.safeguarding	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.488+01	2021-09-29 21:16:57.517+01
2141	plugins::content-manager.explorer.delete	application::articles-page.articles-page	{}	[]	1	2021-09-30 23:47:49.944+01	2021-09-30 23:47:49.964+01
2148	plugins::content-manager.explorer.delete	application::privacy-policies.privacy-policies	{}	[]	1	2021-09-30 23:47:49.992+01	2021-09-30 23:47:50.009+01
2165	plugins::content-manager.explorer.delete	plugins::users-permissions.user	{}	[]	1	2021-09-30 23:47:50.042+01	2021-09-30 23:47:50.058+01
2171	plugins::content-manager.explorer.publish	application::events-page.events-page	{}	[]	1	2021-09-30 23:47:50.085+01	2021-09-30 23:47:50.102+01
2180	plugins::content-manager.explorer.publish	application::safeguarding.safeguarding	{}	[]	1	2021-09-30 23:47:50.132+01	2021-09-30 23:47:50.153+01
353	plugins::upload.read	\N	{}	[]	1	2021-09-29 21:16:58.085+01	2021-09-29 21:16:58.172+01
365	plugins::content-manager.components.configure-layout	\N	{}	[]	1	2021-09-29 21:16:58.275+01	2021-09-29 21:16:58.303+01
26	plugins::content-manager.explorer.read	application::article-categories.article-categories	{"fields": ["category", "articles", "slug"]}	[]	2	2021-09-29 21:16:54.051+01	2021-09-29 21:16:54.129+01
34	plugins::content-manager.explorer.read	application::faq-page.faq-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.211+01	2021-09-29 21:16:54.254+01
45	plugins::content-manager.explorer.read	application::social-media-account.social-media-account	{"fields": ["URL", "image", "title"]}	[]	2	2021-09-29 21:16:54.339+01	2021-09-29 21:16:54.389+01
53	plugins::content-manager.explorer.update	application::articles-page.articles-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.449+01	2021-09-29 21:16:54.473+01
63	plugins::content-manager.explorer.update	application::product-main-categories.product-main-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	[]	2	2021-09-29 21:16:54.543+01	2021-09-29 21:16:54.587+01
73	plugins::content-manager.explorer.delete	application::about.about	{}	[]	2	2021-09-29 21:16:54.716+01	2021-09-29 21:16:54.75+01
82	plugins::content-manager.explorer.delete	application::faq-page.faq-page	{}	[]	2	2021-09-29 21:16:54.806+01	2021-09-29 21:16:54.826+01
92	plugins::content-manager.explorer.delete	application::single-event.single-event	{}	[]	2	2021-09-29 21:16:54.884+01	2021-09-29 21:16:54.907+01
103	plugins::content-manager.explorer.publish	application::cookie-policy.cookie-policy	{}	[]	2	2021-09-29 21:16:54.955+01	2021-09-29 21:16:54.991+01
113	plugins::content-manager.explorer.publish	application::product.product	{}	[]	2	2021-09-29 21:16:55.047+01	2021-09-29 21:16:55.077+01
122	plugins::upload.assets.create	\N	{}	[]	2	2021-09-29 21:16:55.141+01	2021-09-29 21:16:55.17+01
128	plugins::content-manager.explorer.create	application::article.article	{"fields": ["title", "slug", "content.subtitle", "content.header_image", "content.content", "unpublish_date", "article_tags", "article_categories", "description", "author", "featured", "future_publish_date"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.264+01	2021-09-29 21:16:55.33+01
138	plugins::content-manager.explorer.create	application::privacy-policies.privacy-policies	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.376+01	2021-09-29 21:16:55.407+01
148	plugins::content-manager.explorer.create	application::terms-conditions.terms-conditions	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.456+01	2021-09-29 21:16:55.536+01
158	plugins::content-manager.explorer.read	application::events-page.events-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent", "sections.section_content", "sections.section_title", "sections.section_image"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.685+01	2021-09-29 21:16:55.711+01
170	plugins::content-manager.explorer.read	application::social-media-account.social-media-account	{"fields": ["URL", "image", "title"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.811+01	2021-09-29 21:16:55.837+01
184	plugins::content-manager.explorer.update	application::home-page.home-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.93+01	2021-09-29 21:16:56.095+01
195	plugins::content-manager.explorer.update	application::team-member.team-member	{"fields": ["member_name", "member_image", "member_description"]}	["admin::is-creator"]	3	2021-09-29 21:16:56.249+01	2021-09-29 21:16:56.362+01
205	plugins::content-manager.explorer.delete	application::domain-expert.domain-expert	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.477+01	2021-09-29 21:16:56.536+01
215	plugins::content-manager.explorer.delete	application::safeguarding.safeguarding	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.651+01	2021-09-29 21:16:56.696+01
225	plugins::upload.assets.download	\N	{}	[]	3	2021-09-29 21:16:56.824+01	2021-09-29 21:16:56.852+01
227	plugins::content-manager.explorer.create	application::about.about	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.013+01	2021-09-29 21:16:57.033+01
237	plugins::content-manager.explorer.create	application::home-page.home-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.071+01	2021-09-29 21:16:57.089+01
248	plugins::content-manager.explorer.create	application::team-member.team-member	{"fields": ["member_name", "member_image", "member_description"]}	[]	1	2021-09-29 21:16:57.132+01	2021-09-29 21:16:57.156+01
259	plugins::content-manager.explorer.read	application::events-page.events-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent", "sections.section_content", "sections.section_title", "sections.section_image"]}	[]	1	2021-09-29 21:16:57.198+01	2021-09-29 21:16:57.228+01
269	plugins::content-manager.explorer.read	application::safeguarding.safeguarding	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.271+01	2021-09-29 21:16:57.335+01
279	plugins::content-manager.explorer.update	application::article-tag.article-tag	{"fields": ["tag_name", "articles", "slug"]}	[]	1	2021-09-29 21:16:57.393+01	2021-09-29 21:16:57.436+01
2143	plugins::content-manager.explorer.delete	application::domain-expert.domain-expert	{}	[]	1	2021-09-30 23:47:49.944+01	2021-09-30 23:47:49.964+01
2152	plugins::content-manager.explorer.delete	application::product.product	{}	[]	1	2021-09-30 23:47:49.993+01	2021-09-30 23:47:50.01+01
2164	plugins::content-manager.explorer.publish	application::article.article	{}	[]	1	2021-09-30 23:47:50.042+01	2021-09-30 23:47:50.058+01
2169	plugins::content-manager.explorer.publish	application::discounts.discounts	{}	[]	1	2021-09-30 23:47:50.085+01	2021-09-30 23:47:50.102+01
2178	plugins::content-manager.explorer.publish	application::product-secondary-categories.product-secondary-categories	{}	[]	1	2021-09-30 23:47:50.132+01	2021-09-30 23:47:50.148+01
360	plugins::i18n.locale.read	\N	{}	[]	1	2021-09-29 21:16:58.23+01	2021-09-29 21:16:58.274+01
369	plugins::users-permissions.roles.delete	\N	{}	[]	1	2021-09-29 21:16:58.32+01	2021-09-29 21:16:58.376+01
378	admin::marketplace.plugins.uninstall	\N	{}	[]	1	2021-09-29 21:16:58.457+01	2021-09-29 21:16:58.505+01
27	plugins::content-manager.explorer.read	application::article-tag.article-tag	{"fields": ["tag_name", "articles", "slug"]}	[]	2	2021-09-29 21:16:54.051+01	2021-09-29 21:16:54.13+01
38	plugins::content-manager.explorer.read	application::product-filters.product-filters	{"fields": ["filter_name", "slug"]}	[]	2	2021-09-29 21:16:54.219+01	2021-09-29 21:16:54.275+01
43	plugins::content-manager.explorer.read	application::services.services	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.338+01	2021-09-29 21:16:54.388+01
51	plugins::content-manager.explorer.update	application::article-tag.article-tag	{"fields": ["tag_name", "articles", "slug"]}	[]	2	2021-09-29 21:16:54.448+01	2021-09-29 21:16:54.472+01
61	plugins::content-manager.explorer.update	application::privacy-policies.privacy-policies	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.542+01	2021-09-29 21:16:54.586+01
71	plugins::content-manager.explorer.update	application::terms-conditions.terms-conditions	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.716+01	2021-09-29 21:16:54.737+01
83	plugins::content-manager.explorer.delete	application::home-page.home-page	{}	[]	2	2021-09-29 21:16:54.806+01	2021-09-29 21:16:54.826+01
96	plugins::content-manager.explorer.delete	application::terms-conditions.terms-conditions	{}	[]	2	2021-09-29 21:16:54.893+01	2021-09-29 21:16:54.92+01
105	plugins::content-manager.explorer.publish	application::faq-page.faq-page	{}	[]	2	2021-09-29 21:16:54.963+01	2021-09-29 21:16:54.997+01
115	plugins::content-manager.explorer.publish	application::services.services	{}	[]	2	2021-09-29 21:16:55.054+01	2021-09-29 21:16:55.085+01
125	plugins::upload.assets.copy-link	\N	{}	[]	2	2021-09-29 21:16:55.152+01	2021-09-29 21:16:55.173+01
126	plugins::content-manager.explorer.create	application::about.about	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.259+01	2021-09-29 21:16:55.329+01
136	plugins::content-manager.explorer.create	application::home-page.home-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.374+01	2021-09-29 21:16:55.399+01
146	plugins::content-manager.explorer.create	application::social-media-account.social-media-account	{"fields": ["URL", "image", "title"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.453+01	2021-09-29 21:16:55.506+01
163	plugins::content-manager.explorer.read	application::product-filters.product-filters	{"fields": ["filter_name", "slug"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.691+01	2021-09-29 21:16:55.721+01
169	plugins::content-manager.explorer.read	application::single-event.single-event	{"fields": ["description", "header_image", "start_date", "end_date", "slug", "title", "event_type"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.811+01	2021-09-29 21:16:55.837+01
182	plugins::content-manager.explorer.update	application::events-page.events-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent", "sections.section_content", "sections.section_title", "sections.section_image"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.93+01	2021-09-29 21:16:56.087+01
190	plugins::content-manager.explorer.update	application::product.product	{"fields": ["product_name", "product_main_image", "product_images", "is_digital_product", "product_description", "slug", "product_main_categories", "price", "product_secondary_categories", "SKU"]}	["admin::is-creator"]	3	2021-09-29 21:16:56.217+01	2021-09-29 21:16:56.348+01
202	plugins::content-manager.explorer.delete	application::articles-page.articles-page	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.464+01	2021-09-29 21:16:56.52+01
209	plugins::content-manager.explorer.delete	application::message.message	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.611+01	2021-09-29 21:16:56.651+01
222	plugins::upload.read	\N	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.726+01	2021-09-29 21:16:56.833+01
229	plugins::content-manager.explorer.create	application::article-tag.article-tag	{"fields": ["tag_name", "articles", "slug"]}	[]	1	2021-09-29 21:16:57.014+01	2021-09-29 21:16:57.037+01
238	plugins::content-manager.explorer.create	application::message.message	{"fields": ["name", "company", "email", "content", "subject"]}	[]	1	2021-09-29 21:16:57.071+01	2021-09-29 21:16:57.094+01
255	plugins::content-manager.explorer.read	application::about.about	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.139+01	2021-09-29 21:16:57.168+01
266	plugins::content-manager.explorer.read	application::product-filters.product-filters	{"fields": ["filter_name", "slug"]}	[]	1	2021-09-29 21:16:57.203+01	2021-09-29 21:16:57.241+01
276	plugins::content-manager.explorer.read	plugins::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "articles"]}	[]	1	2021-09-29 21:16:57.336+01	2021-09-29 21:16:57.377+01
286	plugins::content-manager.explorer.update	application::faq-page.faq-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.442+01	2021-09-29 21:16:57.468+01
296	plugins::content-manager.explorer.update	application::single-event.single-event	{"fields": ["description", "header_image", "start_date", "end_date", "slug", "title", "event_type"]}	[]	1	2021-09-29 21:16:57.512+01	2021-09-29 21:16:57.532+01
2142	plugins::content-manager.explorer.delete	application::cookie-policy.cookie-policy	{}	[]	1	2021-09-30 23:47:49.944+01	2021-09-30 23:47:49.964+01
2153	plugins::content-manager.explorer.delete	application::safeguarding.safeguarding	{}	[]	1	2021-09-30 23:47:49.993+01	2021-09-30 23:47:50.01+01
2163	plugins::content-manager.explorer.publish	application::article-tag.article-tag	{}	[]	1	2021-09-30 23:47:50.041+01	2021-09-30 23:47:50.057+01
2172	plugins::content-manager.explorer.publish	application::faq-page.faq-page	{}	[]	1	2021-09-30 23:47:50.085+01	2021-09-30 23:47:50.103+01
2185	plugins::content-manager.explorer.publish	application::services.services	{}	[]	1	2021-09-30 23:47:50.136+01	2021-09-30 23:47:50.152+01
354	plugins::upload.assets.create	\N	{}	[]	1	2021-09-29 21:16:58.115+01	2021-09-29 21:16:58.214+01
363	plugins::content-manager.single-types.configure-view	\N	{}	[]	1	2021-09-29 21:16:58.275+01	2021-09-29 21:16:58.302+01
373	plugins::users-permissions.email-templates.update	\N	{}	[]	1	2021-09-29 21:16:58.378+01	2021-09-29 21:16:58.444+01
383	admin::users.create	\N	{}	[]	1	2021-09-29 21:16:58.506+01	2021-09-29 21:16:58.53+01
58	plugins::content-manager.explorer.update	application::faq-page.faq-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	2	2021-09-29 21:16:54.458+01	2021-09-29 21:16:54.512+01
68	plugins::content-manager.explorer.update	application::single-event.single-event	{"fields": ["description", "header_image", "start_date", "end_date", "slug", "title", "event_type"]}	[]	2	2021-09-29 21:16:54.57+01	2021-09-29 21:16:54.688+01
74	plugins::content-manager.explorer.delete	application::article-categories.article-categories	{}	[]	2	2021-09-29 21:16:54.726+01	2021-09-29 21:16:54.755+01
84	plugins::content-manager.explorer.delete	application::message.message	{}	[]	2	2021-09-29 21:16:54.811+01	2021-09-29 21:16:54.841+01
93	plugins::content-manager.explorer.delete	application::social-media-account.social-media-account	{}	[]	2	2021-09-29 21:16:54.889+01	2021-09-29 21:16:54.909+01
106	plugins::content-manager.explorer.publish	application::domain-expert.domain-expert	{}	[]	2	2021-09-29 21:16:54.963+01	2021-09-29 21:16:54.997+01
116	plugins::content-manager.explorer.publish	application::single-event.single-event	{}	[]	2	2021-09-29 21:16:55.054+01	2021-09-29 21:16:55.085+01
135	plugins::content-manager.explorer.create	application::faq-page.faq-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.269+01	2021-09-29 21:16:55.339+01
139	plugins::content-manager.explorer.create	application::services.services	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.379+01	2021-09-29 21:16:55.406+01
149	plugins::content-manager.explorer.read	application::about.about	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.457+01	2021-09-29 21:16:55.536+01
157	plugins::content-manager.explorer.read	application::domain-expert.domain-expert	{"fields": ["title", "url", "image"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.684+01	2021-09-29 21:16:55.71+01
172	plugins::content-manager.explorer.read	application::terms-conditions.terms-conditions	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.815+01	2021-09-29 21:16:55.844+01
181	plugins::content-manager.explorer.update	application::domain-expert.domain-expert	{"fields": ["title", "url", "image"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.924+01	2021-09-29 21:16:56.087+01
189	plugins::content-manager.explorer.update	application::product-secondary-categories.product-secondary-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	["admin::is-creator"]	3	2021-09-29 21:16:56.216+01	2021-09-29 21:16:56.338+01
204	plugins::content-manager.explorer.delete	application::cookie-policy.cookie-policy	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.47+01	2021-09-29 21:16:56.53+01
214	plugins::content-manager.explorer.delete	application::product.product	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.639+01	2021-09-29 21:16:56.673+01
224	plugins::upload.assets.update	\N	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.752+01	2021-09-29 21:16:56.84+01
233	plugins::content-manager.explorer.create	application::cookie-policy.cookie-policy	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.014+01	2021-09-29 21:16:57.038+01
244	plugins::content-manager.explorer.create	application::services.services	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.076+01	2021-09-29 21:16:57.095+01
252	plugins::content-manager.explorer.read	application::article-tag.article-tag	{"fields": ["tag_name", "articles", "slug"]}	[]	1	2021-09-29 21:16:57.139+01	2021-09-29 21:16:57.161+01
261	plugins::content-manager.explorer.read	application::faq-page.faq-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.199+01	2021-09-29 21:16:57.228+01
270	plugins::content-manager.explorer.read	application::services.services	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.272+01	2021-09-29 21:16:57.335+01
281	plugins::content-manager.explorer.update	application::articles-page.articles-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.413+01	2021-09-29 21:16:57.441+01
288	plugins::content-manager.explorer.update	application::message.message	{"fields": ["name", "company", "email", "content", "subject"]}	[]	1	2021-09-29 21:16:57.481+01	2021-09-29 21:16:57.504+01
301	plugins::content-manager.explorer.update	application::team-member.team-member	{"fields": ["member_name", "member_image", "member_description"]}	[]	1	2021-09-29 21:16:57.548+01	2021-09-29 21:16:57.565+01
2144	plugins::content-manager.explorer.delete	application::discounts.discounts	{}	[]	1	2021-09-30 23:47:49.949+01	2021-09-30 23:47:49.963+01
2154	plugins::content-manager.explorer.delete	application::faq-page.faq-page	{}	[]	1	2021-09-30 23:47:49.993+01	2021-09-30 23:47:50.014+01
2162	plugins::content-manager.explorer.publish	application::article-categories.article-categories	{}	[]	1	2021-09-30 23:47:50.041+01	2021-09-30 23:47:50.057+01
351	plugins::content-type-builder.read	\N	{}	[]	1	2021-09-29 21:16:58.036+01	2021-09-29 21:16:58.113+01
361	plugins::i18n.locale.update	\N	{}	[]	1	2021-09-29 21:16:58.23+01	2021-09-29 21:16:58.274+01
370	plugins::users-permissions.providers.read	\N	{}	[]	1	2021-09-29 21:16:58.321+01	2021-09-29 21:16:58.377+01
379	admin::webhooks.create	\N	{}	[]	1	2021-09-29 21:16:58.457+01	2021-09-29 21:16:58.505+01
390	admin::roles.delete	\N	{}	[]	1	2021-09-29 21:16:58.554+01	2021-09-29 21:16:58.572+01
2167	plugins::content-manager.explorer.publish	application::contact.contact	{}	[]	1	2021-09-30 23:47:50.084+01	2021-09-30 23:47:50.102+01
2176	plugins::content-manager.explorer.publish	application::product-filters.product-filters	{}	[]	1	2021-09-30 23:47:50.132+01	2021-09-30 23:47:50.147+01
64	plugins::content-manager.explorer.update	application::product-secondary-categories.product-secondary-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	[]	2	2021-09-29 21:16:54.556+01	2021-09-29 21:16:54.623+01
75	plugins::content-manager.explorer.delete	application::article-tag.article-tag	{}	[]	2	2021-09-29 21:16:54.726+01	2021-09-29 21:16:54.756+01
85	plugins::content-manager.explorer.delete	application::privacy-policies.privacy-policies	{}	[]	2	2021-09-29 21:16:54.815+01	2021-09-29 21:16:54.852+01
94	plugins::content-manager.explorer.delete	application::team-member.team-member	{}	[]	2	2021-09-29 21:16:54.889+01	2021-09-29 21:16:54.914+01
102	plugins::content-manager.explorer.publish	application::contact.contact	{}	[]	2	2021-09-29 21:16:54.955+01	2021-09-29 21:16:54.985+01
114	plugins::content-manager.explorer.publish	application::safeguarding.safeguarding	{}	[]	2	2021-09-29 21:16:55.047+01	2021-09-29 21:16:55.079+01
123	plugins::upload.assets.update	\N	{}	[]	2	2021-09-29 21:16:55.142+01	2021-09-29 21:16:55.17+01
130	plugins::content-manager.explorer.create	application::article-categories.article-categories	{"fields": ["category", "articles", "slug"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.259+01	2021-09-29 21:16:55.33+01
137	plugins::content-manager.explorer.create	application::message.message	{"fields": ["name", "company", "email", "content", "subject"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.375+01	2021-09-29 21:16:55.407+01
155	plugins::content-manager.explorer.read	application::article-tag.article-tag	{"fields": ["tag_name", "articles", "slug"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.462+01	2021-09-29 21:16:55.544+01
164	plugins::content-manager.explorer.read	application::product-main-categories.product-main-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.7+01	2021-09-29 21:16:55.735+01
173	plugins::content-manager.explorer.read	application::testimonial.testimonial	{"fields": ["author_name", "text", "author_image"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.819+01	2021-09-29 21:16:55.843+01
178	plugins::content-manager.explorer.update	application::articles-page.articles-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.923+01	2021-09-29 21:16:56.087+01
186	plugins::content-manager.explorer.update	application::privacy-policies.privacy-policies	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:56.21+01	2021-09-29 21:16:56.338+01
196	plugins::content-manager.explorer.update	application::terms-conditions.terms-conditions	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:56.459+01	2021-09-29 21:16:56.506+01
211	plugins::content-manager.explorer.delete	application::product-filters.product-filters	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.625+01	2021-09-29 21:16:56.656+01
216	plugins::content-manager.explorer.delete	application::services.services	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.718+01	2021-09-29 21:16:56.823+01
226	plugins::upload.assets.copy-link	\N	{}	[]	3	2021-09-29 21:16:56.873+01	2021-09-29 21:16:56.881+01
228	plugins::content-manager.explorer.create	application::article-categories.article-categories	{"fields": ["category", "articles", "slug"]}	[]	1	2021-09-29 21:16:57.013+01	2021-09-29 21:16:57.033+01
246	plugins::content-manager.explorer.create	application::product-filters.product-filters	{"fields": ["filter_name", "slug"]}	[]	1	2021-09-29 21:16:57.076+01	2021-09-29 21:16:57.1+01
256	plugins::content-manager.explorer.read	application::articles-page.articles-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.144+01	2021-09-29 21:16:57.167+01
265	plugins::content-manager.explorer.read	application::product-main-categories.product-main-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	[]	1	2021-09-29 21:16:57.204+01	2021-09-29 21:16:57.236+01
275	plugins::content-manager.explorer.read	application::testimonial.testimonial	{"fields": ["author_name", "text", "author_image"]}	[]	1	2021-09-29 21:16:57.323+01	2021-09-29 21:16:57.355+01
285	plugins::content-manager.explorer.update	application::events-page.events-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent", "sections.section_content", "sections.section_title", "sections.section_image"]}	[]	1	2021-09-29 21:16:57.429+01	2021-09-29 21:16:57.454+01
295	plugins::content-manager.explorer.update	application::services.services	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "sections.section_content", "sections.section_title", "sections.section_image", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.501+01	2021-09-29 21:16:57.522+01
2145	plugins::content-manager.explorer.delete	application::events-page.events-page	{}	[]	1	2021-09-30 23:47:49.949+01	2021-09-30 23:47:49.963+01
2155	plugins::content-manager.explorer.delete	application::services.services	{}	[]	1	2021-09-30 23:47:49.998+01	2021-09-30 23:47:50.014+01
2161	plugins::content-manager.explorer.publish	application::about.about	{}	[]	1	2021-09-30 23:47:50.041+01	2021-09-30 23:47:50.057+01
2170	plugins::content-manager.explorer.publish	application::domain-expert.domain-expert	{}	[]	1	2021-09-30 23:47:50.085+01	2021-09-30 23:47:50.102+01
356	plugins::upload.assets.download	\N	{}	[]	1	2021-09-29 21:16:58.139+01	2021-09-29 21:16:58.224+01
366	plugins::users-permissions.roles.create	\N	{}	[]	1	2021-09-29 21:16:58.285+01	2021-09-29 21:16:58.32+01
376	admin::marketplace.read	\N	{}	[]	1	2021-09-29 21:16:58.427+01	2021-09-29 21:16:58.457+01
386	admin::users.delete	\N	{}	[]	1	2021-09-29 21:16:58.519+01	2021-09-29 21:16:58.542+01
2179	plugins::content-manager.explorer.publish	application::product.product	{}	[]	1	2021-09-30 23:47:50.132+01	2021-09-30 23:47:50.148+01
70	plugins::content-manager.explorer.update	application::team-member.team-member	{"fields": ["member_name", "member_image", "member_description"]}	[]	2	2021-09-29 21:16:54.689+01	2021-09-29 21:16:54.716+01
80	plugins::content-manager.explorer.delete	application::domain-expert.domain-expert	{}	[]	2	2021-09-29 21:16:54.756+01	2021-09-29 21:16:54.8+01
90	plugins::content-manager.explorer.delete	application::safeguarding.safeguarding	{}	[]	2	2021-09-29 21:16:54.841+01	2021-09-29 21:16:54.871+01
100	plugins::content-manager.explorer.publish	application::article.article	{}	[]	2	2021-09-29 21:16:54.927+01	2021-09-29 21:16:54.955+01
110	plugins::content-manager.explorer.publish	application::product-filters.product-filters	{}	[]	2	2021-09-29 21:16:55.003+01	2021-09-29 21:16:55.047+01
120	plugins::content-manager.explorer.publish	application::testimonial.testimonial	{}	[]	2	2021-09-29 21:16:55.092+01	2021-09-29 21:16:55.139+01
131	plugins::content-manager.explorer.create	application::contact.contact	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.265+01	2021-09-29 21:16:55.331+01
143	plugins::content-manager.explorer.create	application::product-filters.product-filters	{"fields": ["filter_name", "slug"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.379+01	2021-09-29 21:16:55.408+01
154	plugins::content-manager.explorer.read	application::contact.contact	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.464+01	2021-09-29 21:16:55.538+01
165	plugins::content-manager.explorer.read	application::product-secondary-categories.product-secondary-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.7+01	2021-09-29 21:16:55.736+01
174	plugins::content-manager.explorer.update	application::about.about	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.82+01	2021-09-29 21:16:55.843+01
179	plugins::content-manager.explorer.update	application::contact.contact	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	["admin::is-creator"]	3	2021-09-29 21:16:55.923+01	2021-09-29 21:16:56.087+01
187	plugins::content-manager.explorer.update	application::product-filters.product-filters	{"fields": ["filter_name", "slug"]}	["admin::is-creator"]	3	2021-09-29 21:16:56.212+01	2021-09-29 21:16:56.338+01
197	plugins::content-manager.explorer.update	application::testimonial.testimonial	{"fields": ["author_name", "text", "author_image"]}	["admin::is-creator"]	3	2021-09-29 21:16:56.46+01	2021-09-29 21:16:56.507+01
212	plugins::content-manager.explorer.delete	application::product-main-categories.product-main-categories	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.625+01	2021-09-29 21:16:56.656+01
220	plugins::content-manager.explorer.delete	application::terms-conditions.terms-conditions	{}	["admin::is-creator"]	3	2021-09-29 21:16:56.725+01	2021-09-29 21:16:56.833+01
231	plugins::content-manager.explorer.create	application::articles-page.articles-page	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.014+01	2021-09-29 21:16:57.038+01
243	plugins::content-manager.explorer.create	application::safeguarding.safeguarding	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.075+01	2021-09-29 21:16:57.094+01
250	plugins::content-manager.explorer.create	application::testimonial.testimonial	{"fields": ["author_name", "text", "author_image"]}	[]	1	2021-09-29 21:16:57.134+01	2021-09-29 21:16:57.162+01
258	plugins::content-manager.explorer.read	application::cookie-policy.cookie-policy	{"fields": ["title", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.198+01	2021-09-29 21:16:57.227+01
267	plugins::content-manager.explorer.read	application::product-secondary-categories.product-secondary-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	[]	1	2021-09-29 21:16:57.271+01	2021-09-29 21:16:57.334+01
277	plugins::content-manager.explorer.update	application::about.about	{"fields": ["title", "sections.section_content", "sections.section_title", "sections.section_image", "content.subtitle", "content.header_image", "content.content", "motto", "extraContent"]}	[]	1	2021-09-29 21:16:57.393+01	2021-09-29 21:16:57.435+01
290	plugins::content-manager.explorer.update	application::product-main-categories.product-main-categories	{"fields": ["categ_name", "slug", "products", "image", "description"]}	[]	1	2021-09-29 21:16:57.482+01	2021-09-29 21:16:57.507+01
2146	plugins::content-manager.explorer.delete	application::home-page.home-page	{}	[]	1	2021-09-30 23:47:49.992+01	2021-09-30 23:47:50.009+01
2159	plugins::content-manager.explorer.delete	application::terms-conditions.terms-conditions	{}	[]	1	2021-09-30 23:47:50.038+01	2021-09-30 23:47:50.058+01
2168	plugins::content-manager.explorer.publish	application::cookie-policy.cookie-policy	{}	[]	1	2021-09-30 23:47:50.084+01	2021-09-30 23:47:50.102+01
2177	plugins::content-manager.explorer.publish	application::product-main-categories.product-main-categories	{}	[]	1	2021-09-30 23:47:50.132+01	2021-09-30 23:47:50.148+01
359	plugins::i18n.locale.create	\N	{}	[]	1	2021-09-29 21:16:58.224+01	2021-09-29 21:16:58.269+01
372	plugins::users-permissions.email-templates.read	\N	{}	[]	1	2021-09-29 21:16:58.329+01	2021-09-29 21:16:58.41+01
382	admin::webhooks.delete	\N	{}	[]	1	2021-09-29 21:16:58.476+01	2021-09-29 21:16:58.519+01
355	plugins::upload.assets.update	\N	{}	[]	1	2021-09-29 21:16:58.115+01	2021-09-29 21:16:58.215+01
364	plugins::content-manager.collection-types.configure-view	\N	{}	[]	1	2021-09-29 21:16:58.275+01	2021-09-29 21:16:58.302+01
374	plugins::users-permissions.advanced-settings.read	\N	{}	[]	1	2021-09-29 21:16:58.378+01	2021-09-29 21:16:58.444+01
384	admin::users.read	\N	{}	[]	1	2021-09-29 21:16:58.506+01	2021-09-29 21:16:58.53+01
2182	plugins::content-manager.explorer.publish	application::social-media-account.social-media-account	{}	[]	1	2021-09-30 23:47:50.136+01	2021-09-30 23:47:50.152+01
2184	plugins::content-manager.explorer.publish	application::terms-conditions.terms-conditions	{}	[]	1	2021-09-30 23:47:50.136+01	2021-09-30 23:47:50.152+01
654	plugins::content-manager.explorer.create	application::product.product	{"fields": ["product_name", "product_main_image", "product_images", "is_digital_product", "product_description", "slug", "product_main_categories", "price", "product_secondary_categories", "SKU", "discounts", "DiscountPercentage"]}	[]	1	2021-09-29 22:01:33.082+01	2021-09-29 22:01:33.101+01
546	plugins::content-manager.explorer.create	application::discounts.discounts	{"fields": ["name", "products"]}	[]	1	2021-09-29 22:00:04.785+01	2021-09-29 22:00:04.806+01
656	plugins::content-manager.explorer.update	application::product.product	{"fields": ["product_name", "product_main_image", "product_images", "is_digital_product", "product_description", "slug", "product_main_categories", "price", "product_secondary_categories", "SKU", "discounts", "DiscountPercentage"]}	[]	1	2021-09-29 22:01:33.082+01	2021-09-29 22:01:33.101+01
548	plugins::content-manager.explorer.update	application::discounts.discounts	{"fields": ["name", "products"]}	[]	1	2021-09-29 22:00:04.785+01	2021-09-29 22:00:04.806+01
547	plugins::content-manager.explorer.read	application::discounts.discounts	{"fields": ["name", "products"]}	[]	1	2021-09-29 22:00:04.785+01	2021-09-29 22:00:04.806+01
655	plugins::content-manager.explorer.read	application::product.product	{"fields": ["product_name", "product_main_image", "product_images", "is_digital_product", "product_description", "slug", "product_main_categories", "price", "product_secondary_categories", "SKU", "discounts", "DiscountPercentage"]}	[]	1	2021-09-29 22:01:33.082+01	2021-09-29 22:01:33.101+01
\.


--
-- Data for Name: strapi_role; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_role (id, name, code, description, created_at, updated_at) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2021-09-29 21:16:53.727+01	2021-09-29 21:16:53.727+01
2	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2021-09-29 21:16:53.751+01	2021-09-29 21:16:53.751+01
3	Author	strapi-author	Authors can manage the content they have created.	2021-09-29 21:16:53.766+01	2021-09-29 21:16:53.766+01
\.


--
-- Data for Name: strapi_users_roles; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_users_roles (id, user_id, role_id) FROM stdin;
1	1	1
3	3	2
4	2	3
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: team_members; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.team_members (id, member_name, member_description, published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Maria McM	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	2021-09-29 21:50:19.003+01	1	1	2021-09-29 21:50:17.546+01	2021-09-29 21:51:32.487+01
2	Greta Garbo	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	2021-09-29 21:50:30.241+01	1	1	2021-09-29 21:50:29.004+01	2021-09-29 21:50:30.252+01
3	John Doe	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	2021-09-29 21:50:42.06+01	1	1	2021-09-29 21:50:40.847+01	2021-09-29 21:50:42.075+01
4	Maria Lark	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	2021-09-29 21:50:52.916+01	1	1	2021-09-29 21:50:51.812+01	2021-09-29 21:50:52.93+01
\.


--
-- Data for Name: terms_conditions; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.terms_conditions (id, title, motto, "extraContent", published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	Terms and Conditions	\N	\N	2021-09-29 21:28:52.589+01	1	1	2021-09-29 21:28:50.33+01	2021-09-29 21:28:52.615+01
\.


--
-- Data for Name: terms_conditions_components; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.terms_conditions_components (id, field, "order", component_type, component_id, terms_condition_id) FROM stdin;
1	content	1	components_page_content_page_contents	1	1
\.


--
-- Data for Name: testimonials; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.testimonials (id, author_name, text, published_at, created_by, updated_by, created_at, updated_at) FROM stdin;
1	John Doe	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	2021-09-29 21:49:13.824+01	1	1	2021-09-29 21:49:12.097+01	2021-09-29 21:49:13.836+01
4	Anna Gilbert	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	2021-09-29 21:50:01.612+01	1	1	2021-09-29 21:50:00.192+01	2021-09-29 21:50:01.626+01
3	Michela Foster	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.	2021-09-29 21:49:49.243+01	1	1	2021-09-29 21:49:47.38+01	2021-09-29 22:39:33.37+01
2	Jane MMMM	Ea enim consequatur vel dolorem fuga non possimus reiciendis hic sint corrupti aut sapiente consequuntur et officia dolorem. Qui atque blanditiis ut dolorum omnis non quidem veniam sit rerum possimus quo omnis nisi ut dolorem autem. At neque quisquam eos provident mollitia id libero consectetur ut pariatur architecto. Aut quam sequi sit laborum illum et minus autem eos perferendis placeat et tempore labore et dolores distinctio ut labore consectetur.\n	2021-09-29 21:49:32.763+01	1	1	2021-09-29 21:49:31.59+01	2021-09-29 22:39:43.047+01
\.


--
-- Data for Name: upload_file; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.upload_file (id, name, "alternativeText", caption, width, height, formats, hash, ext, mime, size, url, "previewUrl", provider, provider_metadata, created_by, updated_by, created_at, updated_at) FROM stdin;
1	duck.svg			234	149	\N	duck_d1fed35b6b	.svg	image/svg+xml	1.03	/uploads/duck_d1fed35b6b.svg	\N	local	\N	1	1	2021-09-29 21:30:34.694+01	2021-09-29 21:30:34.733+01
2	butterfly.svg			303	1114	\N	butterfly_2f7b4e26f6	.svg	image/svg+xml	1.18	/uploads/butterfly_2f7b4e26f6.svg	\N	local	\N	1	1	2021-09-29 21:30:34.697+01	2021-09-29 21:30:34.737+01
3	fox.svg			184	245	\N	fox_43e18eb320	.svg	image/svg+xml	2.09	/uploads/fox_43e18eb320.svg	\N	local	\N	1	1	2021-09-29 21:30:34.699+01	2021-09-29 21:30:34.737+01
4	fish.svg			255	224	\N	fish_1d9ddd5bae	.svg	image/svg+xml	0.94	/uploads/fish_1d9ddd5bae.svg	\N	local	\N	1	1	2021-09-29 21:30:34.7+01	2021-09-29 21:30:34.743+01
5	badger.svg			303	125	\N	badger_7e72a67fe9	.svg	image/svg+xml	2.41	/uploads/badger_7e72a67fe9.svg	\N	local	\N	1	1	2021-09-29 21:30:34.702+01	2021-09-29 21:30:34.743+01
6	bee.svg			158	176	\N	bee_e3db122039	.svg	image/svg+xml	2.06	/uploads/bee_e3db122039.svg	\N	local	\N	1	1	2021-09-29 21:30:34.706+01	2021-09-29 21:30:34.746+01
7	snake.svg			278	50	\N	snake_1906540b58	.svg	image/svg+xml	1.40	/uploads/snake_1906540b58.svg	\N	local	\N	1	1	2021-09-29 21:30:35.071+01	2021-09-29 21:30:35.106+01
8	stag.svg			184	220	\N	stag_cd0c24e053	.svg	image/svg+xml	4.17	/uploads/stag_cd0c24e053.svg	\N	local	\N	1	1	2021-09-29 21:30:35.073+01	2021-09-29 21:30:35.116+01
9	raven.svg			278	180	\N	raven_46e0e31cb1	.svg	image/svg+xml	0.91	/uploads/raven_46e0e31cb1.svg	\N	local	\N	1	1	2021-09-29 21:30:35.076+01	2021-09-29 21:30:35.116+01
10	badger.svg			303	125	\N	badger_3984ffa75e	.svg	image/svg+xml	2.41	/uploads/badger_3984ffa75e.svg	\N	local	\N	1	1	2021-09-29 21:30:35.08+01	2021-09-29 21:30:35.125+01
12	owl.svg			190	191	\N	owl_20a64658a6	.svg	image/svg+xml	3.44	/uploads/owl_20a64658a6.svg	\N	local	\N	1	1	2021-09-29 21:30:35.08+01	2021-09-29 21:30:35.125+01
11	bee.svg			158	176	\N	bee_02e2cd582c	.svg	image/svg+xml	2.06	/uploads/bee_02e2cd582c.svg	\N	local	\N	1	1	2021-09-29 21:30:35.08+01	2021-09-29 21:30:35.128+01
13	butterfly.svg			303	1114	\N	butterfly_f69e74bbf0	.svg	image/svg+xml	1.18	/uploads/butterfly_f69e74bbf0.svg	\N	local	\N	1	1	2021-09-29 21:30:35.385+01	2021-09-29 21:30:35.418+01
14	fish.svg			255	224	\N	fish_220a6f3835	.svg	image/svg+xml	0.94	/uploads/fish_220a6f3835.svg	\N	local	\N	1	1	2021-09-29 21:30:35.391+01	2021-09-29 21:30:35.43+01
16	fox.svg			184	245	\N	fox_16a60bbd7c	.svg	image/svg+xml	2.09	/uploads/fox_16a60bbd7c.svg	\N	local	\N	1	1	2021-09-29 21:30:35.398+01	2021-09-29 21:30:35.429+01
15	duck.svg			234	149	\N	duck_161a646c54	.svg	image/svg+xml	1.03	/uploads/duck_161a646c54.svg	\N	local	\N	1	1	2021-09-29 21:30:35.395+01	2021-09-29 21:30:35.434+01
17	owl.svg			190	191	\N	owl_91cfea0e73	.svg	image/svg+xml	3.44	/uploads/owl_91cfea0e73.svg	\N	local	\N	1	1	2021-09-29 21:30:35.398+01	2021-09-29 21:30:35.429+01
18	raven.svg			278	180	\N	raven_1739cb5086	.svg	image/svg+xml	0.91	/uploads/raven_1739cb5086.svg	\N	local	\N	1	1	2021-09-29 21:30:35.419+01	2021-09-29 21:30:35.455+01
19	snake.svg			278	50	\N	snake_4d876d2ea2	.svg	image/svg+xml	1.40	/uploads/snake_4d876d2ea2.svg	\N	local	\N	1	1	2021-09-29 21:30:35.575+01	2021-09-29 21:30:35.586+01
20	stag.svg			184	220	\N	stag_2032bdb661	.svg	image/svg+xml	4.17	/uploads/stag_2032bdb661.svg	\N	local	\N	1	1	2021-09-29 21:30:35.581+01	2021-09-29 21:30:35.595+01
23	geometry.svg			440	300	\N	geometry_0daa64e191	.svg	image/svg+xml	1.69	/uploads/geometry_0daa64e191.svg	\N	local	\N	1	1	2021-09-29 21:31:09.684+01	2021-09-29 21:31:09.708+01
21	arts.svg			440	301	\N	arts_054d7ab2ce	.svg	image/svg+xml	2.88	/uploads/arts_054d7ab2ce.svg	\N	local	\N	1	1	2021-09-29 21:31:09.679+01	2021-09-29 21:31:09.708+01
22	computer-science.svg			440	301	\N	computer_science_63c0cd6159	.svg	image/svg+xml	12.01	/uploads/computer_science_63c0cd6159.svg	\N	local	\N	1	1	2021-09-29 21:31:09.681+01	2021-09-29 21:31:09.711+01
24	geo.svg			440	302	\N	geo_fa0c4c87b3	.svg	image/svg+xml	3.20	/uploads/geo_fa0c4c87b3.svg	\N	local	\N	1	1	2021-09-29 21:31:09.687+01	2021-09-29 21:31:09.714+01
25	history.svg			440	301	\N	history_d01bf0e380	.svg	image/svg+xml	5.40	/uploads/history_d01bf0e380.svg	\N	local	\N	1	1	2021-09-29 21:31:09.692+01	2021-09-29 21:31:09.717+01
26	ICT.svg			440	301	\N	ICT_3cb270f603	.svg	image/svg+xml	2.04	/uploads/ICT_3cb270f603.svg	\N	local	\N	1	1	2021-09-29 21:31:09.709+01	2021-09-29 21:31:09.746+01
27	speaking.svg			440	302	\N	speaking_3ccd26efc3	.svg	image/svg+xml	2.22	/uploads/speaking_3ccd26efc3.svg	\N	local	\N	1	1	2021-09-29 21:31:09.905+01	2021-09-29 21:31:09.917+01
28	sciences.svg			440	300	\N	sciences_9832120541	.svg	image/svg+xml	1.62	/uploads/sciences_9832120541.svg	\N	local	\N	1	1	2021-09-29 21:31:09.907+01	2021-09-29 21:31:48.924+01
29	logo_notext.png			421	453	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_logo_notext_2bda0acbb0.png", "hash": "thumbnail_logo_notext_2bda0acbb0", "mime": "image/png", "name": "thumbnail_logo_notext.png", "path": null, "size": 7.18, "width": 145, "height": 156}}	logo_notext_2bda0acbb0	.png	image/png	10.19	/uploads/logo_notext_2bda0acbb0.png	\N	local	\N	1	1	2021-09-29 21:38:09.875+01	2021-09-29 21:38:09.886+01
30	close-icon.svg			512	512	\N	close_icon_a749a675f6	.svg	image/svg+xml	0.32	/uploads/close_icon_a749a675f6.svg	\N	local	\N	1	1	2021-09-29 21:49:00.893+01	2021-09-29 21:49:00.923+01
31	arrow-left.svg			24	24	\N	arrow_left_26ccaf5b28	.svg	image/svg+xml	0.31	/uploads/arrow_left_26ccaf5b28.svg	\N	local	\N	1	1	2021-09-29 21:49:00.895+01	2021-09-29 21:49:00.929+01
32	share.svg			512	512	\N	share_fcf84b3449	.svg	image/svg+xml	0.57	/uploads/share_fcf84b3449.svg	\N	local	\N	1	1	2021-09-29 21:49:00.895+01	2021-09-29 21:49:00.931+01
33	arrow-right.svg			24	24	\N	arrow_right_ab7f11a046	.svg	image/svg+xml	0.31	/uploads/arrow_right_ab7f11a046.svg	\N	local	\N	1	1	2021-09-29 21:49:00.896+01	2021-09-29 21:49:00.931+01
34	menu-icon.svg			514	514	\N	menu_icon_2f35b992d3	.svg	image/svg+xml	0.56	/uploads/menu_icon_2f35b992d3.svg	\N	local	\N	1	1	2021-09-29 21:49:00.896+01	2021-09-29 21:49:00.931+01
35	user-icon.svg			522	522	\N	user_icon_0db350f22e	.svg	image/svg+xml	0.64	/uploads/user_icon_0db350f22e.svg	\N	local	\N	1	1	2021-09-29 21:49:00.908+01	2021-09-29 21:49:00.945+01
37	facebook.svg			24	24	\N	facebook_99539c66b9	.svg	image/svg+xml	0.37	/uploads/facebook_99539c66b9.svg	\N	local	\N	1	1	2021-09-29 21:52:18.278+01	2021-09-29 21:52:18.327+01
38	instagram.svg			512	512	\N	instagram_fe76ca5533	.svg	image/svg+xml	0.58	/uploads/instagram_fe76ca5533.svg	\N	local	\N	1	1	2021-09-29 21:52:18.288+01	2021-09-29 21:52:18.327+01
36	BSE-logo.svg			206	206	\N	BSE_logo_f44195ed7a	.svg	image/svg+xml	3.00	/uploads/BSE_logo_f44195ed7a.svg	\N	local	\N	1	1	2021-09-29 21:52:18.277+01	2021-09-29 21:52:18.327+01
39	github.svg			24	24	\N	github_b2ecce5107	.svg	image/svg+xml	0.91	/uploads/github_b2ecce5107.svg	\N	local	\N	1	1	2021-09-29 21:52:18.298+01	2021-09-29 21:52:18.34+01
40	linkedin.svg			512	512	\N	linkedin_32dea9c237	.svg	image/svg+xml	0.32	/uploads/linkedin_32dea9c237.svg	\N	local	\N	1	1	2021-09-29 21:52:18.303+01	2021-09-29 21:52:18.351+01
44	tiktok.svg			118	42	\N	tiktok_1026325562	.svg	image/svg+xml	3.05	/uploads/tiktok_1026325562.svg	\N	local	\N	1	1	2021-09-29 21:52:18.623+01	2021-09-29 21:52:18.767+01
41	BSE-logo.png			206	206	{"thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_BSE_logo_3775153e36.png", "hash": "thumbnail_BSE_logo_3775153e36", "mime": "image/png", "name": "thumbnail_BSE-logo.png", "path": null, "size": 3.31, "width": 156, "height": 156}}	BSE_logo_3775153e36	.png	image/png	1.90	/uploads/BSE_logo_3775153e36.png	\N	local	\N	1	1	2021-09-29 21:52:18.335+01	2021-09-29 21:52:18.404+01
42	strapi-logo-light.svg			119	31	\N	strapi_logo_light_7260a5684a	.svg	image/svg+xml	3.74	/uploads/strapi_logo_light_7260a5684a.svg	\N	local	\N	1	1	2021-09-29 21:52:18.618+01	2021-09-29 21:52:18.764+01
43	tiktok-share.svg			512	512	\N	tiktok_share_70cd617d39	.svg	image/svg+xml	0.37	/uploads/tiktok_share_70cd617d39.svg	\N	local	\N	1	1	2021-09-29 21:52:18.623+01	2021-09-29 21:52:18.766+01
45	tiktok-logo.svg			250	250	\N	tiktok_logo_3758a26541	.svg	image/svg+xml	2.40	/uploads/tiktok_logo_3758a26541.svg	\N	local	\N	1	1	2021-09-29 21:52:18.63+01	2021-09-29 21:52:18.771+01
46	TreeBros-logo.svg			842	227	\N	Tree_Bros_logo_cc04f632b5	.svg	image/svg+xml	4.36	/uploads/Tree_Bros_logo_cc04f632b5.svg	\N	local	\N	1	1	2021-09-29 21:52:18.777+01	2021-09-29 21:52:18.819+01
47	twitter.svg			512	512	\N	twitter_e79fc4edeb	.svg	image/svg+xml	0.89	/uploads/twitter_e79fc4edeb.svg	\N	local	\N	1	1	2021-09-29 21:52:18.81+01	2021-09-29 21:52:18.841+01
48	copy.svg			512	512	\N	copy_79c783c890	.svg	image/svg+xml	0.82	/uploads/copy_79c783c890.svg	\N	local	\N	1	1	2021-09-29 22:08:36.576+01	2021-09-29 22:08:36.629+01
52	clipboard.svg			512	512	\N	clipboard_9e58afd3a0	.svg	image/svg+xml	0.91	/uploads/clipboard_9e58afd3a0.svg	\N	local	\N	1	1	2021-09-29 22:08:36.584+01	2021-09-29 22:08:36.632+01
49	bookmark.svg			512	512	\N	bookmark_741fb8bb0b	.svg	image/svg+xml	0.43	/uploads/bookmark_741fb8bb0b.svg	\N	local	\N	1	1	2021-09-29 22:08:36.58+01	2021-09-29 22:08:36.633+01
50	archive.svg			512	512	\N	archive_2cae8a3ae2	.svg	image/svg+xml	0.47	/uploads/archive_2cae8a3ae2.svg	\N	local	\N	1	1	2021-09-29 22:08:36.584+01	2021-09-29 22:08:36.633+01
51	edit.svg			512	512	\N	edit_cfe64f7149	.svg	image/svg+xml	0.87	/uploads/edit_cfe64f7149.svg	\N	local	\N	1	1	2021-09-29 22:08:36.584+01	2021-09-29 22:08:36.633+01
53	book.svg			512	512	\N	book_55bd817a8d	.svg	image/svg+xml	0.65	/uploads/book_55bd817a8d.svg	\N	local	\N	1	1	2021-09-29 22:08:36.584+01	2021-09-29 22:08:36.636+01
54	map.svg			512	512	\N	map_3971342de7	.svg	image/svg+xml	0.54	/uploads/map_3971342de7.svg	\N	local	\N	1	1	2021-09-29 22:08:36.744+01	2021-09-29 22:08:36.755+01
55	NADSL-founding-member-logo.jpg			377	201	{"thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_NADSL_founding_member_logo_c1bc57a2ed.jpg", "hash": "thumbnail_NADSL_founding_member_logo_c1bc57a2ed", "mime": "image/jpeg", "name": "thumbnail_NADSL-founding-member-logo.jpg", "path": null, "size": 8.83, "width": 245, "height": 131}}	NADSL_founding_member_logo_c1bc57a2ed	.jpg	image/jpeg	15.10	/uploads/NADSL_founding_member_logo_c1bc57a2ed.jpg	\N	local	\N	1	1	2021-09-29 22:22:00.853+01	2021-09-29 22:22:00.863+01
57	bse-logo.svg			512	512	\N	bse_logo_535f3a74f3	.svg	image/svg+xml	11.52	/uploads/bse_logo_535f3a74f3.svg	\N	local	\N	1	1	2021-09-30 18:09:58.973+01	2021-09-30 18:09:58.999+01
56	bse-logo.svg			512	512	\N	bse_logo_99f3acf963	.svg	image/svg+xml	11.52	/uploads/bse_logo_99f3acf963.svg	\N	local	\N	1	1	2021-09-30 18:09:58.975+01	2021-09-30 18:09:59.001+01
58	bse-logo-no-text-tranparent.svg			421	453	\N	bse_logo_no_text_tranparent_12e04d28df	.svg	image/svg+xml	3.33	/uploads/bse_logo_no_text_tranparent_12e04d28df.svg	\N	local	\N	1	1	2021-09-30 18:31:54.102+01	2021-09-30 18:31:54.116+01
59	bse-no-text-dark.svg			421	453	\N	bse_no_text_dark_b3af6c983f	.svg	image/svg+xml	3.31	/uploads/bse_no_text_dark_b3af6c983f.svg	\N	local	\N	1	1	2021-09-30 18:31:54.104+01	2021-09-30 18:31:54.12+01
60	bse-logo-no-text-white.svg			421	453	\N	bse_logo_no_text_white_fabab0ca55	.svg	image/svg+xml	3.32	/uploads/bse_logo_no_text_white_fabab0ca55.svg	\N	local	\N	1	1	2021-09-30 18:32:07.741+01	2021-09-30 18:32:07.75+01
64	duck-transp.svg			234	149	\N	duck_transp_0ce988d684	.svg	image/svg+xml	0.51	/uploads/duck_transp_0ce988d684.svg	\N	local	\N	1	1	2021-09-30 19:03:43.614+01	2021-09-30 19:03:43.648+01
62	badger-transp.svg			303	125	\N	badger_transp_5b02dd188a	.svg	image/svg+xml	1.25	/uploads/badger_transp_5b02dd188a.svg	\N	local	\N	1	1	2021-09-30 19:03:43.613+01	2021-09-30 19:03:43.648+01
61	bee-transp.svg			158	176	\N	bee_transp_0a11016a7a	.svg	image/svg+xml	0.77	/uploads/bee_transp_0a11016a7a.svg	\N	local	\N	1	1	2021-09-30 19:03:43.613+01	2021-09-30 19:03:43.651+01
63	butterfly-transp.svg			512	512	\N	butterfly_transp_21eb81c515	.svg	image/svg+xml	0.52	/uploads/butterfly_transp_21eb81c515.svg	\N	local	\N	1	1	2021-09-30 19:03:43.613+01	2021-09-30 19:03:43.652+01
65	fox-transp.svg			184	245	\N	fox_transp_1f01cb4706	.svg	image/svg+xml	0.95	/uploads/fox_transp_1f01cb4706.svg	\N	local	\N	1	1	2021-09-30 19:03:43.617+01	2021-09-30 19:03:43.652+01
66	fish-transp.svg			255	224	\N	fish_transp_751b5cce54	.svg	image/svg+xml	0.49	/uploads/fish_transp_751b5cce54.svg	\N	local	\N	1	1	2021-09-30 19:03:43.619+01	2021-09-30 19:03:43.654+01
67	snake-transp.svg			278	50	\N	snake_transp_d12a7f7c2e	.svg	image/svg+xml	0.74	/uploads/snake_transp_d12a7f7c2e.svg	\N	local	\N	1	1	2021-09-30 19:03:43.801+01	2021-09-30 19:03:43.823+01
68	stag-transp.svg			184	220	\N	stag_transp_d896e5b533	.svg	image/svg+xml	1.92	/uploads/stag_transp_d896e5b533.svg	\N	local	\N	1	1	2021-09-30 19:03:43.804+01	2021-09-30 19:03:43.824+01
69	raven-transp.svg			278	180	\N	raven_transp_2d825a1947	.svg	image/svg+xml	0.45	/uploads/raven_transp_2d825a1947.svg	\N	local	\N	1	1	2021-09-30 19:03:43.807+01	2021-09-30 19:03:43.829+01
70	owl-transp.svg			190	191	{}	owl_transp_b884b36bc8	.svg	image/svg+xml	1.83	/uploads/owl_transp_b884b36bc8.svg	\N	local	\N	1	1	2021-09-30 19:03:43.811+01	2021-09-30 19:11:38.481+01
\.


--
-- Data for Name: upload_file_morph; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public.upload_file_morph (id, upload_file_id, related_id, related_type, field, "order") FROM stdin;
1	28	1	components_page_section_page_sections	section_image	1
2	27	2	components_page_section_page_sections	section_image	1
3	25	3	components_page_section_page_sections	section_image	1
4	21	4	components_page_section_page_sections	section_image	1
5	24	5	components_page_section_page_sections	section_image	1
6	8	6	components_page_section_page_sections	section_image	1
7	19	7	components_page_section_page_sections	section_image	1
8	3	8	components_page_section_page_sections	section_image	1
9	15	3	components_page_content_page_contents	header_image	1
10	9	4	components_page_content_page_contents	header_image	1
15	27	7	components_page_content_page_contents	header_image	1
16	24	8	components_page_content_page_contents	header_image	1
17	27	9	components_page_content_page_contents	header_image	1
18	25	10	components_page_content_page_contents	header_image	1
19	35	1	testimonials	author_image	1
131	54	2	products	product_main_image	1
22	35	4	testimonials	author_image	1
132	54	2	products	product_images	1
24	35	2	team_members	member_image	1
25	35	3	team_members	member_image	1
26	35	4	team_members	member_image	1
27	35	1	team_members	member_image	1
28	47	1	social_media_accounts	image	1
29	37	2	social_media_accounts	image	1
30	43	3	social_media_accounts	image	1
31	23	1	single_events	header_image	1
32	52	1	product_main_categories	image	1
33	53	2	product_main_categories	image	1
34	51	1	product_secondary_categories	image	1
35	48	2	product_secondary_categories	image	1
133	53	2	products	product_images	2
134	52	2	products	product_images	3
38	1	13	components_page_content_page_contents	header_image	1
39	55	1	domain_experts	image	1
135	51	2	products	product_images	4
136	1	12	components_page_content_page_contents	header_image	1
56	35	3	testimonials	author_image	1
57	35	2	testimonials	author_image	1
58	53	11	components_page_content_page_contents	header_image	1
100	60	5	components_page_content_page_contents	header_image	1
111	10	1	products	product_main_image	1
112	48	1	products	product_images	1
113	52	1	products	product_images	2
114	50	1	products	product_images	3
115	49	1	products	product_images	4
116	51	3	products	product_main_image	1
117	51	3	products	product_images	1
118	53	3	products	product_images	2
119	50	3	products	product_images	3
120	49	3	products	product_images	4
\.


--
-- Data for Name: users-permissions_permission; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public."users-permissions_permission" (id, type, controller, action, enabled, policy, role, created_by, updated_by) FROM stdin;
1	application	about	delete	f		1	\N	\N
2	application	about	delete	f		2	\N	\N
10	application	article-categories	create	f		2	\N	\N
16	application	article-categories	findone	t		2	\N	\N
8	application	article-categories	count	f		2	\N	\N
37	application	article	find	t		1	\N	\N
41	application	article	update	t		1	\N	\N
5	application	about	update	f		2	\N	\N
11	application	article-categories	delete	f		1	\N	\N
33	application	article	create	t		1	\N	\N
67	application	domain-expert	find	t		1	\N	\N
31	application	article	count	t		1	\N	\N
115	application	product-filters	find	t		1	\N	\N
12	application	article-categories	delete	f		2	\N	\N
39	application	article	findone	t		1	\N	\N
18	application	article-categories	update	f		2	\N	\N
105	application	privacy-policies	find	t		1	\N	\N
20	application	article-tag	count	f		2	\N	\N
155	application	product	update	t		1	\N	\N
22	application	article-tag	create	f		2	\N	\N
23	application	article-tag	delete	f		1	\N	\N
24	application	article-tag	delete	f		2	\N	\N
145	application	product	count	t		1	\N	\N
188	application	social-media-account	find	t		2	\N	\N
9	application	article-categories	create	t		1	\N	\N
218	application	testimonial	find	t		2	\N	\N
7	application	article-categories	count	t		1	\N	\N
30	application	article-tag	update	f		2	\N	\N
6	application	about	update	t		1	\N	\N
76	application	events-page	find	t		2	\N	\N
3	application	about	find	t		1	\N	\N
34	application	article	create	f		2	\N	\N
35	application	article	delete	f		1	\N	\N
36	application	article	delete	f		2	\N	\N
90	application	home-page	update	t		1	\N	\N
46	application	articles-page	find	t		2	\N	\N
229	content-manager	collection-types	find	t		1	\N	\N
116	application	product-filters	find	t		2	\N	\N
239	content-manager	collection-types	update	t		1	\N	\N
42	application	article	update	f		2	\N	\N
43	application	articles-page	delete	f		1	\N	\N
44	application	articles-page	delete	f		2	\N	\N
4	application	about	find	t		2	\N	\N
48	application	articles-page	update	f		2	\N	\N
49	application	contact	delete	f		1	\N	\N
50	application	contact	delete	f		2	\N	\N
208	application	terms-conditions	find	t		2	\N	\N
14	application	article-categories	find	t		2	\N	\N
54	application	contact	update	f		2	\N	\N
60	application	cookie-policy	update	f		2	\N	\N
64	application	domain-expert	create	f		2	\N	\N
21	application	article-tag	create	t		1	\N	\N
17	application	article-categories	update	t		1	\N	\N
128	application	product-main-categories	find	t		2	\N	\N
85	application	home-page	delete	f		1	\N	\N
95	application	message	delete	f		1	\N	\N
98	application	message	find	f		2	\N	\N
15	application	article-categories	findone	t		1	\N	\N
178	application	single-event	findone	t		2	\N	\N
29	application	article-tag	update	t		1	\N	\N
25	application	article-tag	find	t		1	\N	\N
125	application	product-main-categories	delete	f		1	\N	\N
19	application	article-tag	count	t		1	\N	\N
13	application	article-categories	find	t		1	\N	\N
138	application	product-secondary-categories	delete	f		2	\N	\N
45	application	articles-page	find	t		1	\N	\N
148	application	product	create	f		2	\N	\N
47	application	articles-page	update	t		1	\N	\N
158	application	safeguarding	delete	f		2	\N	\N
164	application	services	delete	f		2	\N	\N
168	application	services	update	f		2	\N	\N
174	application	single-event	delete	f		2	\N	\N
27	application	article-tag	findone	t		1	\N	\N
184	application	social-media-account	create	f		2	\N	\N
75	application	events-page	find	t		1	\N	\N
194	application	team-member	count	f		2	\N	\N
198	application	team-member	delete	f		2	\N	\N
204	application	team-member	update	f		2	\N	\N
135	application	product-secondary-categories	create	t		1	\N	\N
214	application	testimonial	create	f		2	\N	\N
222	application	testimonial	update	f		2	\N	\N
232	content-manager	collection-types	findone	f		2	\N	\N
242	content-manager	components	findcomponentconfiguration	f		2	\N	\N
248	content-manager	content-types	findcontenttypeconfiguration	f		2	\N	\N
259	content-manager	single-types	delete	f		1	\N	\N
268	content-manager	uid	checkuidavailability	f		2	\N	\N
278	content-type-builder	components	createcomponent	f		2	\N	\N
55	application	cookie-policy	delete	f		1	\N	\N
66	application	domain-expert	delete	f		2	\N	\N
80	application	faq-page	delete	f		2	\N	\N
126	application	product-main-categories	delete	f		2	\N	\N
136	application	product-secondary-categories	create	f		2	\N	\N
156	application	product	update	f		2	\N	\N
186	application	social-media-account	delete	f		2	\N	\N
196	application	team-member	create	f		2	\N	\N
206	application	terms-conditions	delete	f		2	\N	\N
230	content-manager	collection-types	find	f		2	\N	\N
240	content-manager	collection-types	update	f		2	\N	\N
250	content-manager	content-types	findcontenttypes	f		2	\N	\N
258	content-manager	single-types	createorupdate	f		2	\N	\N
270	content-manager	uid	generateuid	f		2	\N	\N
281	content-type-builder	components	getcomponent	f		1	\N	\N
291	content-type-builder	contenttypes	deletecontenttype	f		1	\N	\N
300	email	email	getsettings	f		2	\N	\N
310	i18n	locales	createlocale	f		2	\N	\N
319	upload	upload	destroy	f		1	\N	\N
329	upload	upload	updatesettings	f		1	\N	\N
339	users-permissions	auth	forgotpassword	f		1	\N	\N
347	users-permissions	user	count	f		1	\N	\N
367	users-permissions	userspermissions	getadvancedsettings	f		1	\N	\N
377	users-permissions	userspermissions	getrole	f		1	\N	\N
388	users-permissions	userspermissions	updateadvancedsettings	f		2	\N	\N
146	application	product	count	t		2	\N	\N
88	application	home-page	find	t		2	\N	\N
118	application	product-filters	findone	t		2	\N	\N
166	application	services	find	t		2	\N	\N
176	application	single-event	find	t		2	\N	\N
99	application	message	findone	t		1	\N	\N
109	application	product-filters	count	t		1	\N	\N
396	application	discounts	count	t		1	\N	\N
217	application	testimonial	find	t		1	\N	\N
357	users-permissions	user	findone	t		1	\N	\N
56	application	cookie-policy	delete	f		2	\N	\N
65	application	domain-expert	delete	f		1	\N	\N
74	application	events-page	delete	f		2	\N	\N
84	application	faq-page	update	f		2	\N	\N
103	application	privacy-policies	delete	f		1	\N	\N
112	application	product-filters	create	f		2	\N	\N
122	application	product-main-categories	count	f		2	\N	\N
132	application	product-main-categories	update	f		2	\N	\N
162	application	safeguarding	update	f		2	\N	\N
224	content-manager	collection-types	bulkdelete	f		2	\N	\N
245	content-manager	components	updatecomponentconfiguration	f		1	\N	\N
273	content-type-builder	componentcategories	deletecategory	f		1	\N	\N
283	content-type-builder	components	getcomponents	f		1	\N	\N
293	content-type-builder	contenttypes	getcontenttype	f		1	\N	\N
303	email	email	test	f		1	\N	\N
312	i18n	locales	deletelocale	f		2	\N	\N
322	upload	upload	find	f		2	\N	\N
332	upload	upload	upload	f		2	\N	\N
342	users-permissions	auth	register	t		2	\N	\N
352	users-permissions	user	destroy	f		2	\N	\N
362	users-permissions	user	update	f		2	\N	\N
372	users-permissions	userspermissions	getpermissions	f		2	\N	\N
383	users-permissions	userspermissions	index	f		1	\N	\N
393	users-permissions	userspermissions	updaterole	f		2	\N	\N
142	application	product-secondary-categories	findone	t		2	\N	\N
93	application	message	create	t		2	\N	\N
152	application	product	find	t		2	\N	\N
171	application	single-event	create	t		1	\N	\N
397	application	discounts	create	t		1	\N	\N
405	application	discounts	update	t		1	\N	\N
191	application	social-media-account	update	t		1	\N	\N
181	application	social-media-account	count	t		1	\N	\N
201	application	team-member	findone	t		1	\N	\N
211	application	testimonial	count	t		1	\N	\N
235	content-manager	collection-types	publish	t		1	\N	\N
265	content-manager	single-types	unpublish	t		1	\N	\N
255	content-manager	relations	find	t		1	\N	\N
73	application	events-page	delete	f		1	\N	\N
104	application	privacy-policies	delete	f		2	\N	\N
114	application	product-filters	delete	f		2	\N	\N
124	application	product-main-categories	create	f		2	\N	\N
134	application	product-secondary-categories	count	f		2	\N	\N
144	application	product-secondary-categories	update	f		2	\N	\N
163	application	services	delete	f		1	\N	\N
173	application	single-event	delete	f		1	\N	\N
241	content-manager	components	findcomponentconfiguration	f		1	\N	\N
251	content-manager	content-types	findcontenttypessettings	f		1	\N	\N
271	content-type-builder	builder	getreservednames	f		1	\N	\N
280	content-type-builder	components	deletecomponent	f		2	\N	\N
290	content-type-builder	contenttypes	createcontenttype	f		2	\N	\N
301	email	email	send	f		1	\N	\N
311	i18n	locales	deletelocale	f		1	\N	\N
320	upload	upload	destroy	f		2	\N	\N
330	upload	upload	updatesettings	f		2	\N	\N
340	users-permissions	auth	forgotpassword	t		2	\N	\N
348	users-permissions	user	count	f		2	\N	\N
368	users-permissions	userspermissions	getadvancedsettings	f		2	\N	\N
378	users-permissions	userspermissions	getrole	f		2	\N	\N
387	users-permissions	userspermissions	updateadvancedsettings	f		1	\N	\N
398	application	discounts	create	f		2	\N	\N
154	application	product	findone	t		2	\N	\N
358	users-permissions	user	findone	t		2	\N	\N
63	application	domain-expert	create	t		1	\N	\N
94	application	message	create	t		1	\N	\N
183	application	social-media-account	create	t		1	\N	\N
51	application	contact	find	t		1	\N	\N
193	application	team-member	count	t		1	\N	\N
203	application	team-member	update	t		1	\N	\N
83	application	faq-page	update	t		1	\N	\N
221	application	testimonial	update	t		1	\N	\N
213	application	testimonial	create	t		1	\N	\N
231	content-manager	collection-types	findone	t		1	\N	\N
261	content-manager	single-types	find	t		1	\N	\N
78	application	events-page	update	f		2	\N	\N
89	application	home-page	update	f		2	\N	\N
100	application	message	findone	f		2	\N	\N
172	application	single-event	create	f		2	\N	\N
182	application	social-media-account	count	f		2	\N	\N
192	application	social-media-account	update	f		2	\N	\N
212	application	testimonial	count	f		2	\N	\N
234	content-manager	collection-types	previewmanyrelations	f		2	\N	\N
244	content-manager	components	findcomponents	f		2	\N	\N
254	content-manager	content-types	updatecontenttypeconfiguration	f		2	\N	\N
275	content-type-builder	componentcategories	editcategory	f		1	\N	\N
285	content-type-builder	components	updatecomponent	f		1	\N	\N
295	content-type-builder	contenttypes	getcontenttypes	f		1	\N	\N
304	email	email	test	f		2	\N	\N
314	i18n	locales	listlocales	f		2	\N	\N
324	upload	upload	findone	f		2	\N	\N
334	users-permissions	auth	callback	t		2	\N	\N
344	users-permissions	auth	resetpassword	t		2	\N	\N
354	users-permissions	user	destroyall	f		2	\N	\N
364	users-permissions	userspermissions	createrole	f		2	\N	\N
374	users-permissions	userspermissions	getpolicies	f		2	\N	\N
384	users-permissions	userspermissions	index	f		2	\N	\N
392	users-permissions	userspermissions	updateproviders	f		2	\N	\N
399	application	discounts	delete	f		1	\N	\N
58	application	cookie-policy	find	t		2	\N	\N
202	application	team-member	findone	t		2	\N	\N
131	application	product-main-categories	update	t		1	\N	\N
121	application	product-main-categories	count	t		1	\N	\N
69	application	domain-expert	findone	t		1	\N	\N
111	application	product-filters	create	t		1	\N	\N
141	application	product-secondary-categories	findone	t		1	\N	\N
151	application	product	find	t		1	\N	\N
161	application	safeguarding	update	t		1	\N	\N
225	content-manager	collection-types	create	t		1	\N	\N
263	content-manager	single-types	publish	t		1	\N	\N
120	application	product-filters	update	f		2	\N	\N
150	application	product	delete	f		2	\N	\N
226	content-manager	collection-types	create	f		2	\N	\N
236	content-manager	collection-types	publish	f		2	\N	\N
246	content-manager	components	updatecomponentconfiguration	f		2	\N	\N
267	content-manager	uid	checkuidavailability	f		1	\N	\N
276	content-type-builder	componentcategories	editcategory	f		2	\N	\N
286	content-type-builder	components	updatecomponent	f		2	\N	\N
296	content-type-builder	contenttypes	getcontenttypes	f		2	\N	\N
306	i18n	content-types	getnonlocalizedattributes	f		2	\N	\N
316	i18n	locales	updatelocale	f		2	\N	\N
326	upload	upload	getsettings	f		2	\N	\N
337	users-permissions	auth	emailconfirmation	f		1	\N	\N
351	users-permissions	user	destroy	f		1	\N	\N
361	users-permissions	user	update	f		1	\N	\N
371	users-permissions	userspermissions	getpermissions	f		1	\N	\N
379	users-permissions	userspermissions	getroles	f		1	\N	\N
389	users-permissions	userspermissions	updateemailtemplate	f		1	\N	\N
400	application	discounts	delete	f		2	\N	\N
140	application	product-secondary-categories	find	t		2	\N	\N
160	application	safeguarding	find	t		2	\N	\N
110	application	product-filters	count	t		2	\N	\N
130	application	product-main-categories	findone	t		2	\N	\N
52	application	contact	find	t		2	\N	\N
71	application	domain-expert	update	t		1	\N	\N
61	application	domain-expert	count	t		1	\N	\N
179	application	single-event	update	t		1	\N	\N
169	application	single-event	count	t		1	\N	\N
91	application	message	count	t		1	\N	\N
101	application	message	update	t		1	\N	\N
189	application	social-media-account	findone	t		1	\N	\N
199	application	team-member	find	t		1	\N	\N
81	application	faq-page	find	t		1	\N	\N
219	application	testimonial	findone	t		1	\N	\N
209	application	terms-conditions	update	t		1	\N	\N
257	content-manager	single-types	createorupdate	t		1	\N	\N
62	application	domain-expert	count	f		2	\N	\N
72	application	domain-expert	update	f		2	\N	\N
92	application	message	count	f		2	\N	\N
102	application	message	update	f		2	\N	\N
113	application	product-filters	delete	f		1	\N	\N
185	application	social-media-account	delete	f		1	\N	\N
205	application	terms-conditions	delete	f		1	\N	\N
215	application	testimonial	delete	f		1	\N	\N
223	content-manager	collection-types	bulkdelete	f		1	\N	\N
233	content-manager	collection-types	previewmanyrelations	f		1	\N	\N
243	content-manager	components	findcomponents	f		1	\N	\N
252	content-manager	content-types	findcontenttypessettings	f		2	\N	\N
262	content-manager	single-types	find	f		2	\N	\N
272	content-type-builder	builder	getreservednames	f		2	\N	\N
282	content-type-builder	components	getcomponent	f		2	\N	\N
292	content-type-builder	contenttypes	deletecontenttype	f		2	\N	\N
302	email	email	send	f		2	\N	\N
313	i18n	locales	listlocales	f		1	\N	\N
323	upload	upload	findone	f		1	\N	\N
333	users-permissions	auth	callback	f		1	\N	\N
343	users-permissions	auth	resetpassword	f		1	\N	\N
353	users-permissions	user	destroyall	f		1	\N	\N
363	users-permissions	userspermissions	createrole	f		1	\N	\N
373	users-permissions	userspermissions	getpolicies	f		1	\N	\N
382	users-permissions	userspermissions	getroutes	f		2	\N	\N
394	users-permissions	userspermissions	updaterole	f		1	\N	\N
82	application	faq-page	find	t		2	\N	\N
123	application	product-main-categories	create	t		1	\N	\N
175	application	single-event	find	t		1	\N	\N
401	application	discounts	find	t		1	\N	\N
53	application	contact	update	t		1	\N	\N
143	application	product-secondary-categories	update	t		1	\N	\N
133	application	product-secondary-categories	count	t		1	\N	\N
195	application	team-member	create	t		1	\N	\N
153	application	product	findone	t		1	\N	\N
165	application	services	find	t		1	\N	\N
87	application	home-page	delete	f		2	\N	\N
108	application	privacy-policies	update	f		2	\N	\N
137	application	product-secondary-categories	delete	f		1	\N	\N
157	application	safeguarding	delete	f		1	\N	\N
197	application	team-member	delete	f		1	\N	\N
216	application	testimonial	delete	f		2	\N	\N
228	content-manager	collection-types	delete	f		2	\N	\N
238	content-manager	collection-types	unpublish	f		2	\N	\N
249	content-manager	content-types	findcontenttypes	f		1	\N	\N
260	content-manager	single-types	delete	f		2	\N	\N
269	content-manager	uid	generateuid	f		1	\N	\N
279	content-type-builder	components	deletecomponent	f		1	\N	\N
289	content-type-builder	contenttypes	createcontenttype	f		1	\N	\N
298	content-type-builder	contenttypes	updatecontenttype	f		2	\N	\N
308	i18n	iso-locales	listisolocales	f		2	\N	\N
318	upload	upload	count	f		2	\N	\N
327	upload	upload	search	f		1	\N	\N
336	users-permissions	auth	connect	t		2	\N	\N
346	users-permissions	auth	sendemailconfirmation	f		2	\N	\N
365	users-permissions	userspermissions	deleterole	f		1	\N	\N
375	users-permissions	userspermissions	getproviders	f		1	\N	\N
386	users-permissions	userspermissions	searchusers	f		1	\N	\N
402	application	discounts	find	t		2	\N	\N
68	application	domain-expert	find	t		2	\N	\N
127	application	product-main-categories	find	t		1	\N	\N
59	application	cookie-policy	update	t		1	\N	\N
177	application	single-event	findone	t		1	\N	\N
97	application	message	find	t		1	\N	\N
119	application	product-filters	update	t		1	\N	\N
187	application	social-media-account	find	t		1	\N	\N
77	application	events-page	update	t		1	\N	\N
147	application	product	create	t		1	\N	\N
207	application	terms-conditions	find	t		1	\N	\N
167	application	services	update	t		1	\N	\N
355	users-permissions	user	find	t		1	\N	\N
253	content-manager	content-types	updatecontenttypeconfiguration	f		1	\N	\N
264	content-manager	single-types	publish	f		2	\N	\N
274	content-type-builder	componentcategories	deletecategory	f		2	\N	\N
284	content-type-builder	components	getcomponents	f		2	\N	\N
294	content-type-builder	contenttypes	getcontenttype	f		2	\N	\N
305	i18n	content-types	getnonlocalizedattributes	f		1	\N	\N
315	i18n	locales	updatelocale	f		1	\N	\N
325	upload	upload	getsettings	f		1	\N	\N
335	users-permissions	auth	connect	t		1	\N	\N
345	users-permissions	auth	sendemailconfirmation	f		1	\N	\N
366	users-permissions	userspermissions	deleterole	f		2	\N	\N
376	users-permissions	userspermissions	getproviders	f		2	\N	\N
385	users-permissions	userspermissions	searchusers	f		2	\N	\N
356	users-permissions	user	find	t		2	\N	\N
403	application	discounts	findone	t		1	\N	\N
288	content-type-builder	connections	getconnections	f		2	\N	\N
299	email	email	getsettings	f		1	\N	\N
309	i18n	locales	createlocale	f		1	\N	\N
321	upload	upload	find	f		1	\N	\N
331	upload	upload	upload	f		1	\N	\N
341	users-permissions	auth	register	f		1	\N	\N
349	users-permissions	user	create	f		1	\N	\N
359	users-permissions	user	me	t		1	\N	\N
369	users-permissions	userspermissions	getemailtemplate	f		1	\N	\N
380	users-permissions	userspermissions	getroutes	f		1	\N	\N
391	users-permissions	userspermissions	updateproviders	f		1	\N	\N
404	application	discounts	findone	t		2	\N	\N
395	application	discounts	count	f		2	\N	\N
406	application	discounts	update	f		2	\N	\N
38	application	article	find	t		2	\N	\N
32	application	article	count	t		2	\N	\N
106	application	privacy-policies	find	t		2	\N	\N
26	application	article-tag	find	t		2	\N	\N
40	application	article	findone	t		2	\N	\N
28	application	article-tag	findone	t		2	\N	\N
79	application	faq-page	delete	f		1	\N	\N
96	application	message	delete	f		2	\N	\N
149	application	product	delete	f		1	\N	\N
180	application	single-event	update	f		2	\N	\N
210	application	terms-conditions	update	f		2	\N	\N
227	content-manager	collection-types	delete	f		1	\N	\N
247	content-manager	content-types	findcontenttypeconfiguration	f		1	\N	\N
256	content-manager	relations	find	f		2	\N	\N
266	content-manager	single-types	unpublish	f		2	\N	\N
277	content-type-builder	components	createcomponent	f		1	\N	\N
287	content-type-builder	connections	getconnections	f		1	\N	\N
297	content-type-builder	contenttypes	updatecontenttype	f		1	\N	\N
307	i18n	iso-locales	listisolocales	f		1	\N	\N
317	upload	upload	count	f		1	\N	\N
328	upload	upload	search	f		2	\N	\N
338	users-permissions	auth	emailconfirmation	t		2	\N	\N
350	users-permissions	user	create	f		2	\N	\N
360	users-permissions	user	me	t		2	\N	\N
370	users-permissions	userspermissions	getemailtemplate	f		2	\N	\N
381	users-permissions	userspermissions	getroles	f		2	\N	\N
390	users-permissions	userspermissions	updateemailtemplate	f		2	\N	\N
190	application	social-media-account	findone	t		2	\N	\N
220	application	testimonial	findone	t		2	\N	\N
70	application	domain-expert	findone	t		2	\N	\N
200	application	team-member	find	t		2	\N	\N
170	application	single-event	count	t		2	\N	\N
129	application	product-main-categories	findone	t		1	\N	\N
57	application	cookie-policy	find	t		1	\N	\N
117	application	product-filters	findone	t		1	\N	\N
139	application	product-secondary-categories	find	t		1	\N	\N
107	application	privacy-policies	update	t		1	\N	\N
86	application	home-page	find	t		1	\N	\N
159	application	safeguarding	find	t		1	\N	\N
237	content-manager	collection-types	unpublish	t		1	\N	\N
\.


--
-- Data for Name: users-permissions_role; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public."users-permissions_role" (id, name, description, type, created_by, updated_by) FROM stdin;
2	Public	Default role given to unauthenticated user.	public	\N	\N
1	Authenticated	Default role given to authenticated user.	authenticated	\N	\N
\.


--
-- Data for Name: users-permissions_user; Type: TABLE DATA; Schema: public; Owner: strapi
--

COPY public."users-permissions_user" (id, username, email, provider, password, "resetPasswordToken", "confirmationToken", confirmed, blocked, role, created_by, updated_by, created_at, updated_at) FROM stdin;
1	johntesting	test@test.com	local	$2a$10$UurfBosH3RYNrGa2kfNkx.toDl5cW/HrhaxGftfYB5na42jgq1m6.	\N	\N	t	f	1	1	1	2021-09-29 21:19:04.645+01	2021-09-29 23:07:54.461+01
2	editor	editor@example.com	local	$2a$10$FukHkLfmXcovxdYT/Nih1uIdtXBJwM12gCpXM1g.iOgq8od77.Ioy	\N	\N	t	f	1	1	1	2021-09-29 23:08:56.488+01	2021-09-29 23:08:56.495+01
\.


--
-- Name: aboutuses_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.aboutuses_components_id_seq', 3, true);


--
-- Name: aboutuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.aboutuses_id_seq', 1, true);


--
-- Name: article_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.article_categories_id_seq', 2, true);


--
-- Name: article_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.article_tags_id_seq', 2, true);


--
-- Name: articles_article_categories__article_categories_articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.articles_article_categories__article_categories_articles_id_seq', 4, true);


--
-- Name: articles_article_tags__article_tags_articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.articles_article_tags__article_tags_articles_id_seq', 3, true);


--
-- Name: articles_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.articles_components_id_seq', 3, true);


--
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.articles_id_seq', 3, true);


--
-- Name: articles_pages_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.articles_pages_components_id_seq', 1, true);


--
-- Name: articles_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.articles_pages_id_seq', 1, true);


--
-- Name: components_page_content_page_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.components_page_content_page_contents_id_seq', 14, true);


--
-- Name: components_page_section_page_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.components_page_section_page_sections_id_seq', 15, true);


--
-- Name: components_page_section_sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.components_page_section_sections_id_seq', 1, false);


--
-- Name: components_testimonials_testimonials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.components_testimonials_testimonials_id_seq', 1, false);


--
-- Name: contacts_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.contacts_components_id_seq', 1, true);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.contacts_id_seq', 1, true);


--
-- Name: cookie_policies_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.cookie_policies_components_id_seq', 1, true);


--
-- Name: cookie_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.cookie_policies_id_seq', 1, true);


--
-- Name: core_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.core_store_id_seq', 82, true);


--
-- Name: discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.discounts_id_seq', 2, true);


--
-- Name: discounts_products__products_discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.discounts_products__products_discounts_id_seq', 3, true);


--
-- Name: domain_experts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.domain_experts_id_seq', 1, true);


--
-- Name: events_pages_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.events_pages_components_id_seq', 1, true);


--
-- Name: events_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.events_pages_id_seq', 1, true);


--
-- Name: faq_pages_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.faq_pages_components_id_seq', 1, true);


--
-- Name: faq_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.faq_pages_id_seq', 1, true);


--
-- Name: home_pages_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.home_pages_components_id_seq', 6, true);


--
-- Name: home_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.home_pages_id_seq', 1, true);


--
-- Name: i18n_locales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.i18n_locales_id_seq', 1, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: privacy_policies_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.privacy_policies_components_id_seq', 1, true);


--
-- Name: privacy_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.privacy_policies_id_seq', 1, true);


--
-- Name: product_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.product_filters_id_seq', 1, false);


--
-- Name: product_main_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.product_main_categories_id_seq', 2, true);


--
-- Name: product_secondary_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.product_secondary_categories_id_seq', 2, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.products_id_seq', 3, true);


--
-- Name: products_product_main_categories__product_main_categorie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.products_product_main_categories__product_main_categorie_id_seq', 6, true);


--
-- Name: products_product_secondary_categories__product_secondary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.products_product_secondary_categories__product_secondary_id_seq', 6, true);


--
-- Name: safe_guardings_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.safe_guardings_components_id_seq', 4, true);


--
-- Name: safe_guardings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.safe_guardings_id_seq', 1, true);


--
-- Name: services_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.services_components_id_seq', 6, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.services_id_seq', 1, true);


--
-- Name: single_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.single_events_id_seq', 3, true);


--
-- Name: social_media_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.social_media_accounts_id_seq', 3, true);


--
-- Name: strapi_administrator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_administrator_id_seq', 3, true);


--
-- Name: strapi_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_permission_id_seq', 2186, true);


--
-- Name: strapi_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_role_id_seq', 3, true);


--
-- Name: strapi_users_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_users_roles_id_seq', 4, true);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: team_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.team_members_id_seq', 4, true);


--
-- Name: terms_conditions_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.terms_conditions_components_id_seq', 1, true);


--
-- Name: terms_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.terms_conditions_id_seq', 1, true);


--
-- Name: testimonials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.testimonials_id_seq', 4, true);


--
-- Name: upload_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.upload_file_id_seq', 70, true);


--
-- Name: upload_file_morph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public.upload_file_morph_id_seq', 136, true);


--
-- Name: users-permissions_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public."users-permissions_permission_id_seq"', 406, true);


--
-- Name: users-permissions_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public."users-permissions_role_id_seq"', 2, true);


--
-- Name: users-permissions_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: strapi
--

SELECT pg_catalog.setval('public."users-permissions_user_id_seq"', 2, true);


--
-- Name: aboutuses_components aboutuses_components_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.aboutuses_components
    ADD CONSTRAINT aboutuses_components_pkey PRIMARY KEY (id);


--
-- Name: aboutuses aboutuses_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.aboutuses
    ADD CONSTRAINT aboutuses_pkey PRIMARY KEY (id);


--
-- Name: aboutuses aboutuses_title_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.aboutuses
    ADD CONSTRAINT aboutuses_title_unique UNIQUE (title);


--
-- Name: article_categories article_categories_category_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.article_categories
    ADD CONSTRAINT article_categories_category_unique UNIQUE (category);


--
-- Name: article_categories article_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.article_categories
    ADD CONSTRAINT article_categories_pkey PRIMARY KEY (id);


--
-- Name: article_categories article_categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.article_categories
    ADD CONSTRAINT article_categories_slug_unique UNIQUE (slug);


--
-- Name: article_tags article_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.article_tags
    ADD CONSTRAINT article_tags_pkey PRIMARY KEY (id);


--
-- Name: article_tags article_tags_slug_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.article_tags
    ADD CONSTRAINT article_tags_slug_unique UNIQUE (slug);


--
-- Name: article_tags article_tags_tag_name_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.article_tags
    ADD CONSTRAINT article_tags_tag_name_unique UNIQUE (tag_name);


--
-- Name: articles_article_categories__article_categories_articles articles_article_categories__article_categories_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles_article_categories__article_categories_articles
    ADD CONSTRAINT articles_article_categories__article_categories_articles_pkey PRIMARY KEY (id);


--
-- Name: articles_article_tags__article_tags_articles articles_article_tags__article_tags_articles_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles_article_tags__article_tags_articles
    ADD CONSTRAINT articles_article_tags__article_tags_articles_pkey PRIMARY KEY (id);


--
-- Name: articles_components articles_components_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles_components
    ADD CONSTRAINT articles_components_pkey PRIMARY KEY (id);


--
-- Name: articles_pages_components articles_pages_components_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles_pages_components
    ADD CONSTRAINT articles_pages_components_pkey PRIMARY KEY (id);


--
-- Name: articles_pages articles_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles_pages
    ADD CONSTRAINT articles_pages_pkey PRIMARY KEY (id);


--
-- Name: articles_pages articles_pages_title_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles_pages
    ADD CONSTRAINT articles_pages_title_unique UNIQUE (title);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: articles articles_slug_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_slug_unique UNIQUE (slug);


--
-- Name: articles articles_title_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_title_unique UNIQUE (title);


--
-- Name: components_page_content_page_contents components_page_content_page_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.components_page_content_page_contents
    ADD CONSTRAINT components_page_content_page_contents_pkey PRIMARY KEY (id);


--
-- Name: components_page_section_page_sections components_page_section_page_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.components_page_section_page_sections
    ADD CONSTRAINT components_page_section_page_sections_pkey PRIMARY KEY (id);


--
-- Name: components_page_section_sections components_page_section_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.components_page_section_sections
    ADD CONSTRAINT components_page_section_sections_pkey PRIMARY KEY (id);


--
-- Name: components_testimonials_testimonials components_testimonials_testimonials_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.components_testimonials_testimonials
    ADD CONSTRAINT components_testimonials_testimonials_pkey PRIMARY KEY (id);


--
-- Name: contacts_components contacts_components_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contacts_components
    ADD CONSTRAINT contacts_components_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_title_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_title_unique UNIQUE (title);


--
-- Name: cookie_policies_components cookie_policies_components_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.cookie_policies_components
    ADD CONSTRAINT cookie_policies_components_pkey PRIMARY KEY (id);


--
-- Name: cookie_policies cookie_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.cookie_policies
    ADD CONSTRAINT cookie_policies_pkey PRIMARY KEY (id);


--
-- Name: cookie_policies cookie_policies_title_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.cookie_policies
    ADD CONSTRAINT cookie_policies_title_unique UNIQUE (title);


--
-- Name: core_store core_store_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.core_store
    ADD CONSTRAINT core_store_pkey PRIMARY KEY (id);


--
-- Name: discounts discounts_name_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_name_unique UNIQUE (name);


--
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (id);


--
-- Name: discounts_products__products_discounts discounts_products__products_discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.discounts_products__products_discounts
    ADD CONSTRAINT discounts_products__products_discounts_pkey PRIMARY KEY (id);


--
-- Name: domain_experts domain_experts_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.domain_experts
    ADD CONSTRAINT domain_experts_pkey PRIMARY KEY (id);


--
-- Name: domain_experts domain_experts_title_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.domain_experts
    ADD CONSTRAINT domain_experts_title_unique UNIQUE (title);


--
-- Name: events_pages_components events_pages_components_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.events_pages_components
    ADD CONSTRAINT events_pages_components_pkey PRIMARY KEY (id);


--
-- Name: events_pages events_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.events_pages
    ADD CONSTRAINT events_pages_pkey PRIMARY KEY (id);


--
-- Name: events_pages events_pages_title_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.events_pages
    ADD CONSTRAINT events_pages_title_unique UNIQUE (title);


--
-- Name: faq_pages_components faq_pages_components_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.faq_pages_components
    ADD CONSTRAINT faq_pages_components_pkey PRIMARY KEY (id);


--
-- Name: faq_pages faq_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.faq_pages
    ADD CONSTRAINT faq_pages_pkey PRIMARY KEY (id);


--
-- Name: faq_pages faq_pages_title_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.faq_pages
    ADD CONSTRAINT faq_pages_title_unique UNIQUE (title);


--
-- Name: home_pages_components home_pages_components_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.home_pages_components
    ADD CONSTRAINT home_pages_components_pkey PRIMARY KEY (id);


--
-- Name: home_pages home_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.home_pages
    ADD CONSTRAINT home_pages_pkey PRIMARY KEY (id);


--
-- Name: home_pages home_pages_title_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.home_pages
    ADD CONSTRAINT home_pages_title_unique UNIQUE (title);


--
-- Name: i18n_locales i18n_locales_code_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.i18n_locales
    ADD CONSTRAINT i18n_locales_code_unique UNIQUE (code);


--
-- Name: i18n_locales i18n_locales_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.i18n_locales
    ADD CONSTRAINT i18n_locales_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: privacy_policies_components privacy_policies_components_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.privacy_policies_components
    ADD CONSTRAINT privacy_policies_components_pkey PRIMARY KEY (id);


--
-- Name: privacy_policies privacy_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.privacy_policies
    ADD CONSTRAINT privacy_policies_pkey PRIMARY KEY (id);


--
-- Name: privacy_policies privacy_policies_title_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.privacy_policies
    ADD CONSTRAINT privacy_policies_title_unique UNIQUE (title);


--
-- Name: product_filters product_filters_filter_name_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_filters
    ADD CONSTRAINT product_filters_filter_name_unique UNIQUE (filter_name);


--
-- Name: product_filters product_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_filters
    ADD CONSTRAINT product_filters_pkey PRIMARY KEY (id);


--
-- Name: product_filters product_filters_slug_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_filters
    ADD CONSTRAINT product_filters_slug_unique UNIQUE (slug);


--
-- Name: product_main_categories product_main_categories_categ_name_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_main_categories
    ADD CONSTRAINT product_main_categories_categ_name_unique UNIQUE (categ_name);


--
-- Name: product_main_categories product_main_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_main_categories
    ADD CONSTRAINT product_main_categories_pkey PRIMARY KEY (id);


--
-- Name: product_main_categories product_main_categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_main_categories
    ADD CONSTRAINT product_main_categories_slug_unique UNIQUE (slug);


--
-- Name: product_secondary_categories product_secondary_categories_categ_name_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_secondary_categories
    ADD CONSTRAINT product_secondary_categories_categ_name_unique UNIQUE (categ_name);


--
-- Name: product_secondary_categories product_secondary_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_secondary_categories
    ADD CONSTRAINT product_secondary_categories_pkey PRIMARY KEY (id);


--
-- Name: product_secondary_categories product_secondary_categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.product_secondary_categories
    ADD CONSTRAINT product_secondary_categories_slug_unique UNIQUE (slug);


--
-- Name: products products_SKU_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_SKU_unique" UNIQUE ("SKU");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products_product_main_categories__product_main_categories_produ products_product_main_categories__product_main_categories__pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products_product_main_categories__product_main_categories_produ
    ADD CONSTRAINT products_product_main_categories__product_main_categories__pkey PRIMARY KEY (id);


--
-- Name: products products_product_name_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_name_unique UNIQUE (product_name);


--
-- Name: products_product_secondary_categories__product_secondary_catego products_product_secondary_categories__product_secondary_c_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products_product_secondary_categories__product_secondary_catego
    ADD CONSTRAINT products_product_secondary_categories__product_secondary_c_pkey PRIMARY KEY (id);


--
-- Name: products products_slug_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_slug_unique UNIQUE (slug);


--
-- Name: safe_guardings_components safe_guardings_components_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.safe_guardings_components
    ADD CONSTRAINT safe_guardings_components_pkey PRIMARY KEY (id);


--
-- Name: safe_guardings safe_guardings_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.safe_guardings
    ADD CONSTRAINT safe_guardings_pkey PRIMARY KEY (id);


--
-- Name: safe_guardings safe_guardings_title_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.safe_guardings
    ADD CONSTRAINT safe_guardings_title_unique UNIQUE (title);


--
-- Name: services_components services_components_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.services_components
    ADD CONSTRAINT services_components_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: services services_title_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_title_unique UNIQUE (title);


--
-- Name: single_events single_events_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.single_events
    ADD CONSTRAINT single_events_pkey PRIMARY KEY (id);


--
-- Name: single_events single_events_slug_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.single_events
    ADD CONSTRAINT single_events_slug_unique UNIQUE (slug);


--
-- Name: social_media_accounts social_media_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.social_media_accounts
    ADD CONSTRAINT social_media_accounts_pkey PRIMARY KEY (id);


--
-- Name: social_media_accounts social_media_accounts_title_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.social_media_accounts
    ADD CONSTRAINT social_media_accounts_title_unique UNIQUE (title);


--
-- Name: strapi_administrator strapi_administrator_email_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_administrator
    ADD CONSTRAINT strapi_administrator_email_unique UNIQUE (email);


--
-- Name: strapi_administrator strapi_administrator_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_administrator
    ADD CONSTRAINT strapi_administrator_pkey PRIMARY KEY (id);


--
-- Name: strapi_permission strapi_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_permission
    ADD CONSTRAINT strapi_permission_pkey PRIMARY KEY (id);


--
-- Name: strapi_role strapi_role_code_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_role
    ADD CONSTRAINT strapi_role_code_unique UNIQUE (code);


--
-- Name: strapi_role strapi_role_name_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_role
    ADD CONSTRAINT strapi_role_name_unique UNIQUE (name);


--
-- Name: strapi_role strapi_role_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_role
    ADD CONSTRAINT strapi_role_pkey PRIMARY KEY (id);


--
-- Name: strapi_users_roles strapi_users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_users_roles
    ADD CONSTRAINT strapi_users_roles_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: team_members team_members_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.team_members
    ADD CONSTRAINT team_members_pkey PRIMARY KEY (id);


--
-- Name: terms_conditions_components terms_conditions_components_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.terms_conditions_components
    ADD CONSTRAINT terms_conditions_components_pkey PRIMARY KEY (id);


--
-- Name: terms_conditions terms_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.terms_conditions
    ADD CONSTRAINT terms_conditions_pkey PRIMARY KEY (id);


--
-- Name: terms_conditions terms_conditions_title_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.terms_conditions
    ADD CONSTRAINT terms_conditions_title_unique UNIQUE (title);


--
-- Name: testimonials testimonials_author_name_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.testimonials
    ADD CONSTRAINT testimonials_author_name_unique UNIQUE (author_name);


--
-- Name: testimonials testimonials_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.testimonials
    ADD CONSTRAINT testimonials_pkey PRIMARY KEY (id);


--
-- Name: upload_file_morph upload_file_morph_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_file_morph
    ADD CONSTRAINT upload_file_morph_pkey PRIMARY KEY (id);


--
-- Name: upload_file upload_file_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.upload_file
    ADD CONSTRAINT upload_file_pkey PRIMARY KEY (id);


--
-- Name: users-permissions_permission users-permissions_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public."users-permissions_permission"
    ADD CONSTRAINT "users-permissions_permission_pkey" PRIMARY KEY (id);


--
-- Name: users-permissions_role users-permissions_role_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public."users-permissions_role"
    ADD CONSTRAINT "users-permissions_role_pkey" PRIMARY KEY (id);


--
-- Name: users-permissions_role users-permissions_role_type_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public."users-permissions_role"
    ADD CONSTRAINT "users-permissions_role_type_unique" UNIQUE (type);


--
-- Name: users-permissions_user users-permissions_user_pkey; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public."users-permissions_user"
    ADD CONSTRAINT "users-permissions_user_pkey" PRIMARY KEY (id);


--
-- Name: users-permissions_user users-permissions_user_username_unique; Type: CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public."users-permissions_user"
    ADD CONSTRAINT "users-permissions_user_username_unique" UNIQUE (username);


--
-- Name: aboutuses_components aboutus_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.aboutuses_components
    ADD CONSTRAINT aboutus_id_fk FOREIGN KEY (aboutus_id) REFERENCES public.aboutuses(id) ON DELETE CASCADE;


--
-- Name: articles_components article_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles_components
    ADD CONSTRAINT article_id_fk FOREIGN KEY (article_id) REFERENCES public.articles(id) ON DELETE CASCADE;


--
-- Name: articles_pages_components articles_page_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.articles_pages_components
    ADD CONSTRAINT articles_page_id_fk FOREIGN KEY (articles_page_id) REFERENCES public.articles_pages(id) ON DELETE CASCADE;


--
-- Name: contacts_components contact_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.contacts_components
    ADD CONSTRAINT contact_id_fk FOREIGN KEY (contact_id) REFERENCES public.contacts(id) ON DELETE CASCADE;


--
-- Name: cookie_policies_components cookie_policy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.cookie_policies_components
    ADD CONSTRAINT cookie_policy_id_fk FOREIGN KEY (cookie_policy_id) REFERENCES public.cookie_policies(id) ON DELETE CASCADE;


--
-- Name: events_pages_components events_page_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.events_pages_components
    ADD CONSTRAINT events_page_id_fk FOREIGN KEY (events_page_id) REFERENCES public.events_pages(id) ON DELETE CASCADE;


--
-- Name: faq_pages_components faq_page_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.faq_pages_components
    ADD CONSTRAINT faq_page_id_fk FOREIGN KEY (faq_page_id) REFERENCES public.faq_pages(id) ON DELETE CASCADE;


--
-- Name: home_pages_components home_page_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.home_pages_components
    ADD CONSTRAINT home_page_id_fk FOREIGN KEY (home_page_id) REFERENCES public.home_pages(id) ON DELETE CASCADE;


--
-- Name: privacy_policies_components privacy_policy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.privacy_policies_components
    ADD CONSTRAINT privacy_policy_id_fk FOREIGN KEY (privacy_policy_id) REFERENCES public.privacy_policies(id) ON DELETE CASCADE;


--
-- Name: safe_guardings_components safe_guarding_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.safe_guardings_components
    ADD CONSTRAINT safe_guarding_id_fk FOREIGN KEY (safe_guarding_id) REFERENCES public.safe_guardings(id) ON DELETE CASCADE;


--
-- Name: services_components service_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.services_components
    ADD CONSTRAINT service_id_fk FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: terms_conditions_components terms_condition_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: strapi
--

ALTER TABLE ONLY public.terms_conditions_components
    ADD CONSTRAINT terms_condition_id_fk FOREIGN KEY (terms_condition_id) REFERENCES public.terms_conditions(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

