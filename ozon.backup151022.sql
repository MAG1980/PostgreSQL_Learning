PGDMP             	        	    z            ozon %   12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)    14.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    90112    ozon    DATABASE     Y   CREATE DATABASE ozon WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'ru_RU.UTF-8';
    DROP DATABASE ozon;
                postgres    false            �           0    0    DATABASE ozon    ACL     '   GRANT ALL ON DATABASE ozon TO gb_user;
                   postgres    false    3226            �            1255    106630    get_order_cost(integer)    FUNCTION       CREATE FUNCTION public.get_order_cost(order_number integer) RETURNS numeric
    LANGUAGE sql
    AS $$
SELECT
ROUND(SUM(product_amount * product_price * (100 - product_discount) / 100), 2)
FROM orders_products
WHERE orders_products.order_id = order_number
GROUP BY order_id;
$$;
 ;   DROP FUNCTION public.get_order_cost(order_number integer);
       public          gb_user    false            �            1255    122885 3   order_total_cost_and_discount_calculation_trigger()    FUNCTION       CREATE FUNCTION public.order_total_cost_and_discount_calculation_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
order_total_cost NUMERIC;
order_discount NUMERIC;
BEGIN
	order_total_cost := (SELECT get_order_cost(NEW.order_id));
	case 			
		when order_total_cost > 15000 then
        	order_discount = 1.5;
		when order_total_cost > 500 then
            order_discount = 1.2;
		when order_total_cost > 300 then
            order_discount = 1;
		when order_total_cost > 200 then
            order_discount = 0.7;
		when order_total_cost > 100 then
            order_discount = 0.5;			   
		else
	        order_discount = 0;
	end case;
	UPDATE orders
	  SET
	    total_cost = order_total_cost,
	    discount = order_discount
	WHERE id = NEW.order_id;
	RETURN NEW;
END
$$;
 J   DROP FUNCTION public.order_total_cost_and_discount_calculation_trigger();
       public          gb_user    false            �            1255    114695    order_total_cost_calculation() 	   PROCEDURE     �  CREATE PROCEDURE public.order_total_cost_calculation()
    LANGUAGE plpgsql
    AS $$
DECLARE order_row RECORD;
BEGIN
  FOR order_row IN
    SELECT *
      FROM orders
		JOIN orders_products
	 	ON orders_products.order_id = orders.id	  
  LOOP
	UPDATE orders SET total_cost =
	(SELECT
	get_order_cost(order_row.id)
	FROM orders
	JOIN orders_products
	  ON orders_products.order_id = orders.id
	WHERE orders.id = order_row.id
	GROUP BY orders.id)
	WHERE orders.id = order_row.id;	
  END LOOP;
