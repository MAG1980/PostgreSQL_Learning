PGDMP                     	    z            ozon %   12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)    14.4 �    p           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            q           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            r           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            s           1262    90112    ozon    DATABASE     Y   CREATE DATABASE ozon WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'ru_RU.UTF-8';
    DROP DATABASE ozon;
                postgres    false            t           0    0    DATABASE ozon    ACL     '   GRANT ALL ON DATABASE ozon TO gb_user;
                   postgres    false    3187            �            1259    90203    avatars    TABLE     �   CREATE TABLE public.avatars (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    size integer NOT NULL,
    created_at timestamp without time zone
);
    DROP TABLE public.avatars;
       public         heap    gb_user    false            �            1259    90201    avatars_id_seq    SEQUENCE     �   CREATE SEQUENCE public.avatars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.avatars_id_seq;
       public          gb_user    false    207            u           0    0    avatars_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.avatars_id_seq OWNED BY public.avatars.id;
          public          gb_user    false    206            �            1259    90356 
   brand_logo    TABLE     �   CREATE TABLE public.brand_logo (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    size integer NOT NULL,
    created_at timestamp without time zone
);
    DROP TABLE public.brand_logo;
       public         heap    gb_user    false            �            1259    90354    brand_logo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brand_logo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.brand_logo_id_seq;
       public          gb_user    false    218            v           0    0    brand_logo_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.brand_logo_id_seq OWNED BY public.brand_logo.id;
          public          gb_user    false    217            �            1259    90437    carts    TABLE     X   CREATE TABLE public.carts (
    id integer NOT NULL,
    clients_id integer NOT NULL
);
    DROP TABLE public.carts;
       public         heap    gb_user    false            �            1259    90435    carts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.carts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.carts_id_seq;
       public          gb_user    false    228            w           0    0    carts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;
          public          gb_user    false    227            �            1259    90518    carts_products    TABLE     �   CREATE TABLE public.carts_products (
    carts_id integer NOT NULL,
    products_id integer NOT NULL,
    product_amount integer NOT NULL,
    product_price numeric,
    product_discount numeric
);
 "   DROP TABLE public.carts_products;
       public         heap    gb_user    false            �            1259    90320 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(50),
    created_at timestamp without time zone,
    parent_id integer
);
    DROP TABLE public.categories;
       public         heap    gb_user    false            �            1259    90318    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          gb_user    false    214            x           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          gb_user    false    213            �            1259    90401    clients    TABLE     J  CREATE TABLE public.clients (
    id integer NOT NULL,
    avatars_id integer,
    name character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    birthday date NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(16),
    registration_date timestamp without time zone NOT NULL
);
    DROP TABLE public.clients;
       public         heap    gb_user    false            �            1259    90399    clients_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.clients_id_seq;
       public          gb_user    false    224            y           0    0    clients_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;
          public          gb_user    false    223            �            1259    90379    clients_photos    TABLE     �   CREATE TABLE public.clients_photos (
    id integer NOT NULL,
    reviews_id integer NOT NULL,
    url character varying(250) NOT NULL,
    size integer NOT NULL,
    created_at timestamp without time zone
);
 "   DROP TABLE public.clients_photos;
       public         heap    gb_user    false            �            1259    90377    clients_photos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clients_photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.clients_photos_id_seq;
       public          gb_user    false    222            z           0    0    clients_photos_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.clients_photos_id_seq OWNED BY public.clients_photos.id;
          public          gb_user    false    221            �            1259    90457    execution_statuses    TABLE     �   CREATE TABLE public.execution_statuses (
    id integer NOT NULL,
    name character varying(25),
    created_at timestamp without time zone
);
 &   DROP TABLE public.execution_statuses;
       public         heap    gb_user    false            �            1259    90455    execution_statuses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.execution_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.execution_statuses_id_seq;
       public          gb_user    false    232            {           0    0    execution_statuses_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.execution_statuses_id_seq OWNED BY public.execution_statuses.id;
          public          gb_user    false    231            �            1259    90413 	   favorites    TABLE     \   CREATE TABLE public.favorites (
    id integer NOT NULL,
    clients_id integer NOT NULL
);
    DROP TABLE public.favorites;
       public         heap    gb_user    false            �            1259    90411    favorites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.favorites_id_seq;
       public          gb_user    false    226            |           0    0    favorites_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;
          public          gb_user    false    225            �            1259    90280    favorites_products    TABLE     �   CREATE TABLE public.favorites_products (
    favorites_id integer NOT NULL,
    products_id integer NOT NULL,
    date_added date NOT NULL
);
 &   DROP TABLE public.favorites_products;
       public         heap    gb_user    false            �            1259    90156    goods_photos    TABLE     �   CREATE TABLE public.goods_photos (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    size integer NOT NULL,
    created_at timestamp without time zone
);
     DROP TABLE public.goods_photos;
       public         heap    gb_user    false            �            1259    90154    goods_photos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.goods_photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.goods_photos_id_seq;
       public          gb_user    false    205            }           0    0    goods_photos_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.goods_photos_id_seq OWNED BY public.goods_photos.id;
          public          gb_user    false    204            �            1259    90344    manufacturer    TABLE     �   CREATE TABLE public.manufacturer (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    brand_logo_id integer,
    country character varying(30) NOT NULL,
    created_at timestamp without time zone
);
     DROP TABLE public.manufacturer;
       public         heap    gb_user    false            �            1259    90342    manufacturer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.manufacturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.manufacturer_id_seq;
       public          gb_user    false    216            ~           0    0    manufacturer_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.manufacturer_id_seq OWNED BY public.manufacturer.id;
          public          gb_user    false    215            �            1259    90229    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    clients_id integer NOT NULL,
    payment_methods_id integer NOT NULL,
    pick_up_points_id integer NOT NULL,
    created_at timestamp without time zone,
    execution_statuses_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    gb_user    false            �            1259    90227    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          gb_user    false    209                       0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          gb_user    false    208            �            1259    90512    orders_products    TABLE     �   CREATE TABLE public.orders_products (
    orders_id integer NOT NULL,
    products_id integer NOT NULL,
    product_amount integer NOT NULL,
    product_price numeric,
    product_discount numeric
);
 #   DROP TABLE public.orders_products;
       public         heap    gb_user    false            �            1259    90449    payment_methods    TABLE     �   CREATE TABLE public.payment_methods (
    id integer NOT NULL,
    name character varying(20),
    created_at timestamp without time zone
);
 #   DROP TABLE public.payment_methods;
       public         heap    gb_user    false            �            1259    90447    payment_methods_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_methods_id_seq;
       public          gb_user    false    230            �           0    0    payment_methods_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payment_methods_id_seq OWNED BY public.payment_methods.id;
          public          gb_user    false    229            �            1259    90482    pick_up_points    TABLE     �   CREATE TABLE public.pick_up_points (
    id integer NOT NULL,
    postal_code character varying(12),
    city character varying(30),
    street character varying(50),
    building character varying(4),
    created_at timestamp without time zone
);
 "   DROP TABLE public.pick_up_points;
       public         heap    gb_user    false            �            1259    90480    pick_up_points_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pick_up_points_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.pick_up_points_id_seq;
       public          gb_user    false    234            �           0    0    pick_up_points_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.pick_up_points_id_seq OWNED BY public.pick_up_points.id;
          public          gb_user    false    233            �            1259    90128    product_categories    TABLE     �   CREATE TABLE public.product_categories (
    id integer NOT NULL,
    name character varying(50),
    created_at timestamp without time zone,
    parent_id integer
);
 &   DROP TABLE public.product_categories;
       public         heap    gb_user    false            �            1259    90126    product_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.product_categories_id_seq;
       public          gb_user    false    203            �           0    0    product_categories_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.product_categories_id_seq OWNED BY public.product_categories.id;
          public          gb_user    false    202            �            1259    90306    products    TABLE     d  CREATE TABLE public.products (
    id integer NOT NULL,
    category_id integer,
    manufacturer_id integer,
    vendor_code character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(1000) NOT NULL,
    amount integer,
    price numeric,
    discount numeric,
    created_at timestamp without time zone
);
    DROP TABLE public.products;
       public         heap    gb_user    false            �            1259    90304    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          gb_user    false    212            �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          gb_user    false    211            �            1259    90506    ratings    TABLE     b   CREATE TABLE public.ratings (
    id integer NOT NULL,
    name character varying(19) NOT NULL
);
    DROP TABLE public.ratings;
       public         heap    gb_user    false            �            1259    90504    ratings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.ratings_id_seq;
       public          gb_user    false    236            �           0    0    ratings_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;
          public          gb_user    false    235            �            1259    90366    reviews    TABLE     �   CREATE TABLE public.reviews (
    id integer NOT NULL,
    product_id integer NOT NULL,
    client_id integer NOT NULL,
    created_at timestamp without time zone,
    ratings_id integer,
    text_content character varying(500)
);
    DROP TABLE public.reviews;
       public         heap    gb_user    false            �            1259    90364    reviews_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reviews_id_seq;
       public          gb_user    false    220            �           0    0    reviews_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;
          public          gb_user    false    219            �           2604    90206 
   avatars id    DEFAULT     h   ALTER TABLE ONLY public.avatars ALTER COLUMN id SET DEFAULT nextval('public.avatars_id_seq'::regclass);
 9   ALTER TABLE public.avatars ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    207    206    207            �           2604    90359    brand_logo id    DEFAULT     n   ALTER TABLE ONLY public.brand_logo ALTER COLUMN id SET DEFAULT nextval('public.brand_logo_id_seq'::regclass);
 <   ALTER TABLE public.brand_logo ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    217    218    218            �           2604    90440    carts id    DEFAULT     d   ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);
 7   ALTER TABLE public.carts ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    228    227    228            �           2604    90323    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    213    214    214            �           2604    90404 
   clients id    DEFAULT     h   ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);
 9   ALTER TABLE public.clients ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    224    223    224            �           2604    90382    clients_photos id    DEFAULT     v   ALTER TABLE ONLY public.clients_photos ALTER COLUMN id SET DEFAULT nextval('public.clients_photos_id_seq'::regclass);
 @   ALTER TABLE public.clients_photos ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    222    221    222            �           2604    90460    execution_statuses id    DEFAULT     ~   ALTER TABLE ONLY public.execution_statuses ALTER COLUMN id SET DEFAULT nextval('public.execution_statuses_id_seq'::regclass);
 D   ALTER TABLE public.execution_statuses ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    231    232    232            �           2604    90416    favorites id    DEFAULT     l   ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);
 ;   ALTER TABLE public.favorites ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    226    225    226            �           2604    90159    goods_photos id    DEFAULT     r   ALTER TABLE ONLY public.goods_photos ALTER COLUMN id SET DEFAULT nextval('public.goods_photos_id_seq'::regclass);
 >   ALTER TABLE public.goods_photos ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    205    204    205            �           2604    90347    manufacturer id    DEFAULT     r   ALTER TABLE ONLY public.manufacturer ALTER COLUMN id SET DEFAULT nextval('public.manufacturer_id_seq'::regclass);
 >   ALTER TABLE public.manufacturer ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    216    215    216            �           2604    90232 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    209    208    209            �           2604    90452    payment_methods id    DEFAULT     x   ALTER TABLE ONLY public.payment_methods ALTER COLUMN id SET DEFAULT nextval('public.payment_methods_id_seq'::regclass);
 A   ALTER TABLE public.payment_methods ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    230    229    230            �           2604    90485    pick_up_points id    DEFAULT     v   ALTER TABLE ONLY public.pick_up_points ALTER COLUMN id SET DEFAULT nextval('public.pick_up_points_id_seq'::regclass);
 @   ALTER TABLE public.pick_up_points ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    233    234    234            �           2604    90131    product_categories id    DEFAULT     ~   ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_categories_id_seq'::regclass);
 D   ALTER TABLE public.product_categories ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    202    203    203            �           2604    90309    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    211    212    212            �           2604    90509 
   ratings id    DEFAULT     h   ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);
 9   ALTER TABLE public.ratings ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    235    236    236            �           2604    90369 
   reviews id    DEFAULT     h   ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);
 9   ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    220    219    220            N          0    90203    avatars 
   TABLE DATA           <   COPY public.avatars (id, url, size, created_at) FROM stdin;
    public          gb_user    false    207   ^�       Y          0    90356 
   brand_logo 
   TABLE DATA           ?   COPY public.brand_logo (id, url, size, created_at) FROM stdin;
    public          gb_user    false    218   �       c          0    90437    carts 
   TABLE DATA           /   COPY public.carts (id, clients_id) FROM stdin;
    public          gb_user    false    228   ��       m          0    90518    carts_products 
   TABLE DATA           p   COPY public.carts_products (carts_id, products_id, product_amount, product_price, product_discount) FROM stdin;
    public          gb_user    false    238   լ       U          0    90320 
   categories 
   TABLE DATA           E   COPY public.categories (id, name, created_at, parent_id) FROM stdin;
    public          gb_user    false    214   �       _          0    90401    clients 
   TABLE DATA           k   COPY public.clients (id, avatars_id, name, surname, birthday, email, phone, registration_date) FROM stdin;
    public          gb_user    false    224   �       ]          0    90379    clients_photos 
   TABLE DATA           O   COPY public.clients_photos (id, reviews_id, url, size, created_at) FROM stdin;
    public          gb_user    false    222   ��       g          0    90457    execution_statuses 
   TABLE DATA           B   COPY public.execution_statuses (id, name, created_at) FROM stdin;
    public          gb_user    false    232   ��       a          0    90413 	   favorites 
   TABLE DATA           3   COPY public.favorites (id, clients_id) FROM stdin;
    public          gb_user    false    226   ��       Q          0    90280    favorites_products 
   TABLE DATA           S   COPY public.favorites_products (favorites_id, products_id, date_added) FROM stdin;
    public          gb_user    false    210   ��       L          0    90156    goods_photos 
   TABLE DATA           A   COPY public.goods_photos (id, url, size, created_at) FROM stdin;
    public          gb_user    false    205   |�       W          0    90344    manufacturer 
   TABLE DATA           T   COPY public.manufacturer (id, name, brand_logo_id, country, created_at) FROM stdin;
    public          gb_user    false    216   )�       P          0    90229    orders 
   TABLE DATA           z   COPY public.orders (id, clients_id, payment_methods_id, pick_up_points_id, created_at, execution_statuses_id) FROM stdin;
    public          gb_user    false    209   ��       l          0    90512    orders_products 
   TABLE DATA           r   COPY public.orders_products (orders_id, products_id, product_amount, product_price, product_discount) FROM stdin;
    public          gb_user    false    237   n�       e          0    90449    payment_methods 
   TABLE DATA           ?   COPY public.payment_methods (id, name, created_at) FROM stdin;
    public          gb_user    false    230   ��       i          0    90482    pick_up_points 
   TABLE DATA           ]   COPY public.pick_up_points (id, postal_code, city, street, building, created_at) FROM stdin;
    public          gb_user    false    234   �       J          0    90128    product_categories 
   TABLE DATA           M   COPY public.product_categories (id, name, created_at, parent_id) FROM stdin;
    public          gb_user    false    203   ��       S          0    90306    products 
   TABLE DATA           �   COPY public.products (id, category_id, manufacturer_id, vendor_code, name, description, amount, price, discount, created_at) FROM stdin;
    public          gb_user    false    212   ��       k          0    90506    ratings 
   TABLE DATA           +   COPY public.ratings (id, name) FROM stdin;
    public          gb_user    false    236   k      [          0    90366    reviews 
   TABLE DATA           b   COPY public.reviews (id, product_id, client_id, created_at, ratings_id, text_content) FROM stdin;
    public          gb_user    false    220   �      �           0    0    avatars_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.avatars_id_seq', 100, true);
          public          gb_user    false    206            �           0    0    brand_logo_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.brand_logo_id_seq', 100, true);
          public          gb_user    false    217            �           0    0    carts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.carts_id_seq', 1, false);
          public          gb_user    false    227            �           0    0    categories_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.categories_id_seq', 100, true);
          public          gb_user    false    213            �           0    0    clients_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.clients_id_seq', 100, true);
          public          gb_user    false    223            �           0    0    clients_photos_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.clients_photos_id_seq', 100, true);
          public          gb_user    false    221            �           0    0    execution_statuses_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.execution_statuses_id_seq', 6, true);
          public          gb_user    false    231            �           0    0    favorites_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.favorites_id_seq', 11, true);
          public          gb_user    false    225            �           0    0    goods_photos_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.goods_photos_id_seq', 100, true);
          public          gb_user    false    204            �           0    0    manufacturer_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.manufacturer_id_seq', 200, true);
          public          gb_user    false    215            �           0    0    orders_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.orders_id_seq', 100, true);
          public          gb_user    false    208            �           0    0    payment_methods_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.payment_methods_id_seq', 3, true);
          public          gb_user    false    229            �           0    0    pick_up_points_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pick_up_points_id_seq', 100, true);
          public          gb_user    false    233            �           0    0    product_categories_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.product_categories_id_seq', 1, false);
          public          gb_user    false    202            �           0    0    products_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.products_id_seq', 100, true);
          public          gb_user    false    211            �           0    0    ratings_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.ratings_id_seq', 5, true);
          public          gb_user    false    235            �           0    0    reviews_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.reviews_id_seq', 100, true);
          public          gb_user    false    219            �           2606    90208    avatars avatars_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.avatars
    ADD CONSTRAINT avatars_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.avatars DROP CONSTRAINT avatars_pkey;
       public            gb_user    false    207            �           2606    90210    avatars avatars_url_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.avatars
    ADD CONSTRAINT avatars_url_key UNIQUE (url);
 A   ALTER TABLE ONLY public.avatars DROP CONSTRAINT avatars_url_key;
       public            gb_user    false    207            �           2606    90361    brand_logo brand_logo_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.brand_logo
    ADD CONSTRAINT brand_logo_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.brand_logo DROP CONSTRAINT brand_logo_pkey;
       public            gb_user    false    218            �           2606    90363    brand_logo brand_logo_url_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.brand_logo
    ADD CONSTRAINT brand_logo_url_key UNIQUE (url);
 G   ALTER TABLE ONLY public.brand_logo DROP CONSTRAINT brand_logo_url_key;
       public            gb_user    false    218            �           2606    90444    carts carts_clients_id_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_clients_id_key UNIQUE (clients_id);
 D   ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_clients_id_key;
       public            gb_user    false    228            �           2606    90442    carts carts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
       public            gb_user    false    228            �           2606    90325    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            gb_user    false    214            �           2606    90408    clients clients_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_email_key;
       public            gb_user    false    224            �           2606    90410    clients clients_phone_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_phone_key UNIQUE (phone);
 C   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_phone_key;
       public            gb_user    false    224            �           2606    90384 "   clients_photos clients_photos_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.clients_photos
    ADD CONSTRAINT clients_photos_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.clients_photos DROP CONSTRAINT clients_photos_pkey;
       public            gb_user    false    222            �           2606    90386 %   clients_photos clients_photos_url_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.clients_photos
    ADD CONSTRAINT clients_photos_url_key UNIQUE (url);
 O   ALTER TABLE ONLY public.clients_photos DROP CONSTRAINT clients_photos_url_key;
       public            gb_user    false    222            �           2606    90406    clients clients_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            gb_user    false    224            �           2606    90462 *   execution_statuses execution_statuses_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.execution_statuses
    ADD CONSTRAINT execution_statuses_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.execution_statuses DROP CONSTRAINT execution_statuses_pkey;
       public            gb_user    false    232            �           2606    90420 "   favorites favorites_clients_id_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_clients_id_key UNIQUE (clients_id);
 L   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_clients_id_key;
       public            gb_user    false    226            �           2606    90418    favorites favorites_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_pkey;
       public            gb_user    false    226            �           2606    90161    goods_photos goods_photos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.goods_photos
    ADD CONSTRAINT goods_photos_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.goods_photos DROP CONSTRAINT goods_photos_pkey;
       public            gb_user    false    205            �           2606    90163 !   goods_photos goods_photos_url_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.goods_photos
    ADD CONSTRAINT goods_photos_url_key UNIQUE (url);
 K   ALTER TABLE ONLY public.goods_photos DROP CONSTRAINT goods_photos_url_key;
       public            gb_user    false    205            �           2606    90353 +   manufacturer manufacturer_brand_logo_id_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.manufacturer
    ADD CONSTRAINT manufacturer_brand_logo_id_key UNIQUE (brand_logo_id);
 U   ALTER TABLE ONLY public.manufacturer DROP CONSTRAINT manufacturer_brand_logo_id_key;
       public            gb_user    false    216            �           2606    90351 "   manufacturer manufacturer_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.manufacturer
    ADD CONSTRAINT manufacturer_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.manufacturer DROP CONSTRAINT manufacturer_name_key;
       public            gb_user    false    216            �           2606    90349    manufacturer manufacturer_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.manufacturer DROP CONSTRAINT manufacturer_pkey;
       public            gb_user    false    216            �           2606    90234    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            gb_user    false    209            �           2606    90454 $   payment_methods payment_methods_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.payment_methods DROP CONSTRAINT payment_methods_pkey;
       public            gb_user    false    230            �           2606    90487 "   pick_up_points pick_up_points_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.pick_up_points
    ADD CONSTRAINT pick_up_points_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.pick_up_points DROP CONSTRAINT pick_up_points_pkey;
       public            gb_user    false    234            �           2606    90133 *   product_categories product_categories_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.product_categories DROP CONSTRAINT product_categories_pkey;
       public            gb_user    false    203            �           2606    90314    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            gb_user    false    212            �           2606    90316 !   products products_vendor_code_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_vendor_code_key UNIQUE (vendor_code);
 K   ALTER TABLE ONLY public.products DROP CONSTRAINT products_vendor_code_key;
       public            gb_user    false    212            �           2606    90511    ratings ratings_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_pkey;
       public            gb_user    false    236            �           2606    90374    reviews reviews_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            gb_user    false    220            N   �  x�uX[r1�O��"@��9��Ȗ�K.=�͞~�)�*"�ht���װ�����]w__/o����p�O�DZ�G������i<�wX���|��_5�|:�8�C�k���!��������}{���2Q�o��e�y0 ����ǯ��ˊb
��$�������ːߏ)��߸���<�8 ���{��r�l����b��=����!�]�|n������ؾ�.W-$�顠�R6恣�x��r�o��o[ ���) 6(/���+��

�mZE"�),nP �jhށo��N5�~=\�)�B�Ǫ@
�k�!�@�$�)�x��v��g=��[�U��"1�s\��ץ1#�@�bB"��8��,��x��#�(Nl ���<P������1P�Y� *�!(����X^%j����,k�k�'�Jeo�U��٠���ҮXQ��x���s�$�k�
=$����=qj|r�9��@�J	���w��|��`
%�@�^N�����f��HfA0(aY萣�=o0��$�,��L)c#�b���R��<v������S����ì�Bc����ϗ��67�4���
y�^�L4�'�Ni�DUa	Ju4>��ގ��뼹L�!*�T�F������aܽ�/�Q�F��54��`n�3�k
���$y�(��)F�g2�`��L~<ȔȈ���J�@�ˍ<6�� ֫��7	z���X�b)�!Hz�{r�Tw11�`�R��>�`��c]%gH&��d	�B�@�*j$�c���*��:�_�_����vۊ�K vݨCV�]����)���������Џ����-Bh�Ї&��TcL�+v�>w��?�"��
c�Z�Y�r��;��Q.M������9�T3c��]PaQ���De���I�4CQ���L��
��x��кx������I�)q7'IT��`��xbg.�ѰGP�Q�N�^f�Jp�9T3S1?��Ⲷ�k��:Ь]B0F�$;K.���x{\�BƐm��2� �G�g��r"�(�N�X�t�<u��Xf'�%IC�ڴL��w�Be�����(rH��Y�'�Q���*>2+��p�q&��-��S��_Y>T��(%a�*ZP�@;���Wu�ϿmUm66��W��
J��*�d'"�q9'y�řSG�Z��.[nzF�l	��i󋘃��'��E��4	��&�6���rGtI��F�������Fwt#�m[�P�V���R4g���A�B��a)�0�~�W��`��l�H��$v����
f�u�T��$�.�o@��K�� �e��m�\����]��L7��c��8�hDi���P��0�AO�ʌ(�+U{I�Ɏ�\�PmP^Z>[�a��Hϵq�.p��|���bBł��Ai�`����Ʈ\ �f&�a�K]1����t�e�,S���	*���&��$)�l��.������"4��l���C�"I@w�6rMo�؉��U$;*.ѓx
�I���r�
!��V2B�=KCB����c��e�ec֦Jy��l7�I�D�.u:L���!��&Qx'Z���\�Ki5*p�m��/�54��87��)�(�4���3`�꞉L��}F�����<P �yƸI����y�"�('�ێ^Ҝ��x�	�k"���q�:a��`�\M��o�m���2/*��&�3��

��q.}�#R�ܙ�PmRݏsz�*C9%B^��X��.�M�A��z�)"㡦}F��ur���:��� &�P�D����U:A�n?Q2���
�:���[���&"�,㡮E��`N�#&��X�e�_CJX*��p�Y)R���6Z��8g��w�q.������@Ɛ�K�~N#E_t��B:��g�\-2��@�JKeU�S4.N}���7,�f ���i]�Q(���e���9�ùƺ�8��I����K��m�n�޽�?/ι�Ѯf�      Y   �  x�uX[r1�O��"@��9��Ȗ�K.=�͞~�)�*"�ht���װ�����]w__/o����p�O�DZ�G������i<�wX���|��_5�|:�8�C�k���!��������}{���2Q�o��e�y0 ����ǯ��ˊb
��$�������ːߏ)��߸���<�8 ���{��r�l����b��=����!�]�|n������ؾ�.W-$�顠�R6恣�x��r�o��o[ ���) 6(/���+��

�mZE"�),nP �jhށo��N5�~=\�)�B�Ǫ@
�k�!�@�$�)�x��v��g=��[�U��"1�s\��ץ1#�@�bB"��8��,��x��#�(Nl ���<P������1P�Y� *�!(����X^%j����,k�k�'�Jeo�U��٠���ҮXQ��x���s�$�k�
=$����=qj|r�9��@�J	���w��|��`
%�@�^N�����f��HfA0(aY萣�=o0��$�,��L)c#�b���R��<v������S����ì�Bc����ϗ��67�4���
y�^�L4�'�Ni�DUa	Ju4>��ގ��뼹L�!*�T�F������aܽ�/�Q�F��54��`n�3�k
���$y�(��)F�g2�`��L~<ȔȈ���J�@�ˍ<6�� ֫��7	z���X�b)�!Hz�{r�Tw11�`�R��>�`��c]%gH&��d	�B�@�*j$�c���*��:�_�_����vۊ�K vݨCV�]����)���������Џ����-Bh�Ї&��TcL�+v�>w��?�"��
c�Z�Y�r��;��Q.M������9�T3c��]PaQ���De���I�4CQ���L��
��x��кx������I�)q7'IT��`��xbg.�ѰGP�Q�N�^f�Jp�9T3S1?��Ⲷ�k��:Ь]B0F�$;K.���x{\�BƐm��2� �G�g��r"�(�N�X�t�<u��Xf'�%IC�ڴL��w�Be�����(rH��Y�'�Q���*>2+��p�q&��-��S��_Y>T��(%a�*ZP�@;���Wu�ϿmUm66��W��
J��*�d'"�q9'y�řSG�Z��.[nzF�l	��i󋘃��'��E��4	��&�6���rGtI��F�������Fwt#�m[�P�V���R4g���A�B��a)�0�~�W��`��l�H��$v����
f�u�T��$�.�o@��K�� �e��m�\����]��L7��c��8�hDi���P��0�AO�ʌ(�+U{I�Ɏ�\�PmP^Z>[�a��Hϵq�.p��|���bBł��Ai�`����Ʈ\ �f&�a�K]1����t�e�,S���	*���&��$)�l��.������"4��l���C�"I@w�6rMo�؉��U$;*.ѓx
�I���r�
!��V2B�=KCB����c��e�ec֦Jy��l7�I�D�.u:L���!��&Qx'Z���\�Ki5*p�m��/�54��87��)�(�4���3`�꞉L��}F�����<P �yƸI����y�"�('�ێ^Ҝ��x�	�k"���q�:a��`�\M��o�m���2/*��&�3��

��q.}�#R�ܙ�PmRݏsz�*C9%B^��X��.�M�A��z�)"㡦}F��ur���:��� &�P�D����U:A�n?Q2���
�:���[���&"�,㡮E��`N�#&��X�e�_CJX*��p�Y)R���6Z��8g��w�q.������@Ɛ�K�~N#E_t��B:��g�\-2��@�JKeU�S4.N}���7,�f ���i]�Q(���e���9�ùƺ�8��I����K��m�n�޽�?/ι�Ѯf�      c      x������ � �      m     x�5�ٵ-9C�q.Ͳ�H.�o�:���6���m>���-�����,-���o��\�k�w���M;6�
�#BZ���Q�ӟ�c~����bN{D8���m��?b<BrZ\L������T��}�j�,T���٢��OHI2UH"�
�޶���`�T�lLO�u����1����^� �y����"e�ۄ�e"J�^+z�N�.f�NQ�oXSytd�kw��J�.�����,�����L�E�7,���@p�I�#�ՙ�A�t(A�b��:�E�-F�:�@U�>��R+���""_PQxg�d�Zru�����ϯC9x^��<�U)[��ڏ*=ϡ�"�{��h�71��h�V��
������?��?q��R���?	�'���G�J��Z�!U��"C�LM�B T�����x4	Ȱ��IUcqZ��xᕒ�u�V y\)y���x,��?I��_�L��ti�,BmH�&� ����dS��Ws��!���i)ܒ9�A��ʁ�{"V�F�پ��a�G���_포}Z�N9�O��BR^@�#�xO��~�N��P�ZO��6
��XP��3K�L:�}��)�_���,�Dz���ja~��8O0R��IQFʦ �b	0�EK�t_�l��0P֚�Q����lH���%ݰ��@���� �^���M��xjTj�$�Bk{gZ��`�槉��
�ץ-Y���U�t��>铞}�5�|.u0?��KN��[k� T2�      U     x��Wmn\E�=s������wC G�ď��8@��ıs��Q��^��~H��H�z����{č?��x7��<���ǥӠ�q�J�ڤ����o�f�|s6����I]K[I�b�aW��n����p�b�������$O��]�>��'"}��ւX�b�)�K��c���d�b������K�<C�;��Z�
Wj�Rr5���/�b\o����͏+��b�����ࢫ�4d��Z�%!����n����	������:�����$�b���G�,��q���%�zm-���B��W*ST6@��~���������ݼ�o�۔�����*ԎcNq(.�%�52�TXK/iIN3
�	=�S��u/���,KI�Po��G7��tX+�b5�*JA�_������X<\i^�ԗ�sd~3�Zֹon�pWs[��;d�� }Q��&�:+ƭ ��F���F�b����+��]1��&��xq��)v�ģ��+�$nv��HR,נa�&:�߷����q�R��+�k:��N"P�:q���`8Z��7'�����;���m��Z�YIt	P��m�)L	��X��H�C`�#!̕T^�#e܊��(�v\� e��jJ>��,�+kvM�RpU}d�H�]�䷛[�� F���cq���|HX%�@�MG�@w5��BwZ}�OSy� �ш6E�Q�C;T�}�2�7]|��9tB�Fp��ض�xo��=�؆�l��̜���3O�hN�m��Z&���=Јb6�!�A���A�|҃���̶P!����(�;^��.7���l7+I�۵�S>��DL-�Me�R=�u�c3�b��xS=֌�!�2U��#>=5�lJEj��N}��V�;�6`�@���C��f��i�C�g9ʏ�˅s������/�҃�b�{�r��6�� Q�9�p�n=�!V^HHcG�����rj( �lm7��X��:
7�Na�sF� �x�RH� �	gl��	W7�1b�pp!b����ɕ�^��C���k�@m�1��>V��~�)G��	��J^�zd'4�:���SH�Q��� BA���5̸�7dv�3��K퓩���u���֓/G]r�b��Ǵ�7`)(}�z5{+3JdM=9��@�ť�+�
q?�Ϡ�����V�CEn�UOa)$�WW�������İW����мc
(��{묶(�r��F��a%�k^e������wn��t���#�	���H�å�1l��L�)j�Oy8��`�À�����D������&�x�8}��ţ�7]d��>���D}��-l^2H���#]��@)���BZ�+��9g������%�_�|��$�]�� n�ʞ{�=FA_�K�\�Q]�ڙ;º;���[�_���`[o��R|�����i�q����S���ۗ�R�]NxL4��M%��'Ng0�G(�^e=.Y�:���eT+!�6��^�������E�����Y��,�Ѽ'�G-�����0��f�������3Il��Q���>!�;��ǠIǣ:,]xfat�ƶ����� ��;;      _      x�eZ�r�8�|���'� �`?ɒ�w{'<��؍�u��<b�^��~��/�v#�]����̬�p&J�����ɳ�}臮�ׄ��*熅&\C;Nע��p��t���Mq.�V���</]���Jy�U&~��B����	�Oq��`a�������?�a�����	}1L�粴�Q*�ܮ�m����� e&���S׳;ߏ��y�s�X[u�C|{㻦�{�?6�B���\�\��$%~�MYxu(]��s��T��)�mO�\�,;v�y
Eh��fN��\�
畹�_�K�{S"�>(�iV)��t�⨟�K;l����3�<=�g��V�&�b	��Gn�15�ӊ}���S���3`�?W?���ժc<�ȕ�H��SS�Ty�.�̕�}��z`�$��r{�,;�d7��~.��2����\/�4���� ��1Q������D��kׄa�CQ��w.��q|Sp���P��\�${���>v���r*�¦`Cw������GU
AU�%/�4.uQUe��4�{��{׍K�qLA�m��hBW<�O�:7/��5�T���J�/�D���P�ʲ��ρ����_}� OP�B��?��x�@�?/P�6w0@uRlJmuP�.�q��f��sh���m7@Ů��L'�}DwL}������N��Zͷ<s�F���P�w�e�~�M�R�p�nC@�ٵ.P�k�>8�3+�t#}8��ȮV9��Jo l !Zftξ�Tu��ߨÞ��%9�s��?�cM*�n��nz@ƍA>�x�J�2ѥ̀C'���W�(�/[9�r&T��u*�pV�\�a�dᨀ\x�KH"��]���@�b���/g}E��;���*WN�-עz#@�HE���ڿx�ǀێ�,:�X��	M��c��(`#B����c�bl���R����������;|g(�f��c6�w��t���1
��Q�r�SsT�� ��_��ڳ��_?�H��9��M7��T�v���+��Y1lj }��ŷ5�����_R	+�F1����M �Q5І�V�TI�&R�A .gV����|7����lF�����J;����,���
j�4x\b��V�!��_�X7`�a�>F��d�ʡDN�Ђ\�3x�i�%�p;E���t\C�}SsHD<�&���!�=߀a"o胬�b"jܗ�4/�^�nn=�H�
� �{N~��ۇ�Ĭ�H�2	���:�Wg8\U� y��c�\êo�t��p}������R�����]{(Rx(�0�'�j����,sA�� =���nJ���)Q��|,�&�B�}��Z�i9���E'��T���z�Bw@����0D��{���ƐґAx�h���<�Q)����� ��J4Z�A���Mh	"[�'�;�!��sH*a�ȭDSm9���*�F�I������@:}�)5iI
S�0A�\���%�*q
uǠ�hq��oҊG�_ɖHF��R8�(m8��V(�S���u�g_'�q`���a��a�5����S����"XX�v�|4�Z�CYf�>��G$�D�sz+��T��|�*�d������8�(�D�G���W�݁�P���h�_F��m��H� ܫM�NG܇�T8�f���6��4���q��W��:T���a�=[�7<�W���`:���٧��^���Pk��ւTw�o��_"���+J�%�JK�}��>w/�d�qǮ?�����4�m#a�h.aC��` br�#C�!�g?\)�{�_7$�јM-Y\8�o�L: 4�U`�pE*���{hR;�O��N;-'�r�%���p�2�$�g`��[ߣ���(�f9:�c�!�S�8�(-Y��m�!,�[�D��4|D�8S���dߎ�%	�c`U����1%�l%I��UM�)y�&�d�w?w�	����敭�5ɒxm�@�����@�85�3��1o�`�s=��g��(|���9��,���J`lj�*ʡ=p�aPC�?���\��c��4�����_�6����MWU
+d�� c�4MOo�,K�6h�t�OS;��k4�@ �M���q[�h5��":s�%���c��~�<Ã�;�E���o����>|HJC&QYr��:|���R��?�#D��F����Fn1��H0�d*�e?}��@�AY�u�1B�FSU��������ež��go_|����0���H��@|d���R�."J�%Ӗ��[ia����X&MYH+N��(
Ӄ���V�h��T1C�p�z�+������W ��R,ne��rp��[Ь"�N�4:�30����Q>"�^g�=GA��{��`�bl��n%oeI�,Z2I�����}���Y���~B�@�S%��$2���Ah�h0��bX�7�WJv�z@}�%*�H�z��8��]�Lk�Tw�&��>�M�YVN���o�F�*I����F�d�J9���>�gƟ�D8����{�F7:�HR(I,�B�lnۢſ�ݳ_QN���|1��:*^\����U2=��i:9H�ϑH�AH��)�ɛV!r�=�F��ХI�,i�'���(�]�`�!�����چ�e���\��F'
Q��L�=����sh�K�Ny��dL8�n�d�V萝���IR��%��hN��P���vűE��l��E���b��[}����0�Y��u;l���L��;}��2%�h�,�^(��q�d��44l�D,�<N�!�fX7��7�r���ͫ�nA"�b���g�����(�c���_-��t:�*�t�-��$+���o�!�>�1Ϻ����������bُ�`�AU��AY|FIT���.��14��8����KZ7��Ю+�����&9�Ֆ�"�$�jh6���F������`�!5��
M��B�:"����?2�.<����Br����P(|
���K��XY%Z�U��_i2S�
��`��lڷa���evA]���fS�v��Gi���l�@_�c��~�~m�a������vm2�4�l�[n"���.��rF����=�O*W��5����7�d��u�C�!%_��6�@�|�'o|:�5s�x�h��L��l��	���0������@N�yoC����i^,�*͌}�i���4q_3���1(xv�wǇ�H)٩>қ�������ߐ�ҁN��W�J.B��k��?q^t�- �C�m;d�}$ [ts�Lo�}9-�l�w�V`�chW������T?�ñnϯ��h;Hu4|��5����,��D�-1�oq�������h
0e�8L��0ץ���DI$g�*9�uJ�y��=����A�����JNTI� vֺ��(Z�g5�Vw]G��	ÃC��ݩ�5�W�@�؆���Ht1pg�a�y�@ϛ�w���'��h��p�-Z�d'i�ۮ�y�>A�f��S���{w��;{�nzX�Bй��)`Yf	H��5L())(ZB"����Ã�����%�"���,�](��rr'�6>}�Ԏ�8=�i|����h|ٴDU�a'6�o*Z�"���'"�M����ܖ�;f��_�]�7�����lv�2�74lo��V�'#䍂D���ں��!�ɠ�U�q ��b�eiN�J��裛��ਪ� q���ۓ��K*G��8��'����.���0v1��q@�T���cݹUM���b:8���>�7U���W���R/����"�au�.I&���hE�?o�a�+\|
g���>O��sd��V�t�Ҧ��a�L�DJ��޿��4y�8���*�3Tz^-!�W����RXN�h��
��e�mRw��<��G��Z�8�$���6�⸱�H�bK��,� )"�29|�m�2^��~w�L��yb�V�E]5��W�^T�|�ZJC.t����؏n�[�a��Y�j�0U�f3Z;��p��\�0���>����{�vE�,
ȀǄP����C��W(���M)�wY�Ft���LŸ��*��^h7�Ȃn{��Â�wY�ڴ�ۃLKBZ m�T4nX��߃o�������t3+���'�zk?/1�	��,�{�Q�5�w;A� �   ��@��5,�吒�W�
�ۣ'�L���ڢB�i�i���t\QF�{�O����o.��f�H��mSE����J��S�i��'Es�85p���w�э�Kz��g4�T����y��8�"���WAӸ"t�4q�;;���<=���-�,� (��      ]     x��X[r#7��B�M |�Y�#�Z�jmɥG�����hH�,o��i ��n�����c||���|���y8<<�_����c\tq`˴�iMq�4R]4<�\BO�}�������5*��h��#;#�9��f�r)�.�����)�l�V,#�(ɸ!sͦ���w��S	?m����u!�k4�٭��<�d� ��3��e�rH�";��NLd������އp��9l9��M�-*<����q�pw�Dj"�+���#Y���o�?�v�L���!�C�kF���!`>�ؿ�������ݯ�7���a�S��]�n��i1����ew.����\j���Bi��^>��]\Jui�veE�i�!|M��ۣ3�ӹ5GpB�]�]3��FFΆ��O�Yh�#J��@��QΣC�n�T[�{��è}��UaM�������n�Whp�����w���0���T��S�;dA��,q������\j���1�50�)��[�`)�=�K#�oC۩�]��<P+��yz$�M�i�K�)���4'ci�4���?�Z$��3�ţE�b�y�Χ�g��p��6=rݣ��UT�ɀ�P�=-v��ys<�C�?x���F2dw 5�ǜkw'��^B,��� ���\�κ?�=���L��tR�G%4�\h�ހ�I
���	�G�b@i��?7����Ǌ)��E����y{��-*�t� ��#~Fq�jW�T�9�8eN� ��T윾0nm��[Ƭ���<��e���`Th]1����Wa1�\_ww!�\e���
A�i��ݯ���e�y8_u _�C1~��T�F��ʦfZjt�q�&�AqF�m���px}�γOR�(�w��'�]k|�l��p]*e���k�p���c�@�wX��p9_��K���̒A��e���i'Ql9�݈+¶�ɳ��17��L��;)�b��|�?�7�����m�ɕ/�qxG����Y���HzP(xm��U����;�P���>a���e��*�9W<0+8�?L��V���BGAkuN������(��P�m��[��М0���I+\g,5�iAE|Ly���b���6C@'iW@:����L���Y��!�Ocl&�q��=�Ok4�Gq�)xoo�q��l4wE���Mv�c6@-���Y�OB[h� �u�p57jw��J���M\/󑍗!�շI�#dM�Z�W�^�5�օ{�v�+
Tۧ�VC|=��	�u���P|Yn��Zp�#W$�Dr�vQ�����\.��r�}g�tI���e��	*���f�&~��� MY����ǐR��b�R����s�4�}ӣ�T�/T���y�y0�ji�I�사�	��,�k�^*xQ�U��G� �t*TV��a��� ��J<s?Q!7�Lr�܁�b#�%ҧ��1��,�ST�`�bKx�|���W�f<� �7r��tz����gCz�|�ի��;�ρ(����?!v&r3Vv�\S��M�x���ei�TU�����~-��D���x�0�<4<T�Uo��Ⲭ�҃��A�~?�Y�y\P=��Hm㍀�/� ����&���~�	��_�8��1�\���.{se�n���'3�	�u����t9)��Q0��,ٻ��d2�����HaQc�O�_N�䛷RL�i����GL[����Ö����|OL�pHY�KmT�sqհ6�x���y�t�r�D��S;[��	����QJU�'�Й��<��x_�L�P�9��ިr��N�$Űf�{+-G�(�y#W�Ŗ[=e�_Z^��������S( E���e���Ԝ�17�&5��P�\��'emv��rTN$dC\�J�˺6I��#]��@�b��aH5��Gw3ԚN��:�V�,�BH�d5*�\Z��>m~w�`"�,�����~�$��V��q�zG�� �Q���&�Y��}�;$E���h�ѯ䭟uNK!n��c`�H�;t���ȽQJ/&j&�~!�`�C�ÄT�\�ń�����?#�M �}^�����r7���@�?�(s� ��p�U���5��5�Y�׃1�?��      g   �   x�U�Mn�0���)��f�����@X�+�JݵW�� \��F'lX�3�޼���\qƀ��#�'nJ_�Ƴ�['+Α���W͂|bĽB�q�X��,)'���O/�q£��;b�@�h��e��u7���q$N9��'��*�`�+�����,]N�M�ح�!I���Tz�ʾ�Ӭ�冰cO^f�`��Y=�M�*��P�����49�����0��*      a      x������ � �      Q   |  x�UUY�$!���䄈��e��y�&�D�OҲ��H�z��4{�s,ҕ��4G�e��XOG@iz��`����@l�6���G�#�u��*,�,N	4Yl��8����r�tes�j�0g�!��<�sLZ��3�ؠ�켐`����$�$q^�]#.��(���I،Ƭ�~�)���.���N�'e<��;M��N�R@ F��U��rdXͥ-��\	����[c�(P�ΧC6%��q��+��ė�!a�
���׵��y�	C۰��&6��`�����-�c��R$�-Τ �)K\����ҵ�����"����?V�ϔI*5)T ɲ���>B)�A�jet��~������T���^'�Xz��Y^v���/Xغ,�� ���p@��3S"����:��+� ��V �G���el���ç��Z�~���[�����1�	�|=�d}%G�TL��Ҳ'��=�l�P������[�YS����?'�y@g+�N	Nv\Jh��r�G\�l_��o�C�hw&g��.sKM�\7�~_H.|a�Ϛ�%G[�3E�3eعNQ����Q�I�Ǖ�Q��|��V\�I����rp�K!H�ߓu�̈c%r_�����e}�      L   �  x�uX[r1�O��"@��9��Ȗ�K.=�͞~�)�*"�ht���װ�����]w__/o����p�O�DZ�G������i<�wX���|��_5�|:�8�C�k���!��������}{���2Q�o��e�y0 ����ǯ��ˊb
��$�������ːߏ)��߸���<�8 ���{��r�l����b��=����!�]�|n������ؾ�.W-$�顠�R6恣�x��r�o��o[ ���) 6(/���+��

�mZE"�),nP �jhށo��N5�~=\�)�B�Ǫ@
�k�!�@�$�)�x��v��g=��[�U��"1�s\��ץ1#�@�bB"��8��,��x��#�(Nl ���<P������1P�Y� *�!(����X^%j����,k�k�'�Jeo�U��٠���ҮXQ��x���s�$�k�
=$����=qj|r�9��@�J	���w��|��`
%�@�^N�����f��HfA0(aY萣�=o0��$�,��L)c#�b���R��<v������S����ì�Bc����ϗ��67�4���
y�^�L4�'�Ni�DUa	Ju4>��ގ��뼹L�!*�T�F������aܽ�/�Q�F��54��`n�3�k
���$y�(��)F�g2�`��L~<ȔȈ���J�@�ˍ<6�� ֫��7	z���X�b)�!Hz�{r�Tw11�`�R��>�`��c]%gH&��d	�B�@�*j$�c���*��:�_�_����vۊ�K vݨCV�]����)���������Џ����-Bh�Ї&��TcL�+v�>w��?�"��
c�Z�Y�r��;��Q.M������9�T3c��]PaQ���De���I�4CQ���L��
��x��кx������I�)q7'IT��`��xbg.�ѰGP�Q�N�^f�Jp�9T3S1?��Ⲷ�k��:Ь]B0F�$;K.���x{\�BƐm��2� �G�g��r"�(�N�X�t�<u��Xf'�%IC�ڴL��w�Be�����(rH��Y�'�Q���*>2+��p�q&��-��S��_Y>T��(%a�*ZP�@;���Wu�ϿmUm66��W��
J��*�d'"�q9'y�řSG�Z��.[nzF�l	��i󋘃��'��E��4	��&�6���rGtI��F�������Fwt#�m[�P�V���R4g���A�B��a)�0�~�W��`��l�H��$v����
f�u�T��$�.�o@��K�� �e��m�\����]��L7��c��8�hDi���P��0�AO�ʌ(�+U{I�Ɏ�\�PmP^Z>[�a��Hϵq�.p��|���bBł��Ai�`����Ʈ\ �f&�a�K]1����t�e�,S���	*���&��$)�l��.������"4��l���C�"I@w�6rMo�؉��U$;*.ѓx
�I���r�
!��V2B�=KCB����c��e�ec֦Jy��l7�I�D�.u:L���!��&Qx'Z���\�Ki5*p�m��/�54��87��)�(�4���3`�꞉L��}F�����<P �yƸI����y�"�('�ێ^Ҝ��x�	�k"���q�:a��`�\M��o�m���2/*��&�3��

��q.}�#R�ܙ�PmRݏsz�*C9%B^��X��.�M�A��z�)"㡦}F��ur���:��� &�P�D����U:A�n?Q2���
�:���[���&"�,㡮E��`N�#&��X�e�_CJX*��p�Y)R���6Z��8g��w�q.������@Ɛ�K�~N#E_t��B:��g�\-2��@�JKeU�S4.N}���7,�f ���i]�Q(���e���9�ùƺ�8��I����K��m�n�޽�?/ι�Ѯf�      W   �	  x�uX�oI>?�}a9TuW�����&q�ĉ'q)ϔg*���{='�� ����^BZ��0	����j����"%�����W�}�{_E
I/̤�$�SW����Ż_���P(B9�@�A(�"��!�~�z�z���tO�[�z��H�2*ψ>og�"�׍.����1H9T�0pTt<7��TK۲	�Lc����&��m�6��A�B��^L����(�'W�+6~1>�p���~	=2cJ聫�ip�.t9�C�)�2F�pMi�G��﫿���\����R��._�������$|X��!�!��W��:8���Ê����I���s]��Lה��5:Y�i8�:(�_���=>D>�Pe;R
Z�n�-a���&x��:xb��DW�yM}^�a�cF���Ԅ��?}���QS�<J$R�����S���8�7�g��K�=1UeW�N�Dx;TA(Pd_g�S��xb��_����J!3.���b�*z��c²k���͎� �8#vx��w�맜��C�GD6�(ڔ�c7�[���2F@'0�S�Wg��c]6:`dV��]"�G�z�'�����i����t)��}]�#�9�^~}Q�SWM���%��}{`�P�}ÿ�2�"�kĄ>��K8Jl]N�ߩc�b0��B�n[]^�\{Ș\oʐ��l�xӈNt]�O���:͔��C&2����w��.tQ��
�p�8ث�)��:�}(��1��)a��7:.��C�O��A\����-'H��j5;!�7R�RjV[�\�7��|��_D� m�b�?'�}�s.r���\�|��w�c3��G(/e0E�G�.D�a��g�zj+���]�pu�\�]�3Cx8���=5U���yʹ��!jXq��G�� ����#zfkS����n�6�j���(Ƽ���\5�+"P��||��+��c�i5��a���q���`l
tJ;������%��E�`~��gN	V���na9v��|�"�ԭ�z�]9�`���q;�Mճ+S:<*�=�ݦ��mc�Q��~q�u� S���%���rvL�����m�v�K�{6�HQ`TS�I�qۃ�T%�37��K$�˩@�_���T�neu��Eb"z���i�Ƌ)3_�|�Ӈ����ؓ�R����+R�wX55�p�� ��[Z�T@����TH�Lc��˶G��W��u��"�-2�6(�+)��۪ܷ���|������_��]}��ׇ_a��]�&�U>w��yE�y�z�l�+�����$F��S���x3�`��i��uđ��ł>w�'�K0�����1�b$peb�O�֑7
pY��n	کoJa�!=���"�O]1���zʣ��4L�qD�툰�b�:��7�����
��0o�� ��s ��O���czZ�o�F�v�!\���?��i��mW��"�-�
8B��I� GKia֓H�t���@3>�Tc�̧��-;O �������-����T7��!Q���c?6�l�p���WX���p����R)}@ePN���+⟺p����g�Q���|I�t�	�	2{�q�&P3��aP���~�"PqID�\�����Nl;�`��+�Or��n9�t��x��h��FEX�
�1�Qe���Mac3���]���qːK:�mAX�o���9�����Z+K9�?I��K��s��ܖ���w=�	�E����:O�������o��F����"�]�sL�rQ@����R٭Y����B�S�B1��)rڻ��{$��H%=,�+�z��I�x������u%�h�m]������n0Ӌ����=d@/x��v�naj�r�G�\���i������]HQ�w����������+����M��I��1=j�)k�uԖ���X��,����7س�Lhw2�dd��
�vYW������|~�7����M�\�j@b���:�5$d�_|�d�k�:~���dD0_�5r;���E&<�^�݅�t=�٭8�j���ԜIz>8*��̻��	�	�w�]��{��A�n.d�4��TC0������7�!��F�Z(<����qԡW��l���_�����t�"pe�Ft����]�����y�̓a��A�3k�1��-�m�!����Ea2�)���^�?ښ��='X������7��`��<��V�^�;U.�^H���\��Wg�
�ə�%���`<���ȳ���}�c!BY��za&��!=��-��o`@v(���#�n�Q�+�^�P=}�+���+����qb*=��E_G�] �;��lj��?ӽ���dV����b4��B�҉����v�0����3xY�
��r��g��0.���
��u�_ |q�0��̃)f��Ɲ4ba�W��<�C�.@����Zz�-����kH
&V[���ߧ՝��hgg�£&      P   �  x�UWQ��*{�U|�=���Z����&��Ι�y�Z��F��gjҢz��~��"KfҌ��gt��W�x~ZV����rM_�쯥\e�J]�"@��#�ZJ���%�Wl�"B�ْ!�?��K�O�j}���=u����.8������#�w�q�+R�U���丼?_�?~ڗ��	��V���O��n(\
�������e�$`��74BhX;�O�.(�����q���pG����1�<T\� -��"�����
j�aѾ��Ҋ#L��ɹ�[V�8 ��� ����B�Ko����"@�V�0i�z�s 
@�,t��P��rG���8�`7g��	��6����%h\����R'6�dϊ��$�;�]&(��a�8��C�s���s\$�v�PID��  r@����LAv�<L��P�ͮY��O/w�q�D���LJ���'�Wa�*:^N�"j�AH����/�q�H� "�e�]��tѐ�9��!5�{)�F�fDP�8j?W�*$$dW�~4�V1��^"G����Y`@U��)�^��);��H��	ѯ'B	Yu��W�r���e!I�'�Y�?Hۥ����й���>��@QR�!�]m>E02�j55:����C'PT��@�ݤߪ
O;�B00"9?�	���t����](�h7,��Gy:��ҝ�&_��������`�����<���B�lp)R��a�6��wf d1]>�� FCW�`۪M��	ECنl@����z�ڢmd2�}r��7�HZ�fm2��j� ���~;u�\1�>`��A�kM�I��v�7x2Rr��85*S��_�it[聠d�hA'%�� Q'a����bp�� �� �H���0�6���x��>��8p���?�Z�,��.c�`5]��%�àC�䤔3��Z�����>���xbtO=���fI�����b�gb�yc�J�s'(l���&�6h'#4#�-����Уƾ����7-�(`#y�4b�)��ۂ�x��Q�k^#ըB'�"\ai��/!B��T7��A$��EeP?�*����D�7����� ����NNLaa���q��$����(���DoNb=aN�k����~�t2��!������^a�t.h���(����0I6�r�� ��+��*���f�[r����a0\��'��磬J��
��G��Yw������5�6���a�Є�|&'�ѽ�IF��OR�~&��&a0BuO`Du�u�Gi��@��O"�/�J���(o���"8�2�*�3F��+$LLII�����fհ����*:m�F�#�[��b�+�x�_bW����4�;����X��Vr"9ǡ��*
�ĶI��ޏI,͘j��(Z��_��N8%�      l     x�-�[�%1C��^&
	y����:����U�H%`l��a�m������6:���������۱�<:m�cn����W1Iz\˖��S	�}L��"�}'��i��m뚧Q0)������?�b �ђ�K�t�O �����W;A!~�<��U�����V;i�U�����	��f��W]LrP�-��?�G0�Am�����߫.ɻ>��$�+��%�B�"E�q��h�Wq��F�-�POE�C�� ��h{a��W4�� K���j���px���H�I=Q�x�[I�7D�2�r��R�okb���]� ��s����{.A��\T�k!Fi��W �(�ʠ�A�M�F|��Fx�/�8���[�o����'�r�W���*�n{���2t�sD����'��L�,u�Z�aH�������D���1���;p�ň��
����rbC]�$5S�!xaVB�Wl���J��?}�蒽1� Y�}h��'T��ҔL1H,Y4U�O�O}������,�%)��/���^��Yʏca�%�J�'I�i�y�8Kk-9;���r/tM�ϻC
��K3��
�OQ�,� `pk �NL0�;6�� 4���� �=��,��׈�����K�'��TԔC�6K6ޟj�Zr�<�{bDl�|�cj=B����n�ڮ ΟQ��BUy�8�t����|�J��hz��4>�p����[�x犻�+�Ace�Z�O�ݍ��o5��p�̤(7,��򊈱?�⎃����[k}��e      e   �   x�e���0�s2E��@��0L��CUQ)@
+|oD�+��_���#��v�bWd'$I"S�.i�{q���>���3�m�s{��"�{ݲ��]F	�b�3�Z?ꕦ%R���������N�      i   l	  x�MX�n��]W}wYqP�w�����qbdCu��9�H�ݴ"���g$���b�]���s����\o�{�F2�W�]��ǏMj���J�B��RV
?�+f���=oo{ƔQT�s�*��t���9-�)�A��uݭ�׻/5��=�F,U,��p�	�0��<���9q��-�,D�����}7Ex����*�2��JTFT�qǴ6�����<��<W�S�Ф�]�_��&\)M!b�|%5��9�e鍵�]6m����}���"K)�z!D��2��`dd/�e�oq��ǎP��#�*!yd�����ꤛ�(B!}�be#ǅ��Z����e��_�7<��8ťdJ�`#�nc������$!"M�
J�NZ jl��e�T,���j�w����t?����[ͥf�k��l�uw;���ׇ^��q����a��P���)e�i@vb���I�2�K˼��]�˶G��~&�>�M8f����O���~�T�'QC����	N(�.�������lri$n�}E��b������uG ��Z�>8�=�l�sQ)p�Y�{ơQ`)���C�!|`W��s٦���1̓�+�s�dQ�}5��~ܠ��y�@�2t5|�/ٳ��V��?�j�0)Hw�,��C!<[z�~���=����t��E$d]�����sWK����2��+C7�n�myU�=��(!���V����aho�b���z=V� �r$f�3t�.���Ш�b:Sh��B���������nK΂D�����"�^��f�~��X�PHpѩ�V�r-�����:�J�2��GJ\��"�������5�N2'�*�>��
8�r��a�M�8F�Ua��6l�T���bp�´pl�縈J@hW��tuqݏ�5ٙ���&h���s���a�l3�棅�a�G��d���qQ7@͞�<�4��#=(�lH�	8��R�VBb�bF��e�M���|��ą��K�
#֎kأ0���E[?�t�����r��,QP��u�C��H �H��> �V�o�b�y�R����{#�
w�Ðv_�ĉ%�b:s�rC�#R�uj6۲���C�&�I�:S͂��JS�D̲˶���òx�ږ��O#L��R� (uP��Y�t:詎���H�pǜQ��|�U�D>�AP������bԢ4�9����vܐ��F5�؆���!�����\��3�-Ő#�X��[���w�b���DOn)U�V�(�&g�[R
έJK|�G�C�.��/0��xv��'�>P�j���M�8��m�i��4|�~=��a���G�����ῐ����m��~G��r5��f�S��h0����Tt���&��Q�	Q����>�tޑ.��ТYRTϞ!)RW��ϩ[PZa�4cX5�BKn=�������1u�͜��~�)��xU�pBe}ҝ8�6:��:���ͪ{,�ݿ7�U�"j����EF�EFs�f����JMqQ/G��NB�)<�Nb̡�� QhN� ����FƠ�+m��𪹟��̬WtG�q�����m1��u0��M�K��B�l�G�m�߫��*�_A�b�<��9Swŏ��:Ѷc���(j���`ޯ���7��?Ԃ<�a@�	w���g��1���1Nv?L��h'r�Fp?ҥ��ڐ]���*Ʀ��������yȑ�*�O�I^��Nd@?�Ӛ����!o�=���P��t���ma�#��p� �)V"���]�L'��f+R�&R�A�vY�8c7�8�2�8��.F�(b�T��f�䨋���da&B���8�-�B��q����{l��}C�b�#`��4��1��&���{z���1۾ s��_ip�M��$
�Q�w �8�aT�G'	h���c?�ݛ�SC��~�'+����O�K��k�.�+�h<�ͫ��PvB�5Zm6��:ٕ���yE������$` ��}��$	����%3p�í�(#&��6�X���(�45���@�������+n��Uiv`M/c(�ὑ6�s��l���ۄAx�IG�q5>=A�C}��r���I#nA	��8<=g�Q��,� b*ZgB �r��?���v���>�8�C$;WP�E�c��4`�a�&�,�d8�Y� �_��;_�>��qx'�fx�Q��&lܼ�Ѳ$mTL#���V���	3;a&�;���1��Է�~�������Q~kC6GEp� �}�Dz�z}��^�H�������5��9�#�u]V�d�jKG��M&L~�����pZ���!2���x.��)E�s �I<j:1_>2P�b#A���a��R���vU~2�@Z��;����24��4.'��$�?}�9�?���      J      x������ � �      S      x��]َd�q}����Յ�{�z�el2�I/w��3ר�Y� z�C$@�(y������1)�����|"r�5ݳt���(����q✈Ȥ�
^k�܅�闧�N��>{����_���>�f��:l�ͳﯗ�~��Ϛ�a��G�~�<_��}5,7Ͱ�Z�.����6�n9k��i>쏋�ɑ޸�=��g���gͷ���rsX�?:.�>j�<n�a��:�|�鯶��Y>]�=}y�G����-���[�͢Y���_��n�㬷+�kX�i�����j�/��Ӽ�;e�43�	+T��Ek.Z״j�ڹ�E�B*/UP�8����D�?���yszq�������>}r��9}k~�o�����/�|"�V��<k��a=m�����e��<�zy�6�X�����ɪ�\�O��Ͱf�7��f�]�Ʀ?lɂWؠ�����%���w,��E����~��7a�K��gM����v����ͫY��6��w0ְZ���Yo/��g�_x@~�b�9�Y�eǸ��������i��EO�Á�n�/����%�zz��K;��a1,��jx���#>~?Wt�B�2B����7���f޺�J	��3�Z�ۋ ���+����g؏߿�!��S�.m��n����Y�Fn�,W�!�v�owKz�jx��m��xV�;�Au�)<yE��/�d���q�60�~{��X��Z~�|8�������zY~=��ΰ��l�eӆ��s-'0�^
������ӿ�^�O?�Z?!����j��x���QK���~Do��Ypg;0�^�z���x�\ۉ�,.�#��jn���>��Aw���E7+�� �xؑ3s�Ց��ᒬsu�ˢ�0�=b!�_���v��͚�9"X� �
@EІ֛>by�����u�����%tk�pݔj����9a��w���7�p��q�?A27�bz��(K�;x���2cu������MF���� �s�	_�/��td�f���M��k�������$,~a�ˁ�q?�9�lw	��[�E���s>!�A��|���h��Q�D�۱�~I� zK��o�k��WV�D���5Rε�k?���a}㥳�=+N�����Q>������{�-ehx�o���ּ�hg^��{u��?��^�T�Κ�X��cZ.��PAr�'gp]lw�#�0+6H3 ��Uc��~�~M��<�[��hØ��k��~��P�Ɗ�]V��d�~���r9�h�OzP�v��9>(Η�I�T�U�c��ϥ��Ҳ#?�fn�I$r�M0
iAޟ�KF ��ٻ��WGr�=Yn��&�';tƸk���)l�϶�E�	c��酓]��'��//dh���ߓNh%<M[+e��FH��͐W��	�^��")�����_'�f(J�����VO�9>�+��e(�a�t;�q�����քp��SZrg�
��~70	�V���.�o_�Y��~�8��؋��"��� ǙDo�Z�;Az!8��q����DiQ-V�U�{�s�6L$27�@�V������x�TW�=���dX!��r���
Y�^�:�n�C�ς����>2�
�H�.:��̤឴��H�sk&�Z�Gb�����p��a��!�~���7�f,�1	���u�X�����a�K��/���0�[�qFyR2B�^)(����i#;���v&d��HqI栌�/�D���`o&��x͒#���=h,y�9�ٺ��6�N]�d�D�R��8%2B�&
� " y�ej��rqG�Y�t-� ��b�vÚ�V�]TX��c�~��c��:1q����K�1|�Iy_2�HP�y�=ѣ�L��N���>�<��<�Y$X�w����.i;�Y]���&��!����;O��UHz?���}����9��=|��!���@������%�ií�ܪ�Qi)	kJE�5�z���s_j�%Z��6b�=q-J8��"�kcpLS��[2g
6���$}dj"8�ٌH	c�Tz޶s%'$�������,]�pw���tS_z��}����� �H5�N�dI�>��,)�!��G��an?h%��_�r��㽀�~Fnw������~AB���>�
��v��ʀ/
��ߍ��sm'�O�9��{�5���I�U�)g�dk��B~���蕴_��ߞ�>)��h;��1�nd/�odG"Ib �VX0[mZ'[}�-�Ʒ��@�<=(	匌�8���t��q>��w�k]6J9���n甧.TK<\�s�NTK���w�tR��$�n���Y&&��T�8<���B�>-���-�QLS��겑�O��W��E�;4�)�)���uG�RIʼ�	#5HeP���������ؖ�3��.C>I�7��z�eNG@*���+���P��ؔV���͚�h����#k��/�OKYrN�]9{��ZJ�&����x�R��H D�D��%I��(� x��(dhCV��:��7�Yn[T��v�1�U���֭!Qx�wS�-tf8{���K��S�3���.����g$��@��~�c�Y�%����	2rg�*)8����7T�[k|	���%EΏNq�K_�bGvB�W�'�V��pRص$�e
;�R�Q�YSp�V����z�%�����b����DI'AJb�	Y�~�RȨ�F��V�������'���H����&V_�*�qǌ��Q-P�@��(���ID��Sa魌(=b���2=P������޽䌁��]�άT a�l$��������B:'�V G�HvT�Ӓ
�@tsB[��v�޺�w���È�3!��G����P2k]u�S�l�R> |��J/���+Ӓ�Qsf"�M�����	�vsɲ�ԷgB��r3H�foKdY�c�\���_@��� ;�;߸�\��"����e���z�4m~t���F��+�a����x'
�)�z��;����%��Ro'*�8 ��R����ߑ�<h[ PI���]�7t��To�a�b��1�S��_���˟4�;�����j{A��Q3J�U�i�m���AA������}�p�e;�2D� ��@%i���x��E��`�/H�7yOIe�����5[x�X�-�:��!�Ғ0)@;�`�nm��Y��%X1�؆�*�e��������M�|�N+2�-�7U��J��L*(��i*�R�����=�H&�
㋆P���nN���X�eZ+����������FZ��ڑ�ɖ"ZL�\�.�01�;51�r�c�h���,��y1���H�D�ǚ��XL�R�5���*0��/0�1	V.����m����e����Vl��Fh$���F=�^��h��s��T�.6��*iH��T5_a�X�a��jUVS�z�G*~���bZ�7����ʿ"Y#�oy�(���LU7WVG�5\H��8w�=�ח�kމ�y�y_7y%���Τ�l1�rh��d�� �<�eׅ ����{k�?x.���Ꮂ�M��]�@Z���J�B���"ܪ�����|F��KUjY��2p���[3�����G�Yn��2%~]�U�k����1M�R5��C#\���܁kt [�%���9G$�rC�N������$��ʃ]O����ʲ�<�v��L~$�u(�^Y<��&�� D�����k#	�lc�c
�
Q[[=1<2CI:���u���(��t�����m=���c�݅4LE�eCق�oқֵTW���̳$�t��*(�c�i���� ~9�D�Hc� �6�4Iq���L�AiFO��w-��W{x���U�2�[���"��`����E�Ԋ\�����s�Yr�������r���-��Sh���!W��cȭ��B=��U"{6�B]p0�>��r`�����L@�(^�@x؉��O��bM�K9*��aQO��8��Wְ�$�|�f�LT`ȃ��6o�5X��R�p;1j��*w���(|kr�ɗ�/W�mxHO=���I-5�oəq�A��MQ5���.��X���VE�B�X̄�XQ�;%����/�U�Ԁ�L����|�4�Kn�'F�ͬ���Ȃ5 �  u�#�Zynm�k��;�
j����a|D����y�4V�?G���r���1��7�z���*��(m��F��N\�]�����el)6��rrG��˨�s��n��<�ul��b�7����$;��vT!�&ͺ"Te;���<�Cr{Mz3=�(O�ZH��@���Z�_(ઇ�i�v@D!��@�x�C�%p��m2>���"{x�w�����)V(2� ź��yV���JAI�M	�Z�穊D##��Qi0� ��J8����T�1��!��/�y4�9ަi��)Cj��3-��1Wa7r��/���Y��<�)|3���@|h.Rͬ%`Ҿ<����(4���k� �}r��<ԇ�=���dG�)�&zb5A����r�(��B,~-���:֪�t�Q�UK�֐�UO��0���A��t�,p}�R*ɳ�jnM��Xx��LTp��)��'���]�TN��-S�J�S�ɜ��1��~�r�a]�uR�FMQ�rHZ*�[GgH��Im�ky2���~��w�C�
]yx{!5�y�x���+]�t�n4�>3�T�_���u�T�&�Ļ]�:7���3�B7�e�����&J���#T�s	c:�f	�VuT�:#�o���|2�IJ�e�H?�o�����:��o�w����!O�F�M��|RV��M��(�2���V�քf�fm�ݑQ�v��C�O3�Y�I�kAͮ�0�lT�,-������":VH�<�#��|���vޑK�¬��݄
T~�ZR�w4�s��M�� ��Zz�U�f�4�@	FNH/����!�T�m��3�EuF
H�*����U�>�d��eG�
��މ�Йz�*�W:ܦ �]��8)���}3�t�m=���Rǝ"I�+H6����ez?�
�@��.j�T���'���=�W����^�An�Kh�I�.�ߥ*Е��q9X�r�-�7���l�����#�Ȥ/Һ$B���8��i�=@�P8�T�i�ӂ�YA��t�e�;G���Ѳ��g����h:�$Cj5uԼi�i�h��2@ə;����ͣ< 4ߺ�f�2�@�p:FH]���\���.۾n��A��q�}H�x���i����Ikx��,g�Fq�ܗ��q�ʈl,�l7��uV�/��K3��VSCNi$�ƌb*Mh\d�͒5?-��aw�glr�i����|�o[�?����k��-<��~n�\�	@)8�]��\����=�𶰖nP4j���*BL<a'��(�Mg�4��6?�t�kK�c��eTU�tP̸	2%�K��J+�i��t��v�TbJH�L������o$B�z)R�Z��^�rfH�L�����L���w���A̲��8 �r� ��Z(bM��I�˻�&��1տ+�Mk�����P��v�N��[;���I~Ů�>�r*	�zvOg�hF��yY���& k'$|:U0��8}��O�t���\])�q	�*�m���������V$"t�/7�Ϭ��:P�|(�DN�L��q �����c��ϧc)bt<���Kt���c<ӝ,�ҸD��IH�E�ߕG(���4)��bX�A�R`cq��$bK!Ɲ�J���0����Z$�0����jh^�'Ǹ[�+��덪ĕO�Z_W;�|�23.�K{E�<��\�����ᔞ����g}f�'�\�	?��`�^u �t����4ͻΎ�&��0��;�@M,@X�`���N�?7l��Z2���|=���41�����xV�*�-_=4�
�E:���L�K�)wZd�;$�)��=qх�M�d5��� �΅	�S� �Q]+}���.��_�9�>�ɢ���	�� �0T��) ��&)MrP��H�;gy��U{�A�GD_��?�a]0R��F7Mѱw�3�C��)^d��|���n�z�Ɋ�J�X��z7�&�G+j&M�T��X\g��eٷ�K�7��K���HmԘ/Ǟҏ���EA����)�p�#���H�,N��IFMM�-V>�>��O&��c~p9�y�X��&��У�Q�)�?��ĕ�W�$2YE�v�h�?	l^�ͥ����o�]��YY�|%&M���`�6��5^�`Gǲ^G7�NӚ4 ~j"�1��b�l��C����+�=����ȯ���=��(Kģ���>�w�1&Bac�((�� ^�u�^�����Kϒ�3r؞����
�enOn���9%}�퍖���k�jIǤ�t�`���V���ǳ�Ts ���Γ@�6��	楔�q����/��l$�ՈW�*�\�����w8���R���GwR�k@��2^ڝT���#Iv�C��@m�'��l�eo@�	Vv�;r7A��9���t��G r�|���G<CT��ߙF�`xC=�[���Q�b���\� SU���ͬw��h����H��l���%G��?�?��Mo����O�4J7�Zs��'o��>�百v��n���訫��r���X��P�AJ��Ye�,>Ŕ�G��/y�V(�׬�������]�ðV�YC'u�B���*���2t�Zκ0��SqK����4ݯO���՝������a��W�\�j�D����*�4+÷�[�*ߵ_袄d=�iL*�P�)ʐzT�G��;�C�ios'k�t� Et�i� ��2�}(^�ڟ�?�{��i='=����)6�>e�)�u������V�%��i��A7�I�2��m��7��?��'��`�>Xi:��z�S�V�RM��8A�poZc���hؗ����-�V�����`���~Bw2�J�@��Lޘ�ދ�.���������l;���K�	#x�W�+:��A���x�@�YP�rtˀ�B��L��-�{�s��;��Ӕd�?�i�����~���km^�G�󴑢.��%��(ki@����b[Ӷ��7^5��7�S�� 	Nr*�Z\�LǖX�v�L~�\S�_[�r��d2��ֱ      k   ]   x����	�@E��b�n,�#��4saqjxӑ�6`���S��Ŧ�3�ĩ�N0ߚ����N��̿�T8�X�K�l{0��{�x�_\S,      [      x��\َ�8�}&�B�L��o�����B=O󢌐�Ē�%����+ɰ=�.;�� ��D���s�ߘ�1���hn|�ͮhwei���r�ٸ���o�y�m��p�_�qγ��8��tΆ���6���rw��iɳ�L�����8��4d�y?���r^��:��8g�6-��/��~ˆ=}�6���-�	n�=��:m��<�n��\�)�~�m�y�U��tX�5���tkX�S��q�k��]xnq�M�f���u:��v^q]�ۘ���0-��s�N�y�N��a�e�f�+���v�ޔ�t���ݸ"+ܮ�wee����=N�0��_�H�p9^f\=|�[]��q[�� +�MM�u����v?��������[� �#�y���)[�	VRRu��>_��8�^p_���?��7o�����a��f����
�����/4ny� �g��x?�h��<���<;������M��v�-`4�	�e�aك��ghW��4`��H���UV����y4Li.��y@1� ��H>������p���Ț��X?Ip��i8��6��i\Ђ�Lp��:�������y�٠&+6����Vu���e#�[�j��L�.d��M���nW�`N"y�z��=��t9�U�_`D�+��@�>z��|���
��V��uʖ�~���@�vP7��_��^��x����K��8���^���?�Ɔ����t�q��������\���ε�2h:���>O��-g��(��D|������<�8��8�m��(D��n�/�y'���PS ��yx�@�|CT~������B)�A����L%�&��a�?��E1��/>}���9��i*�P���S��,�M��q���<�����.�m} ߻ ΰ���9u��>*�����~��A"�@ WP�L�g�+�\���;{ O�SA�;[��a��Fr/�8��	B��OOh���l��qc׈���?A��mM�JA���:�P�n=��_�a\��;���(F���(�*;1$ ���	�'�a�A~ a
\�D����b�0!�H�S�P��?۲^2j�bՁ���*1|��;�+ �1�?㆓ -&��3��hD;�%�`8���sE�=Ё�ջ�ع���E�����L()QW���p�@y<�Ѹ�>1�<��	��M�����z��9*��yX��_I�յD͢M�ޘA\)�q��:����mo����Y�0gE�VW�� w%��S�d/rTӛ��Ტ�9�)5L>\���UX������k��������Ğ�/�	�a��9Ӄ8z�G�p���nW{ �F� k D���%frHl�;X�y6���D�r�	!�vA���߶��r��l�u-���jq�e��+Xj4�A��:i��s4eO�0�C�@AЁ�$���X@����JP������N��#bf<='tyE2�#��&]-�I"��b�'������(6X�֕���u���k�w{��Q��d]e�Bʘ�fޡ:�*��~Q*ʟ�
�;���|u��E猽n�p?���q߈ChN@b��37A������?�@8&Lx�(:İ��]�b^#�����W��'M��\��X�ǘ9�c]���)�)o|�9 �fG�QHd�8������(�T�A��$RSѐ6#��{��"�R��#j��4��_)�y"-�w� �*�K��p=��1�yb_�|�!(��-I;� &�(]��`�����bW����c��Vk�M15
`�T+J������u�y������P���2։� ;�P���e%C���߰}�:�6Y�u�>ޢtC�z�rą�@��^���P��'�>�Y�AAybC���a[�5�7�[�D��h�0s���	�E�"�)3��q,h��Cdj��B*P{�(� Hz��6i��������q�H|�N|�Ep���"��T���\�Ò���e�1��a��!s��3jF�	�,���$òS�b��ǴG�:6W���Q
��� �:��w�^�rƠqw@�X�	�dD�;�����Y,w%/}7�b�Q�P!W�!G\0�Я�����9I��m!�cO�2���q�1c%⶞�Rﯲ;����ӕ���F6�*G�=�@J��H�n;�
�aѤ��g��O��b�
e��9>e����@�	���ծ�X���9�xd��8P�*奜M��p�"'���*aO��_�-�A�l>�?[J��6�C@����sa�b	_�־��_8RN�XT��+��^.a��f��@���'�`}c:��&5�
LͽyO��[���4���-`{�*��R�>���@&l����TΤMby+�4�����!2{���՝)IJ�^EYA��=�8����@IŮ�щ��M�L��_�h����^̔-�!<�M�Av�,;H�a!�@��ؘ~k�ݪ�5�&�����pˀo�ִ���JiR,��W�nƹ�}�
�!5x�aLwB��4�/���U	ȿb���[�y"8��8#��e�O�H��3JȖ�ef�� ��X��XW`��&���	���C�(B�Uņ/w ĉ-�Ϯ1�
�/J�|Ybű0�YL�e����Z/:�U�o�0�
� ���\[֦�M[|R�q��a?�j� ����<�GK)�L�%��6����Ԑ|�P"��v����X��������G%%�U��ʕ���)A�_����N!���t؉�SK={H͚�RԻ�C$�0o��D�:���������ܖ��!%kB���-��Hc_�TjK"n)�� u�]A����$�6��q�p' &�N�%� Q� ��VgRɋ�K���HȖ@x({��M�yކ%I&�J#٪0 ��F�cf�d��;+|��S��bJ��xʿ�[���w倶r_�6� �)�]U�
����l��w�Վ*� Z_�������$�4���jlO�4��@�ڸ��[bA�GzM�2����7�Q=H��4�Ĥ���W?)�'��ϐ�aT�zQ�Z�l�\�%�9�lr�'�T�%
[��ꪴT�hVŵX*(^��bAc�5eZg�*~�,$�g��$gl�t"{�^���iW+�a���v7ƍ���w4=a9K��I��؄̴(bգ��8#��\�^ڃ%3���~=+x�xE�(E|$#2�"�v��R���q\W��3��{x�����`��x���VX���8�V��3��֊�H	�V��z	
N��ݮ��x�H��΅l�`_u��(v �c�##s�I&SS-�l
W|"���X��w��5�Lba�������<�P�[���K����=�JK?�mX���_
�ō��{��ڼ����:�0�f�Ҕ�i#�+�2 ���ҼK�� ���+e�p�Ǿ!��w6����E�Ȩ��@8�������:V,�	aị/��y�VW�mTSC����֍i���[��9\m��?
US�U$�$T�y�#C1ap:2��&g���"|a.� ���f��MI�{�_���+�ԕ�͞~��j��)��.�w6j�pD�`��'�{��u�-�P��I�O
ln8�C�b_�6OC-���h�ˬڙ��~��EK��T]HM����*�#�oƟm�L��W8�+u;`f�y�S����0��VM���8n��j2�!��A>�q«6N���j�=�t�ʵP����$��bk|Ј�1t����W:�®���l�p4܍e��5R�H��*i�	�\8����Dk����XN�6����q��\\��E��+#c��)P�+�E����"�{!Xt2���`�18����2�c��B���4@.e^��9Nũ�ɬ�Ւ ���"ۣ^�L'{�$,�}L�;�����+x�$f٦�q��c�g B`����Ih��p�����#��I����Q!<g��eQ��/��$�!Q�!�*$^�p�!�AM��_�2Rv����q��Pڠ�$G�i��E͟���+j�0���_u�7�ؖȀ�* t  �������N'6�@/sV,��Yd�2p+����NE�m��ƾgQ���79��LaöN��x����u�����N
�\ �$_A�����QG�!#�o�mF�>��4H�a��*���GJx�V��y�K���	ǋ�%����Ep�n2qG��uy8����X�7���֮���\�=���,����^���`�O*��w�����+�"+M���;�e!��ɤ:��*�zW�J����w%eI��4�^cѶ$i��&K̿�m��Aѯ��Ȟ����g�l=He���n{�-!�0o��YB`��4� �9���� o�a@�[Z������Q	%v�0��C�����2�&1�����Xȣ�kf�[�۹���Xm6�D�V��MIP����e�<�/Ly���l���0Ō0�*PP���mW�8R_D��a�����S�9�3}p�)�+#-w�A&���?Ifj�`*���������!TŖ�~5��g�V?�q�B	�vDkU�s;�j0X���z�&���*F�Q_�[|0 o�z ��J��Ք�ԕ�SU�C�!9��,���O�5X2o�� ��P�m̥<h ������O:��b-��tU���6�:��S�j�4��瀮���L�Ԃ���5uii]���َ��m�$�G*:>��'H7�$�H�r�ݔ�iﺚ�l��Fҵ8���؎��� S��+���*]F�� �IA�=��b,��&'������o�Ѷz��!��|$OL3lG�Q}	��)p�����\����mOuƺ�l�A{(�����g{�Gy�.��DӋ]�E��.���@�B�t�\�*�K$��� zw&Ӣ�c������:ViU<T��}�����7-�]r�S𮉚wH�>��_c���!�����Rh� ۡ^KBx%G'�!��0��(�S?���l_�ƔU�??����v�	K/Q����4y�u��yS6����[<(�3�e�WE��M�8~���S����S0yi1�[`F�Ǌ=��A�'�7>>�
GͿ�y��r�q�SrT]������2�[0��¨L<��=D�b��MS4L�I\U^��I�<Q��������0s     