COMMIT;
END;
$$;
 6   DROP PROCEDURE public.order_total_cost_calculation();
       public          gb_user    false            �            1259    90203    avatars    TABLE     �   CREATE TABLE public.avatars (
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
       public          gb_user    false    205            �           0    0    avatars_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.avatars_id_seq OWNED BY public.avatars.id;
          public          gb_user    false    204            �            1259    90356    brand_logos    TABLE     �   CREATE TABLE public.brand_logos (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    size integer NOT NULL,
    created_at timestamp without time zone
);
    DROP TABLE public.brand_logos;
       public         heap    gb_user    false            �            1259    90354    brand_logo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.brand_logo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.brand_logo_id_seq;
       public          gb_user    false    211            �           0    0    brand_logo_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.brand_logo_id_seq OWNED BY public.brand_logos.id;
          public          gb_user    false    210            �            1259    90437    carts    TABLE     W   CREATE TABLE public.carts (
    id integer NOT NULL,
    client_id integer NOT NULL
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
       public          gb_user    false    217            �           0    0    carts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;
          public          gb_user    false    216            �            1259    90518    carts_products    TABLE     �   CREATE TABLE public.carts_products (
    cart_id integer NOT NULL,
    product_id integer NOT NULL,
    product_amount integer NOT NULL,
    product_price numeric,
    product_discount numeric
);
 "   DROP TABLE public.carts_products;
       public         heap    gb_user    false            �            1259    90320    product_categories    TABLE     �   CREATE TABLE public.product_categories (
    id integer NOT NULL,
    name character varying(50),
    created_at timestamp without time zone,
    parent_category_id integer
);
 &   DROP TABLE public.product_categories;
       public         heap    gb_user    false            �            1259    90318    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          gb_user    false    209            �           0    0    categories_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.categories_id_seq OWNED BY public.product_categories.id;
          public          gb_user    false    208            �            1259    90379    client_product_photos    TABLE     �   CREATE TABLE public.client_product_photos (
    id integer NOT NULL,
    review_id integer NOT NULL,
    url character varying(250) NOT NULL,
    size integer NOT NULL,
    created_at timestamp without time zone
);
 )   DROP TABLE public.client_product_photos;
       public         heap    gb_user    false            �            1259    90401    clients    TABLE     I  CREATE TABLE public.clients (
    id integer NOT NULL,
    avatar_id integer,
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
       public          gb_user    false    215            �           0    0    clients_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;
          public          gb_user    false    214            �            1259    90377    clients_photos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clients_photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.clients_photos_id_seq;
       public          gb_user    false    213            �           0    0    clients_photos_id_seq    SEQUENCE OWNED BY     V   ALTER SEQUENCE public.clients_photos_id_seq OWNED BY public.client_product_photos.id;
          public          gb_user    false    212            �            1259    98306 	   countries    TABLE     d   CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);
    DROP TABLE public.countries;
       public         heap    gb_user    false            �            1259    98304    countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.countries_id_seq;
       public          gb_user    false    236            �           0    0    countries_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;
          public          gb_user    false    235            �            1259    90457    execution_statuses    TABLE     �   CREATE TABLE public.execution_statuses (
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
       public          gb_user    false    221            �           0    0    execution_statuses_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.execution_statuses_id_seq OWNED BY public.execution_statuses.id;
          public          gb_user    false    220            �            1259    90725 	   favorites    TABLE     [   CREATE TABLE public.favorites (
    id integer NOT NULL,
    client_id integer NOT NULL
);
    DROP TABLE public.favorites;
       public         heap    gb_user    false            �            1259    90723    favorites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.favorites_id_seq;
       public          gb_user    false    234            �           0    0    favorites_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;
          public          gb_user    false    233            �            1259    90710    favorites_products    TABLE     �   CREATE TABLE public.favorites_products (
    favorites_id integer NOT NULL,
    product_id integer NOT NULL,
    date_added date NOT NULL
);
 &   DROP TABLE public.favorites_products;
       public         heap    gb_user    false            �            1259    90156    product_photos    TABLE     �   CREATE TABLE public.product_photos (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    size integer NOT NULL,
    created_at timestamp without time zone,
    product_id integer NOT NULL
);
 "   DROP TABLE public.product_photos;
       public         heap    gb_user    false            �            1259    90154    goods_photos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.goods_photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.goods_photos_id_seq;
       public          gb_user    false    203            �           0    0    goods_photos_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.goods_photos_id_seq OWNED BY public.product_photos.id;
          public          gb_user    false    202            �            1259    98328    manufacturers    TABLE     �   CREATE TABLE public.manufacturers (
    id integer NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    brand_logo_id integer,
    country_id integer,
    created_at character varying(255)
);
 !   DROP TABLE public.manufacturers;
       public         heap    gb_user    false            �            1259    98326    manufacturers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.manufacturers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.manufacturers_id_seq;
       public          gb_user    false    238            �           0    0    manufacturers_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.manufacturers_id_seq OWNED BY public.manufacturers.id;
          public          gb_user    false    237            �            1259    90229    orders    TABLE     (  CREATE TABLE public.orders (
    id integer NOT NULL,
    client_id integer NOT NULL,
    payment_method_id integer NOT NULL,
    pick_up_point_id integer NOT NULL,
    created_at timestamp with time zone,
    execution_status_id integer NOT NULL,
    total_cost numeric,
    discount numeric
);
    DROP TABLE public.orders;
       public         heap    gb_user    false            �            1259    90512    orders_products    TABLE     �   CREATE TABLE public.orders_products (
    order_id integer NOT NULL,
    product_id integer NOT NULL,
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
       public         heap    gb_user    false            �            1259    90482    pick_up_points    TABLE     �   CREATE TABLE public.pick_up_points (
    id integer NOT NULL,
    postal_code character varying(12),
    city character varying(30),
    street character varying(50),
    building character varying(4),
    created_at timestamp without time zone
);
 "   DROP TABLE public.pick_up_points;
       public         heap    gb_user    false            �            1259    90566    products    TABLE     l  CREATE TABLE public.products (
    id integer NOT NULL,
    product_category_id integer,
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
       public         heap    gb_user    false            �            1259    106510    most_costly_orders    VIEW     G  CREATE VIEW public.most_costly_orders AS
 WITH most_costly_orders AS (
         SELECT orders_products.order_id,
            round(sum(((((orders_products.product_amount)::numeric * orders_products.product_price) * ((100)::numeric - orders_products.product_discount)) / (100)::numeric)), 2) AS order_cost
           FROM (public.orders_products
             JOIN public.products ON ((products.id = orders_products.product_id)))
          GROUP BY orders_products.order_id
          ORDER BY (round(sum(((((orders_products.product_amount)::numeric * orders_products.product_price) * ((100)::numeric - orders_products.product_discount)) / (100)::numeric)), 2)) DESC NULLS LAST
         LIMIT 10
        )
 SELECT most_costly_orders.order_id,
    most_costly_orders.order_cost,
    orders.created_at AS order_date,
    pick_up_points.id AS pick_up_point_id,
    pick_up_points.postal_code,
    pick_up_points.city AS pick_up_point_city,
    clients.name AS client_surname,
    payment_methods.name AS payment_method
   FROM ((((public.pick_up_points
     JOIN public.orders ON ((orders.pick_up_point_id = pick_up_points.id)))
     JOIN most_costly_orders ON ((most_costly_orders.order_id = orders.id)))
     JOIN public.clients ON ((clients.id = orders.client_id)))
     JOIN public.payment_methods ON ((payment_methods.id = orders.payment_method_id)));
 %   DROP VIEW public.most_costly_orders;
       public          gb_user    false    226    207    207    207    207    207    215    215    219    219    223    223    223    226    226    226    226    229            �            1259    90227    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          gb_user    false    207            �           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          gb_user    false    206            �            1259    90447    payment_methods_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_methods_id_seq;
       public          gb_user    false    219            �           0    0    payment_methods_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payment_methods_id_seq OWNED BY public.payment_methods.id;
          public          gb_user    false    218            �            1259    90480    pick_up_points_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pick_up_points_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.pick_up_points_id_seq;
       public          gb_user    false    223            �           0    0    pick_up_points_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.pick_up_points_id_seq OWNED BY public.pick_up_points.id;
          public          gb_user    false    222            �            1259    90564    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          gb_user    false    229            �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          gb_user    false    228            �            1259    90600    reviews    TABLE     �   CREATE TABLE public.reviews (
    id integer NOT NULL,
    product_id integer NOT NULL,
    client_id integer NOT NULL,
    created_at timestamp without time zone,
    rating_id integer,
    text_content character varying(500)
);
    DROP TABLE public.reviews;
       public         heap    gb_user    false            �            1259    106610 "   products_with_biggest_client_photo    VIEW     `  CREATE VIEW public.products_with_biggest_client_photo AS
 WITH biggest_client_photo AS (
         SELECT products.id AS product_id,
            clients_1.id AS client_id,
            client_product_photos.size AS client_product_photo_size
           FROM (((public.products
             JOIN public.reviews ON ((reviews.product_id = products.id)))
             JOIN public.client_product_photos ON ((client_product_photos.review_id = reviews.id)))
             JOIN public.clients clients_1 ON ((clients_1.id = reviews.client_id)))
          WHERE (client_product_photos.size > 5000)
          ORDER BY client_product_photos.size DESC
        )
 SELECT DISTINCT biggest_client_photo.product_id,
    biggest_client_photo.client_product_photo_size,
    biggest_client_photo.client_id,
    (((clients.name)::text || ' '::text) || (clients.surname)::text) AS client_name,
    date_part('years'::text, age(now(), (clients.birthday)::timestamp with time zone)) AS client_age
   FROM (biggest_client_photo
     JOIN public.clients ON ((clients.id = biggest_client_photo.client_id)))
  ORDER BY biggest_client_photo.product_id;
 5   DROP VIEW public.products_with_biggest_client_photo;
       public          gb_user    false    231    213    213    215    215    215    215    229    231    231            �            1259    90506    ratings    TABLE     b   CREATE TABLE public.ratings (
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
       public          gb_user    false    225            �           0    0    ratings_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;
          public          gb_user    false    224            �            1259    90598    reviews_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reviews_id_seq;
       public          gb_user    false    231            �           0    0    reviews_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;
          public          gb_user    false    230            �           2604    90206 
   avatars id    DEFAULT     h   ALTER TABLE ONLY public.avatars ALTER COLUMN id SET DEFAULT nextval('public.avatars_id_seq'::regclass);
 9   ALTER TABLE public.avatars ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    204    205    205            �           2604    90359    brand_logos id    DEFAULT     o   ALTER TABLE ONLY public.brand_logos ALTER COLUMN id SET DEFAULT nextval('public.brand_logo_id_seq'::regclass);
 =   ALTER TABLE public.brand_logos ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    211    210    211            �           2604    90440    carts id    DEFAULT     d   ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);
 7   ALTER TABLE public.carts ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    216    217    217            �           2604    90382    client_product_photos id    DEFAULT     }   ALTER TABLE ONLY public.client_product_photos ALTER COLUMN id SET DEFAULT nextval('public.clients_photos_id_seq'::regclass);
 G   ALTER TABLE public.client_product_photos ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    213    212    213            �           2604    90404 
   clients id    DEFAULT     h   ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);
 9   ALTER TABLE public.clients ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    215    214    215            �           2604    98309    countries id    DEFAULT     l   ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);
 ;   ALTER TABLE public.countries ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    235    236    236            �           2604    90460    execution_statuses id    DEFAULT     ~   ALTER TABLE ONLY public.execution_statuses ALTER COLUMN id SET DEFAULT nextval('public.execution_statuses_id_seq'::regclass);
 D   ALTER TABLE public.execution_statuses ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    221    220    221            �           2604    90728    favorites id    DEFAULT     l   ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);
 ;   ALTER TABLE public.favorites ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    233    234    234            �           2604    98331    manufacturers id    DEFAULT     t   ALTER TABLE ONLY public.manufacturers ALTER COLUMN id SET DEFAULT nextval('public.manufacturers_id_seq'::regclass);
 ?   ALTER TABLE public.manufacturers ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    237    238    238            �           2604    90232 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    207    206    207            �           2604    90452    payment_methods id    DEFAULT     x   ALTER TABLE ONLY public.payment_methods ALTER COLUMN id SET DEFAULT nextval('public.payment_methods_id_seq'::regclass);
 A   ALTER TABLE public.payment_methods ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    218    219    219            �           2604    90485    pick_up_points id    DEFAULT     v   ALTER TABLE ONLY public.pick_up_points ALTER COLUMN id SET DEFAULT nextval('public.pick_up_points_id_seq'::regclass);
 @   ALTER TABLE public.pick_up_points ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    223    222    223            �           2604    90323    product_categories id    DEFAULT     v   ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 D   ALTER TABLE public.product_categories ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    209    208    209            �           2604    90159    product_photos id    DEFAULT     t   ALTER TABLE ONLY public.product_photos ALTER COLUMN id SET DEFAULT nextval('public.goods_photos_id_seq'::regclass);
 @   ALTER TABLE public.product_photos ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    203    202    203            �           2604    90569    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    229    228    229            �           2604    90509 
   ratings id    DEFAULT     h   ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);
 9   ALTER TABLE public.ratings ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    224    225    225            �           2604    90603 
   reviews id    DEFAULT     h   ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);
 9   ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
       public          gb_user    false    231    230    231            s          0    90203    avatars 
   TABLE DATA           <   COPY public.avatars (id, url, size, created_at) FROM stdin;
    public          gb_user    false    205   ��       y          0    90356    brand_logos 
   TABLE DATA           @   COPY public.brand_logos (id, url, size, created_at) FROM stdin;
    public          gb_user    false    211   v�                 0    90437    carts 
   TABLE DATA           .   COPY public.carts (id, client_id) FROM stdin;
    public          gb_user    false    217   #�       �          0    90518    carts_products 
   TABLE DATA           n   COPY public.carts_products (cart_id, product_id, product_amount, product_price, product_discount) FROM stdin;
    public          gb_user    false    227   _�       {          0    90379    client_product_photos 
   TABLE DATA           U   COPY public.client_product_photos (id, review_id, url, size, created_at) FROM stdin;
    public          gb_user    false    213   s�       }          0    90401    clients 
   TABLE DATA           j   COPY public.clients (id, avatar_id, name, surname, birthday, email, phone, registration_date) FROM stdin;
    public          gb_user    false    215   ��       �          0    98306 	   countries 
   TABLE DATA           -   COPY public.countries (id, name) FROM stdin;
    public          gb_user    false    236   �      �          0    90457    execution_statuses 
   TABLE DATA           B   COPY public.execution_statuses (id, name, created_at) FROM stdin;
    public          gb_user    false    221   X      �          0    90725 	   favorites 
   TABLE DATA           2   COPY public.favorites (id, client_id) FROM stdin;
    public          gb_user    false    234   >	      �          0    90710    favorites_products 
   TABLE DATA           R   COPY public.favorites_products (favorites_id, product_id, date_added) FROM stdin;
    public          gb_user    false    232   {
      �          0    98328    manufacturers 
   TABLE DATA           X   COPY public.manufacturers (id, name, brand_logo_id, country_id, created_at) FROM stdin;
    public          gb_user    false    238         u          0    90229    orders 
   TABLE DATA           �   COPY public.orders (id, client_id, payment_method_id, pick_up_point_id, created_at, execution_status_id, total_cost, discount) FROM stdin;
    public          gb_user    false    207   �      �          0    90512    orders_products 
   TABLE DATA           p   COPY public.orders_products (order_id, product_id, product_amount, product_price, product_discount) FROM stdin;
    public          gb_user    false    226   "      �          0    90449    payment_methods 
   TABLE DATA           ?   COPY public.payment_methods (id, name, created_at) FROM stdin;
    public          gb_user    false    219   9      �          0    90482    pick_up_points 
   TABLE DATA           ]   COPY public.pick_up_points (id, postal_code, city, street, building, created_at) FROM stdin;
    public          gb_user    false    223   �      w          0    90320    product_categories 
   TABLE DATA           V   COPY public.product_categories (id, name, created_at, parent_category_id) FROM stdin;
    public          gb_user    false    209   I'      q          0    90156    product_photos 
   TABLE DATA           O   COPY public.product_photos (id, url, size, created_at, product_id) FROM stdin;
    public          gb_user    false    203   v-      �          0    90566    products 
   TABLE DATA           �   COPY public.products (id, product_category_id, manufacturer_id, vendor_code, name, description, amount, price, discount, created_at) FROM stdin;
    public          gb_user    false    229   �5      �          0    90506    ratings 
   TABLE DATA           +   COPY public.ratings (id, name) FROM stdin;
    public          gb_user    false    225   �Q      �          0    90600    reviews 
   TABLE DATA           a   COPY public.reviews (id, product_id, client_id, created_at, rating_id, text_content) FROM stdin;
    public          gb_user    false    231   R      �           0    0    avatars_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.avatars_id_seq', 100, true);
          public          gb_user    false    204            �           0    0    brand_logo_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.brand_logo_id_seq', 100, true);
          public          gb_user    false    210            �           0    0    carts_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.carts_id_seq', 100, true);
          public          gb_user    false    216            �           0    0    categories_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.categories_id_seq', 100, true);
          public          gb_user    false    208            �           0    0    clients_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.clients_id_seq', 100, true);
          public          gb_user    false    214            �           0    0    clients_photos_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.clients_photos_id_seq', 100, true);
          public          gb_user    false    212            �           0    0    countries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.countries_id_seq', 13, true);
          public          gb_user    false    235            �           0    0    execution_statuses_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.execution_statuses_id_seq', 6, true);
          public          gb_user    false    220            �           0    0    favorites_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.favorites_id_seq', 100, true);
          public          gb_user    false    233            �           0    0    goods_photos_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.goods_photos_id_seq', 100, true);
          public          gb_user    false    202            �           0    0    manufacturers_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.manufacturers_id_seq', 100, true);
          public          gb_user    false    237            �           0    0    orders_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.orders_id_seq', 100, true);
          public          gb_user    false    206            �           0    0    payment_methods_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.payment_methods_id_seq', 3, true);
          public          gb_user    false    218            �           0    0    pick_up_points_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pick_up_points_id_seq', 100, true);
          public          gb_user    false    222            �           0    0    products_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.products_id_seq', 100, true);
          public          gb_user    false    228            �           0    0    ratings_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.ratings_id_seq', 5, true);
          public          gb_user    false    224            �           0    0    reviews_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.reviews_id_seq', 100, true);
          public          gb_user    false    230            �           2606    90208    avatars avatars_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.avatars
    ADD CONSTRAINT avatars_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.avatars DROP CONSTRAINT avatars_pkey;
       public            gb_user    false    205            �           2606    90210    avatars avatars_url_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.avatars
    ADD CONSTRAINT avatars_url_key UNIQUE (url);
 A   ALTER TABLE ONLY public.avatars DROP CONSTRAINT avatars_url_key;
       public            gb_user    false    205            �           2606    90361    brand_logos brand_logos_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.brand_logos
    ADD CONSTRAINT brand_logos_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.brand_logos DROP CONSTRAINT brand_logos_pkey;
       public            gb_user    false    211            �           2606    90363    brand_logos brand_logos_url_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.brand_logos
    ADD CONSTRAINT brand_logos_url_key UNIQUE (url);
 I   ALTER TABLE ONLY public.brand_logos DROP CONSTRAINT brand_logos_url_key;
       public            gb_user    false    211            �           2606    90444    carts carts_client_id_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_client_id_key UNIQUE (client_id);
 C   ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_client_id_key;
       public            gb_user    false    217            �           2606    90442    carts carts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
       public            gb_user    false    217            �           2606    90384 0   client_product_photos client_product_photos_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.client_product_photos
    ADD CONSTRAINT client_product_photos_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.client_product_photos DROP CONSTRAINT client_product_photos_pkey;
       public            gb_user    false    213            �           2606    90386 3   client_product_photos client_product_photos_url_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.client_product_photos
    ADD CONSTRAINT client_product_photos_url_key UNIQUE (url);
 ]   ALTER TABLE ONLY public.client_product_photos DROP CONSTRAINT client_product_photos_url_key;
       public            gb_user    false    213            �           2606    90408    clients clients_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_email_key;
       public            gb_user    false    215            �           2606    90410    clients clients_phone_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_phone_key UNIQUE (phone);
 C   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_phone_key;
       public            gb_user    false    215            �           2606    90406    clients clients_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            gb_user    false    215            �           2606    98313    countries countries_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_name_key;
       public            gb_user    false    236            �           2606    98311    countries countries_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            gb_user    false    236            �           2606    90462 *   execution_statuses execution_statuses_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.execution_statuses
    ADD CONSTRAINT execution_statuses_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.execution_statuses DROP CONSTRAINT execution_statuses_pkey;
       public            gb_user    false    221            �           2606    90732 !   favorites favorites_client_id_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_client_id_key UNIQUE (client_id);
 K   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_client_id_key;
       public            gb_user    false    234            �           2606    90730    favorites favorites_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_pkey;
       public            gb_user    false    234            �           2606    98337     manufacturers manufacturers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.manufacturers DROP CONSTRAINT manufacturers_pkey;
       public            gb_user    false    238            �           2606    90234    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            gb_user    false    207            �           2606    90454 $   payment_methods payment_methods_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.payment_methods DROP CONSTRAINT payment_methods_pkey;
       public            gb_user    false    219            �           2606    90487 "   pick_up_points pick_up_points_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.pick_up_points
    ADD CONSTRAINT pick_up_points_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.pick_up_points DROP CONSTRAINT pick_up_points_pkey;
       public            gb_user    false    223            �           2606    90325 *   product_categories product_categories_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.product_categories DROP CONSTRAINT product_categories_pkey;
       public            gb_user    false    209            �           2606    90161 "   product_photos product_photos_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.product_photos
    ADD CONSTRAINT product_photos_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.product_photos DROP CONSTRAINT product_photos_pkey;
       public            gb_user    false    203            �           2606    90163 %   product_photos product_photos_url_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.product_photos
    ADD CONSTRAINT product_photos_url_key UNIQUE (url);
 O   ALTER TABLE ONLY public.product_photos DROP CONSTRAINT product_photos_url_key;
       public            gb_user    false    203            �           2606    90574    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            gb_user    false    229            �           2606    90576 !   products products_vendor_code_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_vendor_code_key UNIQUE (vendor_code);
 K   ALTER TABLE ONLY public.products DROP CONSTRAINT products_vendor_code_key;
       public            gb_user    false    229            �           2606    90511    ratings ratings_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_pkey;
       public            gb_user    false    225            �           2606    90608    reviews reviews_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            gb_user    false    231            �           2620    122890 O   orders_products order_total_cost_discount_calculation_on_orders_products_insert    TRIGGER     �   CREATE TRIGGER order_total_cost_discount_calculation_on_orders_products_insert AFTER INSERT ON public.orders_products FOR EACH ROW EXECUTE FUNCTION public.order_total_cost_and_discount_calculation_trigger();
 h   DROP TRIGGER order_total_cost_discount_calculation_on_orders_products_insert ON public.orders_products;
       public          gb_user    false    255    226            �           2620    122889 O   orders_products order_total_cost_discount_calculation_on_orders_products_update    TRIGGER     �   CREATE TRIGGER order_total_cost_discount_calculation_on_orders_products_update AFTER UPDATE ON public.orders_products FOR EACH ROW EXECUTE FUNCTION public.order_total_cost_and_discount_calculation_trigger();
 h   DROP TRIGGER order_total_cost_discount_calculation_on_orders_products_update ON public.orders_products;
       public          gb_user    false    226    255            �           2606    90650    carts carts_client_id_fk    FK CONSTRAINT     {   ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_client_id_fk FOREIGN KEY (client_id) REFERENCES public.clients(id);
 B   ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_client_id_fk;
       public          gb_user    false    217    215    3002            �           2606    90695 (   carts_products carts_products_cart_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.carts_products
    ADD CONSTRAINT carts_products_cart_id_fk FOREIGN KEY (cart_id) REFERENCES public.carts(id);
 R   ALTER TABLE ONLY public.carts_products DROP CONSTRAINT carts_products_cart_id_fk;
       public          gb_user    false    217    227    3006            �           2606    90700 +   carts_products carts_products_product_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.carts_products
    ADD CONSTRAINT carts_products_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);
 U   ALTER TABLE ONLY public.carts_products DROP CONSTRAINT carts_products_product_id_fk;
       public          gb_user    false    3016    229    227            �           2606    90635 8   client_product_photos client_product_photos_review_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_product_photos
    ADD CONSTRAINT client_product_photos_review_id_fk FOREIGN KEY (review_id) REFERENCES public.reviews(id);
 b   ALTER TABLE ONLY public.client_product_photos DROP CONSTRAINT client_product_photos_review_id_fk;
       public          gb_user    false    213    231    3020            �           2606    90640    clients clients_avatar_id_fk    FK CONSTRAINT        ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_avatar_id_fk FOREIGN KEY (avatar_id) REFERENCES public.avatars(id);
 F   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_avatar_id_fk;
       public          gb_user    false    215    205    2982            �           2606    106496     favorites favorites_client_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_client_id_fk FOREIGN KEY (client_id) REFERENCES public.clients(id);
 J   ALTER TABLE ONLY public.favorites DROP CONSTRAINT favorites_client_id_fk;
       public          gb_user    false    3002    215    234            �           2606    90733 5   favorites_products favorites_products_favorites_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorites_products
    ADD CONSTRAINT favorites_products_favorites_id_fk FOREIGN KEY (favorites_id) REFERENCES public.favorites(id);
 _   ALTER TABLE ONLY public.favorites_products DROP CONSTRAINT favorites_products_favorites_id_fk;
       public          gb_user    false    234    3024    232            �           2606    90738 3   favorites_products favorites_products_product_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.favorites_products
    ADD CONSTRAINT favorites_products_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);
 ]   ALTER TABLE ONLY public.favorites_products DROP CONSTRAINT favorites_products_product_id_fk;
       public          gb_user    false    229    232    3016            �           2606    98348 ,   manufacturers manufacturers_brand_logo_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_brand_logo_id_fk FOREIGN KEY (brand_logo_id) REFERENCES public.brand_logos(id);
 V   ALTER TABLE ONLY public.manufacturers DROP CONSTRAINT manufacturers_brand_logo_id_fk;
       public          gb_user    false    238    211    2990            �           2606    98343 )   manufacturers manufacturers_country_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_country_id_fk FOREIGN KEY (country_id) REFERENCES public.countries(id);
 S   ALTER TABLE ONLY public.manufacturers DROP CONSTRAINT manufacturers_country_id_fk;
       public          gb_user    false    3028    236    238            �           2606    90655    orders orders_client_id_fk    FK CONSTRAINT     }   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_client_id_fk FOREIGN KEY (client_id) REFERENCES public.clients(id);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_client_id_fk;
       public          gb_user    false    207    215    3002            �           2606    90670 $   orders orders_execution_status_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_execution_status_id_fk FOREIGN KEY (execution_status_id) REFERENCES public.execution_statuses(id);
 N   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_execution_status_id_fk;
       public          gb_user    false    207    3010    221            �           2606    90660 "   orders orders_payment_method_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_payment_method_id_fk FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_payment_method_id_fk;
       public          gb_user    false    3008    219    207            �           2606    90665 !   orders orders_pick_up_point_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pick_up_point_id_fk FOREIGN KEY (pick_up_point_id) REFERENCES public.pick_up_points(id);
 K   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pick_up_point_id_fk;
       public          gb_user    false    223    207    3012            �           2606    90675 +   orders_products orders_products_order_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_order_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(id);
 U   ALTER TABLE ONLY public.orders_products DROP CONSTRAINT orders_products_order_id_fk;
       public          gb_user    false    226    2986    207            �           2606    90680 -   orders_products orders_products_product_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT orders_products_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);
 W   ALTER TABLE ONLY public.orders_products DROP CONSTRAINT orders_products_product_id_fk;
       public          gb_user    false    226    3016    229            �           2606    90588 ;   product_categories product_categories_parent_category_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_parent_category_id_fk FOREIGN KEY (parent_category_id) REFERENCES public.product_categories(id);
 e   ALTER TABLE ONLY public.product_categories DROP CONSTRAINT product_categories_parent_category_id_fk;
       public          gb_user    false    209    209    2988            �           2606    90578    products product_category_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_category_id_fk FOREIGN KEY (product_category_id) REFERENCES public.product_categories(id);
 I   ALTER TABLE ONLY public.products DROP CONSTRAINT product_category_id_fk;
       public          gb_user    false    229    209    2988            �           2606    98338 #   products product_manufacturer_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_manufacturer_id_fk FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturers(id);
 M   ALTER TABLE ONLY public.products DROP CONSTRAINT product_manufacturer_id_fk;
       public          gb_user    false    238    229    3030            �           2606    98353 +   product_photos product_photos_product_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_photos
    ADD CONSTRAINT product_photos_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);
 U   ALTER TABLE ONLY public.product_photos DROP CONSTRAINT product_photos_product_id_fk;
       public          gb_user    false    229    203    3016            �           2606    90615    reviews reviews_client_id_fk    FK CONSTRAINT        ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_client_id_fk FOREIGN KEY (client_id) REFERENCES public.clients(id);
 F   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_client_id_fk;
       public          gb_user    false    231    215    3002            �           2606    90610    reviews reviews_product_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);
 G   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_product_id_fk;
       public          gb_user    false    3016    229    231            �           2606    90630    reviews reviews_rating_id_fk    FK CONSTRAINT        ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_rating_id_fk FOREIGN KEY (rating_id) REFERENCES public.ratings(id);
 F   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_rating_id_fk;
       public          gb_user    false    231    225    3014            s   �  x�uX[r1�O��"@��9��Ȗ�K.=�͞~�)�*"�ht���װ�����]w__/o����p�O�DZ�G������i<�wX���|��_5�|:�8�C�k���!��������}{���2Q�o��e�y0 ����ǯ��ˊb
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
�:���[���&"�,㡮E��`N�#&��X�e�_CJX*��p�Y)R���6Z��8g��w�q.������@Ɛ�K�~N#E_t��B:��g�\-2��@�JKeU�S4.N}���7,�f ���i]�Q(���e���9�ùƺ�8��I����K��m�n�޽�?/ι�Ѯf�      y   �  x�uX[r1�O��"@��9��Ȗ�K.=�͞~�)�*"�ht���װ�����]w__/o����p�O�DZ�G������i<�wX���|��_5�|:�8�C�k���!��������}{���2Q�o��e�y0 ����ǯ��ˊb
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
�:���[���&"�,㡮E��`N�#&��X�e�_CJX*��p�Y)R���6Z��8g��w�q.������@Ɛ�K�~N#E_t��B:��g�\-2��@�JKeU�S4.N}���7,�f ���i]�Q(���e���9�ùƺ�8��I����K��m�n�޽�?/ι�Ѯf�         ,  x��Yq Qþ-0��;�R�8�E`[��p9� ���V3V��'{��s�c!,e�����56��V��������y�)O�䅷�����O~�S<�F��k��"I���V41�!V��)�|�G��HW:�o�72�R��&G9�*�<�QO�(S�*�BT�>B��Z�Ԩ�Z�R�:��mj�]�t��Nuҥ��~���Ы^���<�cLc�k�	M0�I�4Ŵ���f5˜�ا}�i�u���6�ɖ���6;���'w���t�3�q�s.t��.��׺�F7��g|�����9�?�SrW      �     x�5�ٵ-9C�q.Ͳ�H.�o�:���6���m>���-�����,-���o��\�k�w���M;6�
�#BZ���Q�ӟ�c~����bN{D8���m��?b<BrZ\L������T��}�j�,T���٢��OHI2UH"�
�޶���`�T�lLO�u����1����^� �y����"e�ۄ�e"J�^+z�N�.f�NQ�oXSytd�kw��J�.�����,�����L�E�7,���@p�I�#�ՙ�A�t(A�b��:�E�-F�:�@U�>��R+���""_PQxg�d�Zru�����ϯC9x^��<�U)[��ڏ*=ϡ�"�{��h�71��h�V��
������?��?q��R���?	�'���G�J��Z�!U��"C�LM�B T�����x4	Ȱ��IUcqZ��xᕒ�u�V y\)y���x,��?I��_�L��ti�,BmH�&� ����dS��Ws��!���i)ܒ9�A��ʁ�{"V�F�پ��a�G���_포}Z�N9�O��BR^@�#�xO��~�N��P�ZO��6
��XP��3K�L:�}��)�_���,�Dz���ja~��8O0R��IQFʦ �b	0�EK�t_�l��0P֚�Q����lH���%ݰ��@���� �^���M��xjTj�$�Bk{gZ��`�槉��
�ץ-Y���U�t��>铞}�5�|.u0?��KN��[k� T2�      {     x��X[r#7��B�M |�Y�#�Z�jmɥG�����hH�,o��i ��n�����c||���|���y8<<�_����c\tq`˴�iMq�4R]4<�\BO�}�������5*��h��#;#�9��f�r)�.�����)�l�V,#�(ɸ!sͦ���w��S	?m����u!�k4�٭��<�d� ��3��e�rH�";��NLd������އp��9l9��M�-*<����q�pw�Dj"�+���#Y���o�?�v�L���!�C�kF���!`>�ؿ�������ݯ�7���a�S��]�n��i1����ew.����\j���Bi��^>��]\Jui�veE�i�!|M��ۣ3�ӹ5GpB�]�]3��FFΆ��O�Yh�#J��@��QΣC�n�T[�{��è}��UaM�������n�Whp�����w���0���T��S�;dA��,q������\j���1�50�)��[�`)�=�K#�oC۩�]��<P+��yz$�M�i�K�)���4'ci�4���?�Z$��3�ţE�b�y�Χ�g��p��6=rݣ��UT�ɀ�P�=-v��ys<�C�?x���F2dw 5�ǜkw'��^B,��� ���\�κ?�=���L��tR�G%4�\h�ހ�I
���	�G�b@i��?7����Ǌ)��E����y{��-*�t� ��#~Fq�jW�T�9�8eN� ��T윾0nm��[Ƭ���<��e���`Th]1����Wa1�\_ww!�\e���
A�i��ݯ���e�y8_u _�C1~��T�F��ʦfZjt�q�&�AqF�m���px}�γOR�(�w��'�]k|�l��p]*e���k�p���c�@�wX��p9_��K���̒A��e���i'Ql9�݈+¶�ɳ��17��L��;)�b��|�?�7�����m�ɕ/�qxG����Y���HzP(xm��U����;�P���>a���e��*�9W<0+8�?L��V���BGAkuN������(��P�m��[��М0���I+\g,5�iAE|Ly���b���6C@'iW@:����L���Y��!�Ocl&�q��=�Ok4�Gq�)xoo�q��l4wE���Mv�c6@-���Y�OB[h� �u�p57jw��J���M\/󑍗!�շI�#dM�Z�W�^�5�օ{�v�+
Tۧ�VC|=��	�u���P|Yn��Zp�#W$�Dr�vQ�����\.��r�}g�tI���e��	*���f�&~��� MY����ǐR��b�R����s�4�}ӣ�T�/T���y�y0�ji�I�사�	��,�k�^*xQ�U��G� �t*TV��a��� ��J<s?Q!7�Lr�܁�b#�%ҧ��1��,�ST�`�bKx�|���W�f<� �7r��tz����gCz�|�ի��;�ρ(����?!v&r3Vv�\S��M�x���ei�TU�����~-��D���x�0�<4<T�Uo��Ⲭ�҃��A�~?�Y�y\P=��Hm㍀�/� ����&���~�	��_�8��1�\���.{se�n���'3�	�u����t9)��Q0��,ٻ��d2�����HaQc�O�_N�䛷RL�i����GL[����Ö����|OL�pHY�KmT�sqհ6�x���y�t�r�D��S;[��	����QJU�'�Й��<��x_�L�P�9��ިr��N�$Űf�{+-G�(�y#W�Ŗ[=e�_Z^��������S( E���e���Ԝ�17�&5��P�\��'emv��rTN$dC\�J�˺6I��#]��@�b��aH5��Gw3ԚN��:�V�,�BH�d5*�\Z��>m~w�`"�,�����~�$��V��q�zG�� �Q���&�Y��}�;$E���h�ѯ䭟uNK!n��c`�H�;t���ȽQJ/&j&�~!�`�C�ÄT�\�ń�����?#�M �}^�����r7���@�?�(s� ��p�U���5��5�Y�׃1�?��      }      x�mZ�r�8�}�B�dw��dI�=�q�ƾ@UpW,R͋4��ߓ HVul���, ��9'�̕�}��z`{	}Gƫ��e���?���b������\3Q
��Ư.v��J�q|���k|{��G���k)��K����&�C;N���p�=u���Mq�^��u�"��˛��J��U&7�B8���	sT^�²0�E}~���m�ϏM��C���F��r���9w7���N�L2#ا��g��CO�e�y�Ol�.|h�oo}�������V�\�K�+5�IJ~S�;^Q&s�}��6PRٻ���B�\�a��=N�M=��I@p�kU�2w����rS"��)�iV)��t>㨟�S;��q
�ǂ�|��U�[erdW�Р7��!��aZ��!��~j��%�9����Ǳ�Z�a����ip��T1U������]���,)�d�	�X��n��c���tqw�*�R:�T�J���{��{|�ք(�o6t��ƈ���
��r-y�^<eR�T���Ұ���O�S}J����ڢ	]�R���4ܾ���Kl�r���� [RR��)��h�eB��u�K/ �%=����9���m�8
�|n��ͪ�B?��&5�^C��7om�
&q,v�Gd�8��x��w���湵��y��F�\jW��K�˒������ř��{�a�@��{��>��F�png�]����J�� ��A���:�}é�ֳPO�v�!a�؟S=���hj�Gw{$xt�2n����kVb_���.mNr��k~u�Ё$��:��L���
T�ҹ4"7��5��Q��2t?�	J X���W"F�����>����"�8t��U��k�Eu#@fHE�q�P�/��ʏ�gr��l�P�}=N4��g}$��P�t�Dh���A��cHђ�{�f�a�t��d(�f��}V�w��t�S���Q��\�+�ěլ@��������%���sR�n:$bS�vĽ�����6�v@��������R��o)�"5
c1���M �Q���?�v[%�M$��@\άb�#
�0��p���a��?��V�A*����"�9�)���ְO���s�/q¡���u��S`��H�HV�-� ���ot	$�MQ�g��ʱgHs��M�!�ثxR�9�<T`�|����w�����J_BӼ���5��삮H�
� �{N~�}���Ĭ�H�2���H��P��b?@��Ǯ9�aś,���]�zo�L!ʩ8��^��"M��	�A8��P�J�`�הgI�����wID(	R�'EYn�c�4�����|�d!鐊Hs��@���B]���P%.2ᘂa����P���$�ţqW�R�\B�ԆM�;U�Ѫ��}hB�H�M3?�C����9��Ɖ�J4՚C�	�i�r/%��H���U�l5)l�[b��0i�%�j�N��C�f��H+��_~\$�z�E�E�h�>����BٝZ�ȬkPx81���<���O�Q�*�NM�g�'E������*h(V��CYf�>��G$����h�pʢ;� e �H$Y&-#>�8Nmk"��@�+��AT�MCֱ�o����%�+.)0��j�����5��h��M8�3�ai}�r���\���|P#F��/�J���/^e�7��MN�g��׺�r�X���Z��^��&��ȁ$�we)�]i)������m�y��������	��4�G�� 4\�?f����U�������p���}^�@ګ���L)��o�L: m�6����T`k��I���&_�-.���ˁ#�4��ۄK��� �<#�D��=�OD9�P�}�!�S�<�(-Y��6��έ�F��4|��"S�)�mx�o�'���#�V�/���$�����\TM�)��&�d��>w������a�-c�u$�xɯ�����s<#�&����b J��G���'���aD�d�uTc�&����F+$�3� ��ǩ;?�
�����*�~�V�fh7]U[X!#�;�i�yeI%�	<2Ӿ>L�X:�����l6�lk��ƭ���@�����0翏R����
���N����Q��V��3�� �ҐIT������[`i��_F������si�\cs�$`4�T��~�D\��4�-s�	j(4��Z������o+��m<{���p'�"�ڈdߑ���a��& �&vQ
�m���!F�r��ᒦ$Ҋ�xZK�� �rz+D�lp���!V8i=���O�~W~%����/Er+)���%��YEڽaJаK��d�_|²���PɭDg�n&
*�m����[c�f.�J�ʒ"�Y�d���{�R/9�����^NH�t���DF�T1�m��B���R��~�����\#M^�ʥq2/@�P��d��M��}��Y���@���ԷI�Q�JR0k7D�]�l��A>����u	=d�p��"���B�э�P$)�$�� !M6�m�������'�ˣ�Z�<��c/.]Ja�j3=��i:�I�ϑH�AH��!$5E\0Z�e[t1�8�C�f�>A�K=��tE1��q�VC	�,�ZZ>�8���щBT�X���Ict��94ſ�u��<��f�9)�fL�a��I�@���x[�(j�y81�"CEf?Cx6eY��9�dyQeh���ĭ���e�}�z����ǺVP�J[�t�N.l��o4��,�N�D�ʌ8O�OgVK������t���.�f\N��v�*�[Є����a���G��;R�=�o��΍\:�y�R:��a6+���o�!�>�1Ϻ�tl|�-Q���i?r��U���3J���WgXp��Ȍ��u�ٗ�>���bڸ�b}�|Z��j��"��!�jh6(�L#�C�y�<@3Ģ�^���$��,D(�#h���#�&�����P��q�P�-\�K.�be��
-w-��J���U�cfӾ]LjI�@�.�+)	.�i6uۖ��(���-h�봯q���ׯu�[����<u��&ӫA�Ζ�J�5�]���x��M��4T.c)����qsu��%�rx]�`��4.)Pm����'N^�T$u�-];<"S��#q?,(�-���?A:?�y�m�H�Y<X1��ԫ����P s�Ҥ���a�A��<���n��%8�C��WHK�+���9��!ҁN��+V%!��5�ҟ8/����܄��&�>�5������	�w�}9-�l�p+��1��DΫ���������u{�F��� ����Il@�%�fɨ�'2l�����e�O���� S���t���.e|I�'�q����XǠ?a������B��th+��C��x���U�,�k]R^=e5���]G��s�,�w���Q�|�$��:d$�"����9�W����=oºG�ȏ���Fӵ���H��(��N�&�]��<}���X�"�@���w��az
۫�����Y��`7���M/ ������ɟػ�T����>�ȼXe���Bᴕ��i�cUI�y��cȞƗ8����|ٴDU�aol�T�"�Em�Dܫ�ǝ])Xھc��������b 2֖��NS���F����nUć��`� =(��n[��dP�*�8���H1�e��=��>���U��6�S�-?�Oixr�OA���?N��I��vkB%n��i���q@�T���c�p��X��tp�%!�}@Ϊ�@k��jy��I�0�W�7�޸K����2ZQ�O��;x��B�E�	G���>N��sd�m��4l�Z�uzt0�)y𽿘�fe�&Ш{�VY����j��]5'Ka9=��5�+���ЮD���=��G��Zy?�$���6�⸑�o������f����\�� ��aw��x��q۽�o�qb�V�E]4��W��@�����\�#��kxa?��o[�(���մa��f�v,���sq�,�*�D��g��e�H��s�1!�<,������
��fU��%�]=�4S1�ᵆJ~���u�4qô��ܴp3�i���- �   	�9�h��qpê4~�I� <'������,�����~^b�Y��У�3jP��P��w�!�6L鐒�񩰱���E��%�E���`�0 eq�8����^�	Q������G2�l#�*�-�Ggj�o�zV�Y�-����������F7�/�x}����cRMFC����q�E��6�Y6�BgO���#'��:OCO�W�O�e������      �   �   x�5���0D��*h D¿���� �$
0!��Z�툱��̾��
��k��x��3�Nht/i�<*2R��q֑t�l�ȥ�GgB	m��QE�O�3����3��6:g>>�2��\�+�.ed�EA<���g:�Ԍ��Lv��Q$]*�_�ȿ��vt�$i��*ly������*���S��      �   �   x�U�Mn�0���)��f�����@X�+�JݵW�� \��F'lX�3�޼���\qƀ��#�'nJ_�Ƴ�['+Α���W͂|bĽB�q�X��,)'���O/�q£��;b�@�h��e��u7���q$N9��'��*�`�+�����,]N�M�ح�!I���Tz�ʾ�Ӭ�冰cO^f�`��Y=�M�*��P�����49�����0��*      �   -  x��ɑEA��V0S�r���1 e,�d߇��-�J״�]���t�}:�L�a�=,���v��6���F��j;���pӾ<���S3xioM�I|5��ƉOc�i>����P/��!J�D��u���N~j#M���:2T�i��,U��*rTI�*�S9���2�G��P.�ʇ��M���Q&�ʠN���4ڔ튣C�t*�.�c܊�G��*�>�3��S|�ˏ	�2)��ʹ�	y2+���~rcM��.;6d˦lؒ5۲bG��,ؓ9�Ɍ�7
{z�g�{��ǉ{U��-��&��?��W      �   x  x�UUIr!]�]:%"�w��ϑ��ةʦ�o��������4�5�L��bģ��|R�e
w�Q���I-˿����$Eo	a�VtE	4���������4!���iŜ�t����Fk�y�D{���/�Q��fG"���}�X	^,(�J�$4W�Q��FQ�2+,1iب�2�8��L_�Ԣ���a��C�x��>9
��A#�Fw�Q O�JRd]l���;�_�P��?/鍀��u��x��Aۥ!�86���O-�����R�;)��1)�������E?�Q7)��2��p���{��3�{�(�9)T �<������ǒ�ƕ�ˬ�ct��v��݀��b;������=v�4��3-����/�>\��N�h���}�?<e�$�-5�R{� 8���-X߃��͞R6�]V|��� ?�k9��f/m�d�FB:_�t�S�{I�TG��=��K�ʶ�6n0�n��آ�k8u.�Q�Κ*3/.v�Sh��|���
�>��m�+A�U�LF�}quM�A.�~�/ؗ��K�yM����-XL��Kv�S�|�n�(셆��pe~z-zW�2aygM.`�y���rp�S!H���y�̈c�|_@��Y��"�E��      �   �  x�]WM�\E<w�����n�?�m�8q��eB��f'J  ~=e�~�o���8��\U�Px�t���(�81_]�^�lB���#�B�#�^�.�6���GH��:B���%�-�9Jx����1(:Ց{�Q�������i6�W�K·l%�x���5Y)�	6�XÛ�OO�����)�$5��-T�;�+��rI�	>5��?�<hW��I��������H�J������^nϏ�2OĈ/I71�������?�}��yG��T����Tx�hJWj�MЗF|72��B����شm�"�����aA�j���ɖiK=ҁ/F}� �t�TG��O�0i�PC7� O1�L64uC��t�ЊNR&�"6LN��߾ܿ���X3U	�WْF�QNC�P��1~�-I��f*�x0�ndD",�����lJP�H�dZ"��R�����8[�  ҿ�}|����ё�Y�I�U�šȎ�G��V�\uF�:!���=�8Eh��2��C id�������Z��K�H�q��9"���f� )g
�<�{|~��k�e�D.5 ��-��6ĵrңT�\�o�]s9t� �x�b=��%Xi�R���M�4:��A8��Jh��aL{?j6V�p o8���L\��|S�a��z��|B��x�`�Ѳ�e+&�TN]�p�%��n�d(/��<B��*���uV�]�Ŧ%OIh}N���HT���D��e��MA��\i����з}P��h�-f%,��쥮TjX.W6Mbn�q�Ҏ��$זU����\}�xOk�$q��5���sYMec�� b3iAW#-����6���l��`mը�qc$'�� R�ɩ��V�	H4d
II��x\�sɾ�0�S����{(e1W���ް�u�G��}���\-F�mHm�+ ����:� ��϶���.`[)��K8�ūd1ׅ�Y����^W'A�͟"�1H�M�3Q���|���|	D���5���'8�l��xtu�&��X�����l�LVR]4��9�M�*�|�b9���f��F��v!�]�$�����ҏU��0i��Ϗ���
(=Űن���:��IO{|  �@����k�T�;\@�	�Ng��(l�c0UV�p�Ar���A=L�hB�'8g�AL�1*A^v#b]H�����w�6��R��#h�H����u ��m�M�Bx&�
2�l\Q�)tV�Y
:�e��٬��ZP`���(mx�u2G������I�����NKd[ǖw�ml�f�.�hfl���|�#�d���@4@����)��'�9�u�T#�2JK��!�M[^��~�G�b�W����8��* �����A|��ڙ���q��D��Ȫ�3b�՜mS�5 ��ٽ{n��ý�-�yv�_�. (��:�u�ru�-~w��ɽ��:u�s����u{9ő�va�v!e�w����$]?���=l��
��{	j��橊��|��_�ٶ��d���kN2Nv���w1�� �Ei      u     x�mXK�%7[W���W�d˟:DN0�?GHIv� �v�Iɩv�u����E��W�G�����O�W�d�[���ߟ�.Q�u��W�S���Bt��Ո��U�{%X����)��Q�K�-�rL�g	0N.��c[{TV|z�C��W-�T�'˷������,���*�Z�%�sS��u��}Jd-���w�U�뭣���|��)ɇ	�֦c|k����X�p��O^��r�+�C�O������`AQ�X/wӹӧ����{�'XǝU�������8�ez ����������q��rW�w�s�v���<JV�u�����*���䍯4�
��+�G/o��vǍ�$���>�U�����={Xp8;~���L�ũ���T���:z�[p7�E���f�Q+<�Z���h��(:��*�$���P����m:�[(�V�lh���qp�J�t��,0�`�_�+��M;�8X+��V-w|XPu���{x]F��_�2����W���=������&����:X�|�E߆#<�>�/��g��Ӽ�8�M�%))����>�� |���������J.�F	BhEo"S�k�z�|�?HH~k��W�GO[i.S�M4zR=Q^�"?К�g#`ڸ��3�����|*~,^�\����n��šZ��aU���9�_Y�n��"n��^�O���4k��	�l2�R����(�蚡��	�>��C-J���Wt�^=E�V��r;�{��9U�M$\@G�1����d
�/�z-B���|I���dӌ�H*3(�jr$P���I6@;��B��V[�˹�L��*��q5a��^�����Q"�3���8��7��ۂ��Ai��9�=�...�ܞ�^�>��m��ϝ���<4on�Hw���+?�13�]�:s�~ar��i�Fh�k����+���3��=c̜(F؉��@y�O~K)��CY��2�+LT�Ų���p5`���/��1��C�s�`�F=b��"a��5Cd��%2�Q�-uV�V@��i����U��g ��'�5�[�x���Tb]хc���Š�hn���꾢ԣ\�u֕�A������������Ss�X�!a��Зr�O�5+��$ �T���#N5a"�^��+p��/y�Z!o��[�kT/`��ޒ��,7�L$�1�:u%�|�����&@ Wt`G7���:2�z�Vl9q�k�_
p�f�؞�������١3��4��Z���Y��S�f̌��E��V�]|]�>���܋����W��2ԝ2E���ų���p���ګ����0i�\�Ɩ]��A�g�{�)�'͵k\��ב�
c��D�6"��:�g�l��D3�R_��H��L��N�z/@����s�ث>* �0�$������d�\���X�i*��/}ӷ랢�D�wHj���U���QT�1%���.���~�!}87����F�wD�W��S�V2�������̽g���R�O>��Q��6./�sW���Lc5<0c�.?|Gb��R+\�V�1�2�(*�Jٻ�dÑ��uqER�qrK�#�l�|�l�E7��.���AK�<b��y�>�	{�.\�c��������f~'h���8m����4d�d��q�w�k?:|��b�+#q͹�i�,3��Bn,��������I���4_>��g�,[Er]�K�|���3�B�ޙO%�u�%v�|��8��'�@�����c\�L���l�^��/�1f>ay���wXρy��KV� Y�;���$�.kgԟ����?ť�      �     x�-�mrn!��b���{����'�δ�W=@H{�]��ߖӎ��n۲�϶�u���7�i�݌��-�汞��Jd��&��y��6x��҉A"~ھ��i���3[~6}������q��K�^!�"l8�������,@�G��(@l��q�u ���uAީ�I�>�$�-��I�3D (I&�g�S4��s�ҍK��� ���7勃lE��^�h�����bo[�w�_!M�x�(�.R<�����"g�P�\�x_��PM�1ZZ��t)�]����8��#�oA�"�Wa��T�d⼕�D��侺�j	�$�Q� ?E���p�u]��.��b�>_�O!(Y�z�����a[�=�;���J8��.��T���}&��Svs$$IAR3%�f%T{E *띤��D<bHFy]C�'Y*��D��V��Q��Kg)��Qru�]�-�ʔ�LY��(�{Q��j�YV~l	��(*�$���򦙕��Lr6�]:�E�khr��@�Gif��w�r���%���S2bj�z* 4e��񦌋�2��8�,!]sH
|N9.0X/��BfӣT�(C��G:�� �6<�Q ��y�a��<��,��W��QN }�[D�ϨA_Cí��	�-��o��oK�#�@�>������캜i�7�M\"������'{����)�����U�O/~ߊ۲dמ�8�k�~�ҧ��Vk}ԣ|x4�L�pC�B���������9ߠ��|�\�������      �   �   x�e���0�s2E��@��0L��CUQ)@
+|oD�+��_���#��v�bWd'$I"S�.i�{q���>���3�m�s{��"�{ݲ��]F	�b�3�Z?ꕦ%R���������N�      �   l	  x�MX�n��]W}wYqP�w�����qbdCu��9�H�ݴ"���g$���b�]���s����\o�{�F2�W�]��ǏMj���J�B��RV
?�+f���=oo{ƔQT�s�*��t���9-�)�A��uݭ�׻/5��=�F,U,��p�	�0��<���9q��-�,D�����}7Ex����*�2��JTFT�qǴ6�����<��<W�S�Ф�]�_��&\)M!b�|%5��9�e鍵�]6m����}���"K)�z!D��2��`dd/�e�oq��ǎP��#�*!yd�����ꤛ�(B!}�be#ǅ��Z����e��_�7<��8ťdJ�`#�nc������$!"M�
J�NZ jl��e�T,���j�w����t?����[ͥf�k��l�uw;���ׇ^��q����a��P���)e�i@vb���I�2�K˼��]�˶G��~&�>�M8f����O���~�T�'QC����	N(�.�������lri$n�}E��b������uG ��Z�>8�=�l�sQ)p�Y�{ơQ`)���C�!|`W��s٦���1̓�+�s�dQ�}5��~ܠ��y�@�2t5|�/ٳ��V��?�j�0)Hw�,��C!<[z�~���=����t��E$d]�����sWK����2��+C7�n�myU�=��(!���V����aho�b���z=V� �r$f�3t�.���Ш�b:Sh��B���������nK΂D�����"�^��f�~��X�PHpѩ�V�r-�����:�J�2��GJ\��"�������5�N2'�*�>��
8�r��a�M�8F�Ua��6l�T���bp�´pl�縈J@hW��tuqݏ�5ٙ���&h���s���a�l3�棅�a�G��d���qQ7@͞�<�4��#=(�lH�	8��R�VBb�bF��e�M���|��ą��K�
#֎kأ0���E[?�t�����r��,QP��u�C��H �H��> �V�o�b�y�R����{#�
w�Ðv_�ĉ%�b:s�rC�#R�uj6۲���C�&�I�:S͂��JS�D̲˶���òx�ږ��O#L��R� (uP��Y�t:詎���H�pǜQ��|�U�D>�AP������bԢ4�9����vܐ��F5�؆���!�����\��3�-Ő#�X��[���w�b���DOn)U�V�(�&g�[R
έJK|�G�C�.��/0��xv��'�>P�j���M�8��m�i��4|�~=��a���G�����ῐ����m��~G��r5��f�S��h0����Tt���&��Q�	Q����>�tޑ.��ТYRTϞ!)RW��ϩ[PZa�4cX5�BKn=�������1u�͜��~�)��xU�pBe}ҝ8�6:��:���ͪ{,�ݿ7�U�"j����EF�EFs�f����JMqQ/G��NB�)<�Nb̡�� QhN� ����FƠ�+m��𪹟��̬WtG�q�����m1��u0��M�K��B�l�G�m�߫��*�_A�b�<��9Swŏ��:Ѷc���(j���`ޯ���7��?Ԃ<�a@�	w���g��1���1Nv?L��h'r�Fp?ҥ��ڐ]���*Ʀ��������yȑ�*�O�I^��Nd@?�Ӛ����!o�=���P��t���ma�#��p� �)V"���]�L'��f+R�&R�A�vY�8c7�8�2�8��.F�(b�T��f�䨋���da&B���8�-�B��q����{l��}C�b�#`��4��1��&���{z���1۾ s��_ip�M��$
�Q�w �8�aT�G'	h���c?�ݛ�SC��~�'+����O�K��k�.�+�h<�ͫ��PvB�5Zm6��:ٕ���yE������$` ��}��$	����%3p�í�(#&��6�X���(�45���@�������+n��Uiv`M/c(�ὑ6�s��l���ۄAx�IG�q5>=A�C}��r���I#nA	��8<=g�Q��,� b*ZgB �r��?���v���>�8�C$;WP�E�c��4`�a�&�,�d8�Y� �_��;_�>��qx'�fx�Q��&lܼ�Ѳ$mTL#���V���	3;a&�;���1��Է�~�������Q~kC6GEp� �}�Dz�z}��^�H�������5��9�#�u]V�d�jKG��M&L~�����pZ���!2���x.��)E�s �I<j:1_>2P�b#A���a��R���vU~2�@Z��;����24��4.'��$�?}�9�?���      w     x��Wmn\E�=s������wC G�ď��8@��ıs��Q��^��~H��H�z����{č?��x7��<���ǥӠ�q�J�ڤ����o�f�|s6����I]K[I�b�aW��n����p�b�������$O��]�>��'"}��ւX�b�)�K��c���d�b������K�<C�;��Z�
Wj�Rr5���/�b\o����͏+��b�����ࢫ�4d��Z�%!����n����	������:�����$�b���G�,��q���%�zm-���B��W*ST6@��~���������ݼ�o�۔�����*ԎcNq(.�%�52�TXK/iIN3
�	=�S��u/���,KI�Po��G7��tX+�b5�*JA�_������X<\i^�ԗ�sd~3�Zֹon�pWs[��;d�� }Q��&�:+ƭ ��F���F�b����+��]1��&��xq��)v�ģ��+�$nv��HR,נa�&:�߷����q�R��+�k:��N"P�:q���`8Z��7'�����;���m��Z�YIt	P��m�)L	��X��H�C`�#!̕T^�#e܊��(�v\� e��jJ>��,�+kvM�RpU}d�H�]�䷛[�� F���cq���|HX%�@�MG�@w5��BwZ}�OSy� �ш6E�Q�C;T�}�2�7]|��9tB�Fp��ض�xo��=�؆�l��̜���3O�hN�m��Z&���=Јb6�!�A���A�|҃���̶P!����(�;^��.7���l7+I�۵�S>��DL-�Me�R=�u�c3�b��xS=֌�!�2U��#>=5�lJEj��N}��V�;�6`�@���C��f��i�C�g9ʏ�˅s������/�҃�b�{�r��6�� Q�9�p�n=�!V^HHcG�����rj( �lm7��X��:
7�Na�sF� �x�RH� �	gl��	W7�1b�pp!b����ɕ�^��C���k�@m�1��>V��~�)G��	��J^�zd'4�:���SH�Q��� BA���5̸�7dv�3��K퓩���u���֓/G]r�b��Ǵ�7`)(}�z5{+3JdM=9��@�ť�+�
q?�Ϡ�����V�CEn�UOa)$�WW�������İW����мc
(��{묶(�r��F��a%�k^e������wn��t���#�	���H�å�1l��L�)j�Oy8��`�À�����D������&�x�8}��ţ�7]d��>���D}��-l^2H���#]��@)���BZ�+��9g������%�_�|��$�]�� n�ʞ{�=FA_�K�\�Q]�ڙ;º;���[�_���`[o��R|�����i�q����S���ۗ�R�]NxL4��M%��'Ng0�G(�^e=.Y�:���eT+!�6��^�������E�����Y��,�Ѽ'�G-�����0��f�������3Il��Q���>!�;��ǠIǣ:,]xfat�ƶ����� ��;;      q   H  x�uX[r��W�8@����8��q�$N�q��Y�iP){��|&��|��z�v��ק׷����%�D��o���uC40���h���?�����������������c�,J�>n)o�8x��w\b/�s�]oχ{�<t�Du
�-��Ч�SG꤆��N�ƨ�s'!���B�i�$:�����!�
1�9��7�>���.��oO4��]:%�Z�7Ȋ�@}�Ś����z=��v/���������X�i��v�ƞ~>�o���ˎ�j�a��-�=o5��(���?4�u� �<E�-ch�L�wQ�{��,Q�����9q+$6̃�A�uT�}��\����G�>^;�.cZ�9أZF�X^�hQcKI�����Ay��cv�k���-=\��]e4u'Q����9�9�����}�/�(��Z���h;
{�\_����6��M�Yk�"���n�Q��bC[�P?0��K���?��L��$���.p��p���<���N�0�>��VC�F{N�y��:L莞SE7b���r���7�>��R��N[N��GcP���y8v�YrE��*ї�t��=�>�n�BA8�)ۄ�KC���������O1K�Qq\����z�8\�T�0w�a�d��!�c�������z�?���s��#����Jt0���q���6/rT�$
Q?"���6�Z��ߐ@8&��|�:˹G>���xr�t6:O���/�{����"�\W
l����x�R�<?0��֨�|��ζw�C�񘟃���1�D���R詭��ʎp!p��Z�\�3����Χ���ug����9K�\���w���pVeI�����H�J���������@��o�7���hW���������W� �J�@S�@�U�5�_���?���&)��@3�}pү��sR���.��G��T^�d�F
s�#-U�C���I��	O����`o&�7�ůbb�v��tI��	�ONd��' �,���M���	�'a�4G�azYL8b���4�Ӡp>������'���邡`�-!'MO���H4�6�J��a3f�.���&�X������Ig�S6��4���)=���RY�-%# �Z��/�j�U�SL)�T#aD��G�J��XGr��TPx 5UWy���4��ߓ�M�q9�f�������VS�i�p��Hy"�熗�[��jX#����v5�����02d�<�6�����ω�kx���N��N�V��j������|��vT+pyuHl�lRU�	/�*;Վ�q���Z��y s:ܻ�n?�gC�X��
�BN}
�)F��	��qY=#B\=Jp�Ӣe�!�z�bYĄ�~>4¸7�ǹ�s0�b�0%*�fn85���6���q�н���E�s ��T&`Ņ�����u5��3S�@�.����L"�k���n�]x���� *�R&�X�`��%4g�,��z���j��۽�i��X!��r�P��X5*����a�w�04�T�M���d�Y���f^Й�p�iT�F H��偃1�Bln'8ТE�M�hY��Ey��y�P������MY���N�j�ubR���IKl`�n#�)�TW�O�\c���i-�(�V��(��n}�b^0��(�K��L�@�vF�K[[E�tF��;N�]Z��Ud!)�����[�.U!ZŢ���0�1��e��1��3�o��]���(����������|��t�$]%��&mYga#�?ۛ���LէI�]��ѻu���5����D��͢��`�hsI��YRm�����&O�]D��ۯ���⩒6}2��Lq����ngQ��pą�ٶ�;��mg�M���X%�D�9r�W�w��e�l�ǹ|N	.��:g2#�u�r�1�b,3�,k<8}P��W�q���jԚ�KcTN9PE�}!��q6���j;�~�HE�}9GL]�k%����P�:!��4����PS,f3���ٮ7l
#��/*�M��.F5���I��ڳc�Qw�!���壊_��y����c����SZ*�Ŝ�m�7���}Ha3�V��E�m~�.�|s�q�J��<�4����=9�����      �      x��]�n$�q}�����f���o�l�mA��z�KM�v��f7�/�M�2 2�G��ɀ_V7x�+����?��[qȹ�K�rV�h5$�ٕ�'Ή���5�s�N)i�n��/N��>=}��G���?8}܌��py���g߿6���/ڿ폻q��G���}>��}9�v��v��ph��M��77��q5>9���'#^�l\������^�ð��8�|�x~���pqyܷ�z�_l7ê��CO_�����w����q�j/�y��l7�q.�k�k�4�q���x9�W��i^L��4����N��N�u���3K!f��!��^�u��/D&:�������Ӌ�o^���_�������sX�s|����Ox�����ʪ6�g��/���]�|<������������|�>Y��s�	��������oW#���[��%6��o�\�O������w,��E����~5��0�9m�sA����v������E�w�6��w0ָ^���\l����_Fx@~�b�9��c\�����x�C�-l���p��[��a���]O�:`i��a7��a߮ǧ�,�:��/��6A����i�̙p�얝^vv�)e�3!;��3ߴ���/�//�c�a?~��ؿOi��h��v�V�f�Mܤ��!�v�ow�x=>v[26��{P]zO^�i���fM�q�-L�ߞ�0�▖�>�P�����'��m�h�Y`ay��L���K�J�`�8�h�0A!�O�zz?�k��<����W���ӌ�kO�BXr �ȧ�#zcvς;��ہǋ��W/j�Ԏ,ׅ�'��3i�a�\�03M����x��W���5±�v��;rf�!b�>��?�:��ݑ�,s�#���V<oϷ��n������V *2������q�V3��n���[�[�M�K�,��m�k���m'�M�%\�q��OFB���토��::J��^vI85d�.x���C����A�?>=`�u�=�K�[��񜑎lю�{�iu�a�0Ҟ�p}�(	�_���|$x܏�m��Y�-��e�9�� Z. |���h7�(D"���X��$E �%}ط����V�D����B,�\*7s���������Ls��sx����oO�F���o(C��~�����~@;����ث����)��������ȹ:���$gzr��v�8��f��#�\5��W��d/��������6�i���������XѺCuN��w^��ģ>�Aa�9���t�8Vȓ������ ��E㊥E ?z���oH�Zi�%҂�?K�� �y�w�3f���{2l�~��:cܵD}��6��g��*q���l���!�������3�[�D��g%OS�M��ҟsx3��տ�a���H
�|w|�_$�f(J�=���VO�9>�-�ޥ)�a�T7q�Lc:a���쯯���Μ���nd4�l��]�߾$���ju��c/R��HB+�gJD�5:h����D��Y0��S�AD���X�Pa��-�_?`���Hhg�v�C���-��3��9��6	����~�o�*oa�F)b�d�p_f
�~����
H�P��9���yf��9C��T|t$G����{� ��7��F;��w�x����	���X����A������R ǥ�L릜�"fV`=�0�\�ᰃ�!w��� zDl�9����V�N��7�%�.�{Xz@�>�0���~�Y���#���9�S�*.��D&�}�	8aCN��{��y#V$��؝��-|��y��8`oo(�YUp;��n˥3���B(ﬣ�j���J������]ݜM9���CЁY�EJ6�yq�@}p�_@�nm�F.��e���w�3�3{���Ex}��3<�a׷W�K#5�Qȅ�MG�D���An/\����������_�~�LY��I���9��(���?~�<���h�4k<W�z��V"��23d�.�ڸ��kdvޯ�<0&3���l���|���+i��`{ϒ���|���� %��%˙3�Z��
, H�5E�ΊN�D*���lA���҃���!��a��@����q�����Ҳ�q�X-�dG�JuK��dG0 ���A{�$8��T����rxgp��"��ix�VR���2Ez9g�\]6��y��t�-�~�9��#�&��;�T�Ȑ��F�F6�n��������Wؖ�3�I�]�|��o^��8�˜O6��Vͬ�W4��Xe�ȥ(L?e��E�:(�-!`�ǚ����Px9�Aڕ+��l[~�ŉ.�������� �Np��Lͅ���5f&��5I����=o��߶<��-��c$?�.ū�[C>��$�d�� ��e
s�%�	�)
M�{w���L�+��@��~�N��ӢwC"�#�w3d�`��$ 8>x��ƻBF*3�՚�{����"YE�8��/�l�B(PH�z��ò_� N
��$�Ha'Y�XʾR�$���m�r�	'@֮��D�(�'���f+K�����p%,��IA�"1�0���|�&���H�L���zHZ ǁ�3���Լ'�B5�݀�Q!���3����K)���1�ǌ�λ���0�Ӕ�Sk�*m)���a'�B�S�K�7�ɰ� 
9��C����v$�ϓ�s��d�CUځ�#�<p�b�Ҟ�ߋ�n�B�zޓ�bV��&(����r��C<�F����|޺�wC����Dm����D�� �PXD]u�[�l���ػ��D�\��cI� �(�hئ ������朵i��.�;�-[�	յ���B�$�nS��)g5|�:4q&f�>�hB�̨(ī;���Ǡ�<�)���:f��L
ū�w��b�wa�	��U��:��n��a&=7�!�����7����A��IY���E��
CE�g2�j��tXvs��˟��I{����O��<@�RnrAD�JO�yܒr�>�ƃrJ'� ��!\oYħlw@r>&PI�n�>.�Cѯ5X�R������BR9��N�i�L,֔2B�M^�a��N��w^[2�ݚ��5�^���bʵ�EU��ηR-�^j� �	��/�*I��e���7Zi4BսI�ee?O�T"8SΟ�R�G�<�	�B���$U���?n��.E����:t�e�������o� ~���?��_���M|Ƭ��{jq���,��;3G��?�4��W�)3���b��ٔLJ����j��V�Ȩ�ع�cI�I﬿2�)���F��G���~�\R���[��:#���mƾ�L\�:R�)%~]�BE\	VD2�
���A;"�"�A�^7�uo=���\�o���:����*{�j�Iu*�P��Kc�����X���7��6�E)B
�5`���L��4�t��p��Y��Z͢��e�i"a���Rk���qހ��OtGƻ1�s�H4�J�2���œDO+6U�D}x���G�I�\�����e�-�V�ȅ� B{�����u�㨪���ZP!�Q�f�g#HS����>1�Nq��jc:�n$�<g8�ٛ���i���ڜp�����--�D)[0��I	�M3�xx��˩4R��x��ǤH�B�K=�\%�a,)::VP�����ӫz9dr9�f�XE���c��K������O��͒[�%���χݮ�v��O�Lv�{�\���!��D
�T�j����+��$7� 3��"�)�:'�����e􇇝��}���>�!C�Qql N�[�L[��WV�� �|��?$*0䉷I8�,�Z)^���Ε"x��ظN��+i_X��6<��~��;k������L���������X��W�U,���$Vj�u3R4,b%D�R\+��G'^�#�?��,���^�(�q�6�V[b%=�Ԩ�t��˹��Yů�7��p*����3����'�;i~�6�8�bD��M-K
�J�0Rig�7v��e��c�)9İ�'�^z\Nn�tuyN5��|������(�m������4�Y�� �  ^�4U��`r ��t���@��L�?�s�T���1��Vk����\�02M���(D�1xH�.��MK�VR#aϢ��\����HJ�ԦiNSDq�#��;#�R	�F����0�T�\r���^K���q�eZP���8) �����*��i�v*O���4.@�e��>i�c�C�A���lj1P�h��E��B����[躯�|,<C��NY�Ρ���h��h2��B��~��<���\���G���\jKekd�Ωx̓]O�)O�j�Y�jm��l���oi 'ӣ��L��UJ�c�4��k�Ou� 7T�6���Q�?���x���g1���a�C��<�9�S�ş���PJ��Jd{��9�CN4�6������3����6F�4��l^F�#+�zs-�/1�c�E8%M��t���N�	�x�\rJe�y�:��%3�#�&�g�X��`$I�F�ҍ�N�k�R����M��m���*KW8�z�֧��	I_�9c>��Z%=�_�Ʒ�A�R�I�H蓾}��&�y&4Bm�.哲�L��F���a�<�
b�(�r�%��_��{ <��4���Є���5�F+C�ei�^��B��ѱ����PGSI�վ2r	���.̨V@�bi]���+��L�kWISsj�d�Kt4��O	F�H�v�SA	I�<|��l�@����RSi�|�G�B��7R�t֋Jޡ	��9�N:>f�Z17��ZcM��T��� V�rC�d:#����� ��9��+ܭ�2�(�Sٴ��"#�g�_!��;{�\����	/&���t�F���c�V�-X�jr���7��#���]_�vd��EZ��b��D��CP�P���p!�Ө�O3��@˄���]�e��%�c����EI��
�g�i�h�p»��3�u��Q��7�O�˅��S�N�Q�mf��y���t��J.���q��m��"����`P����a4ON^ə��P�5����½2 �.�M�J]���G��U�����!��4�K�>�҄�E��,Y���7�Pv�xZ&��6�XV�G���S�����)���éB�Z.������W��`i��fz��c؍1tb[Ҹ���N˧uh�w�;��Z*����W��1�#_������5���#_�ΐ)��X�SF�N��W@'%�`���2�$�$2��@���PG��GG�Լv4��֤�R9]��<�5s�����~��Y����uA�`ס�"V$�ߘd���G��XS��r>�v�ʥR���c��MpƸוKkS��0ɯ���C��M%�\z����Y:�"���A2fF�'�T�VA8��7���I�k#dt��%4��$�K#R�"�u�T��`L
Z���|�I}f5��ٗx�@	&r��gj�����8� ~u�/�"&=���DW��!"�.r��P����o�>	)�H<��#?�&Ez}C�<�P
l,.��Dl)�8(�م������C�3g�1� ���Up~r������ەި�@\�<�q�q�	!ŷ: �y��Ap3'�{#|=&f��Ê�/`�fB�	G��K� �{Y����7�D��Z����|.:����4�Kօ^�<P�z*O�bNe�" ��K&r2��4��M'#�޹	��t�ET�I�oѬ���=��k:��ow���P�a�E?� ��׹4t�>��+��L�FPW�F���R��x���}��%���px�J��rr��an���f%dw#��#1�v��=O����(���[��aŒZ"3×4qi���[/���Y��5��H��85<��~
�-
�qE�܅K)�5|��N�����	\�M'�&�&�wIeE�'eY���;S�>��jb(c=�L"�i���������#�^*Hр�
�Q\��}>�ͧ���]N��ɗ��(U7�*̈Y���fr�ut��4�@�w�&��:�L�0�{b����|Y��ZG~͕_홹GY蜨�F�4� ���	���3}��d,^霱�^���ڻ�K�$�g�=�!B�P�Cn�m�Cv՜�>��FKĊ굲b�T.L��|�N��l��1�O��H9G��ؙ�S|� �R�84�U�[]~��jB�+~�2@�J���b�;���Q)ģȓ{���d�X�-M;*@C��P�@���C�oA�ಁ������J7A��ɪ��|r\j2q�ۼ�o�=�I�J���h��7T�qIy�(��_��LYT-��Y�O�dܒ��H���n3�K����֭�~�T��y?�A��x��J�s7�S9_;�A7��tV�Vqf8�q���*�Y/�z�Ֆ����bN£~|�S�2�yoΑ�!�|S�T%���Ǩ2�������Sb��g,���4
��P����Hfh���b|��<���i)�n�"��ި i�nq�pw*)�w
 ���P���_
=����ڨN��}����zD;ҰOܡzgM�1uZ*���w,����N�ti�=Et�y� ��2�!�X�]��|%��z0w��ٱSl�o�1Rr�>�/���L��
�o�P��n�4+A�]���s�P��Rv�|?�Ё���������xfHΈ�؆�gt��Z�[8}���+^�lD���&� �Ժs3�+�aT8��<*�Ɯ�^\����E��<Ke�I�f�l��9�Y��L�Yj�	�����-��ǂ��c����2!��5-����;��Ӭ_�?����x>(ϵ�?����̌�^���R��nc��-���O��u2��>|�[��1�h�'9~-���7��-���$�{�����.^
��#�׎W����;w�������t����A��*�JҔ�qd�_D4|���O�/���An�f<���ސ��k�C��r��)æK)z"�I�s���iF�!�$�han�s{�ou��]��n��akɷ�*R$�[�f��_|�      �   ]   x����	�@E��b�n,�#��4saqjxӑ�6`���S��Ŧ�3�ĩ�N0ߚ����N��̿�T8�X�K�l{0��{�x�_\S,      �      x��\�n��}f}?��/�6�I��A� y��M�z�p���=w�bۃ�-��8�a�z!��r�K1��:��(O��&�o�.N�]��"ʣ.�a�r�����z<���ez�$~����?�?��/w�i�$>��H�ݽ���~<�}|��c�/�y�/òS<��|�p����k���k��?�xNt��a�q=���p��2ݍ����x�ν����+В���{Z�<���=]c�w�}�����<��xޏ���`]��/��0���sO�yYO�����e�����w�q=�<*��mU|�M��i�K�]QFY��+~�~�%�t��M���r�LX=}n[]��q���@+�M��e���w�z?������D��w$�#�y&�O�)^��VER2uн���\��0�^����x��������=�j����m���֬_����~��а&�iw�H.���� �ù_��$>��P�_xq��L?�]�3M�����?�${2��vu늈L�Rɖ7y�Ů�w9�E����}�R�,6�f�R��i�������פ�[S�L�g)� ΃�8��a^�CO?3,H����������b��ǽ������S�,Z��~��n��M��Z�v���n�<N�]��҂�I%oRO�~��-`��V��ѮX*S���m����i;	&^Ț�1�/��BB"m��Iݬv�}��{9�w����L.��{�D��r����%��|모M�����d�M��Y���]�De�1�����:�a9�4�@Vl��e���y8$���|��	����B@��n�.�y'���)���?��X�!T�O��DzP��'!�jr�f2�$���h��ak_}��{�s��.!!o��Sv�,^L��q��<��-��]���@�w! �ha��s���|�T������#���^"�@$WR��L�{�+L��M�}������G��dgs��O������`Г{Л$T��~z�ыB ٌ��*��1@��I�k�����B~�W1����6'����3��S��.1�m�G)VQ�	!�"�sdP�L��'���9p�7�����ߑ	���@DL�B���y�xd�%�#���Mbx�D���+�!�#?cÛ �&$���XDU;N4� �:�c�*ݎ�@�U�4�e)y-+)���;��	� )UW��Nt�@y8'���>0�d�#y3�ʹ�裭�zZ�)(����7Q-��kk	��MCo� ���8�������rG�V��i���˨�P�p�)�хeF�4���b ��I�o��z�d ���,�:G����o����U9l^�nPk5���%�G� ��`tO�/�=Ӥ2��z��aI���Xg�(B�y��H�..ˣ���F��j�Ԣ�U%-5�C��B≅��H�'*0��cB�@/=�`��~�P��sL�M�z:���~��N�U�Į.�s|�Op+C�U���[-��"��s1��;�� J����eE��Q��B	��6�w���CF\VFU��j�<�:˖�+~H� ȟ��;_�����N�@��~\��b� 4�"
̈%�Ck��s3PS�������B��8��=�rR���Wr%ǜ-�Uz��`�y#���p�e5b^f���ɋ8# �w�}�dQ�IB�y���O;�NUl	F�,��)`t��g�p�U�f�!���bH��O#k��KHV	�����������7��͇S~EyX�&Ʋ��`B����"5�<��]�����O��_ڬ�6%�Ã�L�0�G�Q���N�y�Dɾ��^Q���
֩����7]I�m�B��7m�e-��B�yd��q���9�iL���#�!�\�`���$}Ƴ��z%z\���/~�yK���|f��`9Q�w1��ʌ���kE#�n����#��p���%Q �^������E k�-eE��e]D�$�G��S�\r��r �o��Y�Cڟ�
����A͐�9���1f�6K�6�#Ɉ���E'!���I����h�J��3j�c��ꔀ�ݱ'],j�j$���\�ED_ @݌�b�+P �p諸��{j���h�G(9��\C�ٚ� �������xʕ�<��Ä��;����̗��*�ʈ K�r�ry,{L��Y�+sT��H�	�UX�\��/Z�HD۲N��𫄵��-k���/������G�P�YgՄԁ�f�b#�~�h
W���+��"1����/�|Sn(5��?���֜4_��q�nB�	1���uԒ	�^��{�#�^hs�[����A�[ms$F����}FAwc�\N���Z�(��O���&�����.����=uL+h�"3��Ŵ�P0Α}{]�h�-%k����q�!qF孯�%o��*@e��r����Y��`*���C�$ʲ �y����86W$p���5���/X������(�r�la�tV��H*V�B���T���r��⻰cգ٩ȍ6�"_���V��ۮ�~�MR+V�vE��^Wx�$ɧ-�	%��G_8�'9����*j����e�}C�mWԴ�ܴ��d�$%S��
�wD �_����Br(��%��$�l"�M�]2��z�\��b�b��v�F�t�Lu���;��v+� 6z��Gr�T"�e��֬Y ������r?�����u�3-0%����iuO�+ڨ#r]�26�y:�X֋�\����Mά����)#^"WMe�M��^\!�(��Ǜ�{o�)��(A	V�%�Ʉ'ۏc��}#�(05i�6"��� �Y
0��4�	3υ��=Ӿ��j,��"��+�W	�/=#4�����QM�k|�O�<�ve�K32���du%%yԖW;*�<�,��6�\3xa��ʱ��,�;�i6��?�#�PVQֆ�S��Q����e$�1?0o��R���Xp	9����~P��0�4�7��������+�(U>�YF��[�0-&'~�hݕ���%GҢ��.��:�BS"|�� V��Q�V=L�u<J�g�ހg����I�g|6��5z.{�4�k
��Q\ +LӐDt��Lh�����,6��+?��l��c�-ڂh�\�*	ShՀr_���t�B9%�C'D�uUq@������kW"1��0�SƩ�����k�����_mp��a��9�!��x����%Wv���"
ʝ���u�F꺛���P��.�y �H�,{c]We�J�Ʉ
��<����#*�2b���-Rü��T�+Ob��/�+�q�*"ʚ��S�3Bi�U�&��P�)������ P�76߷M$�B��������1YWqO�
$��(����"z���Ċ��֐?-KsU5�M��7t�����O�3J�ZP����C8��T���l����W\���K������^����vWD��M�"����Y��_L��&����i�F�����]բ�⋭�~��؜EO:��ve(�����0+�ML�ܬ��{Y}C�H��wT��*k;��Q[F�ǟ]�3���לK�U�#�����f��46>�P~&I�E��W刦oo�;ـ���E��/(��Ie�j>rQ���U�몔b�V`"e���9_0�Ude�1в@>�*�4�$�Z�Ҽ��iW�2�@�$ks���tc����ش!0���cY�9��"T��z����z��c-l��������4��Pf�~�e���£�Zf	��t���@ Ո���	*�0�{�k�y�L¡�k���h����%�����ђ�:�rTOя%TFv�aKڷ5h{�X|�]��y���VIz����"@�]O�
CB��|RU:���w~�����ū�7D�����&[�d}X��#eaچZ4!��Ƚ�,g��^��E����eSr�֍x����6t�9�'P��%�)I�eN6l}lRn�=���;�$�Rܠ-�V�;���b|�#��6\�bF+��YSNVUh�\ɣ�*�XH��d|�y[@�uqM��ۅ����Lv�||���H�h��CU�rA+*~���y)0�⠾#�Eԭ|���"E]��
5�`,��VK��'�#Ii���2�l��M e  ��j��)p�����f�i1�YF��!B��ФH��C+�:ZR[�2N�V����O����f�"i3�����q�Z���9/�v�\}R�;~�"�� �b=�He����<�E>[4R�rd����5MT���,gLF1y@=Ð���\�}�,J(Љ)	;;��HAnC��A3��d���۪��6�DE��Ң}P�r��)1ڵ(AWz�V��G0�7uft�&�In}��������ysPУ}��W�9u�:3%�(PJ�+��e�U�W5,"G�<
ؤհ��P�C�Ԟ������+m��+k���q�V����i�\g��QU�^�QUײ���Jt1�I��ge?{~�ɭj ����t!L�s��a�Y��mFX���"\ˡ���^6\�jeJ�w�1�p#{ЅMr�Y����u�-<NNU�c�&4�0?�P~H�ם���uxOC�ן��(p(/%/I�©p������k>�̣	|�k>Z P���D����S����ٞj��u\�����j�CQ�(mh�n��*;�e<˃5\��T����)�t�����I
�sd=�d��b?%�A����>�����n���Җ���3O
q�p���>�4*�U����=��p� ��Ʒv�8[��Ob�cL�|�պG\;+t$�j�h��V,��x[�zz?����gU����9J��(=�I�YK5���X�D͠��e�[,�<�M�ѫ��WW]�`��Z)���/i��!��&ꟲ ����� K�3�x����
�]E��+�z�)��=��C��u2���x0�ї��6��s{Ae��o�A��u5!EC���*���/OR?�Ծ�0�m�&T �ċx,��+��у.��R��2�u�O�$��C�q��j��N-���W?yI��0S`������M�!�ġ-SGYr�������=�s�\	:�yB�T��?C=�E��+ۈ@��tV.ꤨ��5}W����)xf����{�	��הo.X�y ��g��,׸��@���d(��X��_��W
TS�i��^��$�ކO���(:p��l�u�0_G��`�/�ÁL9�kK�̛0g���Zр&�3��I�l�؈����s��0�     