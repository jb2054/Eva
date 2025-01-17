PGDMP         %                |            eva    14.2    14.1 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    eva    DATABASE     `   CREATE DATABASE eva WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE eva;
                postgres    false            �            1259    67458    Configs    TABLE     �   CREATE TABLE public."Configs" (
    id integer NOT NULL,
    state integer,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Configs";
       public         heap    postgres    false            �            1259    67457    Configs_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Configs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Configs_id_seq";
       public          postgres    false    210            �           0    0    Configs_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Configs_id_seq" OWNED BY public."Configs".id;
          public          postgres    false    209                       1259    39004620    Consignments    TABLE     �  CREATE TABLE public."Consignments" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "DateOfIssue" timestamp with time zone,
    name character varying(3),
    "Reference.Nomenclature" integer,
    "Reference.Counterpartie" integer,
    "CostPrice" numeric(16,2),
    "SerialNumber" character varying(20)
);
 "   DROP TABLE public."Consignments";
       public         heap    postgres    false                       1259    39004619    Consignments_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Consignments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Consignments_id_seq";
       public          postgres    false    258            �           0    0    Consignments_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Consignments_id_seq" OWNED BY public."Consignments".id;
          public          postgres    false    257            �            1259    38780468 	   Constants    TABLE       CREATE TABLE public."Constants" (
    id integer NOT NULL,
    name character varying(150),
    value character varying(250),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    type character varying(50)
);
    DROP TABLE public."Constants";
       public         heap    postgres    false            �            1259    38780425    Constants_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Constants_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Constants_id_seq";
       public          postgres    false    224            �           0    0    Constants_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Constants_id_seq" OWNED BY public."Constants".id;
          public          postgres    false    223            �            1259    38995425    Counterpartie.Addresses    TABLE     �   CREATE TABLE public."Counterpartie.Addresses" (
    id integer NOT NULL,
    owner integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "Address" character varying(255)
);
 -   DROP TABLE public."Counterpartie.Addresses";
       public         heap    postgres    false            �            1259    38995424    Counterpartie.Addresses_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Counterpartie.Addresses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."Counterpartie.Addresses_id_seq";
       public          postgres    false    252            �           0    0    Counterpartie.Addresses_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."Counterpartie.Addresses_id_seq" OWNED BY public."Counterpartie.Addresses".id;
          public          postgres    false    251            �            1259    67536    Counterparties    TABLE     �  CREATE TABLE public."Counterparties" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(150),
    "Comment" character varying(150),
    "FullName" character varying(150),
    "Address" character varying(255),
    "Reference.TypesOfPrice" integer,
    "CreditLimit" numeric(16,2),
    "Client" boolean,
    "AgreementDate" timestamp with time zone
);
 $   DROP TABLE public."Counterparties";
       public         heap    postgres    false            �            1259    67535    Counterparties_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Counterparties_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Counterparties_id_seq";
       public          postgres    false    212            �           0    0    Counterparties_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Counterparties_id_seq" OWNED BY public."Counterparties".id;
          public          postgres    false    211            �            1259    38991105    Desadv.Products    TABLE     �   CREATE TABLE public."Desadv.Products" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    owner integer,
    test character varying(255)
);
 %   DROP TABLE public."Desadv.Products";
       public         heap    postgres    false            �            1259    38991104    Desadv.Products_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Desadv.Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Desadv.Products_id_seq";
       public          postgres    false    248            �           0    0    Desadv.Products_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Desadv.Products_id_seq" OWNED BY public."Desadv.Products".id;
          public          postgres    false    247            �            1259    38990111    Desadvs    TABLE     *  CREATE TABLE public."Desadvs" (
    id integer NOT NULL,
    number character varying(9),
    date timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "Reference.Counterpartie" integer,
    "Document.Order" integer
);
    DROP TABLE public."Desadvs";
       public         heap    postgres    false            �            1259    38990110    Desadvs_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Desadvs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Desadvs_id_seq";
       public          postgres    false    244            �           0    0    Desadvs_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Desadvs_id_seq" OWNED BY public."Desadvs".id;
          public          postgres    false    243            �            1259    38957714    Forms    TABLE     �   CREATE TABLE public."Forms" (
    id integer NOT NULL,
    name character varying(255),
    xbase64 text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Forms";
       public         heap    postgres    false            �            1259    38957713    Forms_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Forms_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Forms_id_seq";
       public          postgres    false    232            �           0    0    Forms_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Forms_id_seq" OWNED BY public."Forms".id;
          public          postgres    false    231            �            1259    38957705    Modules    TABLE     �   CREATE TABLE public."Modules" (
    id integer NOT NULL,
    name character varying(255),
    xbase64 text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Modules";
       public         heap    postgres    false            �            1259    38957704    Modules_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Modules_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Modules_id_seq";
       public          postgres    false    230            �           0    0    Modules_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Modules_id_seq" OWNED BY public."Modules".id;
          public          postgres    false    229            �            1259    75389    Nomenclatures    TABLE     T  CREATE TABLE public."Nomenclatures" (
    id integer NOT NULL,
    name character varying(150),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "Comment" character varying(100),
    "FullName" character varying(250),
    "Reference.Unit" integer,
    "EAN" character varying(13)
);
 #   DROP TABLE public."Nomenclatures";
       public         heap    postgres    false            �            1259    75388    Nomenclatures_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Nomenclatures_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Nomenclatures_id_seq";
       public          postgres    false    218            �           0    0    Nomenclatures_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Nomenclatures_id_seq" OWNED BY public."Nomenclatures".id;
          public          postgres    false    217                       1259    39016160    ObjectNumberers    TABLE       CREATE TABLE public."ObjectNumberers" (
    id integer NOT NULL,
    owner character varying(255),
    number integer,
    "textNumber" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 %   DROP TABLE public."ObjectNumberers";
       public         heap    postgres    false                       1259    39016159    ObjectNumberers_id_seq    SEQUENCE     �   CREATE SEQUENCE public."ObjectNumberers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."ObjectNumberers_id_seq";
       public          postgres    false    260            �           0    0    ObjectNumberers_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."ObjectNumberers_id_seq" OWNED BY public."ObjectNumberers".id;
          public          postgres    false    259            �            1259    38990944    Order.Products    TABLE     6  CREATE TABLE public."Order.Products" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "Reference.Nomenclature" integer,
    owner integer,
    "Quantity" numeric(14,3),
    price numeric(14,2),
    "Reference.Unit" integer
);
 $   DROP TABLE public."Order.Products";
       public         heap    postgres    false            �            1259    38990943    Order.Products_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Order.Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Order.Products_id_seq";
       public          postgres    false    246            �           0    0    Order.Products_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Order.Products_id_seq" OWNED BY public."Order.Products".id;
          public          postgres    false    245            �            1259    38994361 
   Order.etcs    TABLE     �   CREATE TABLE public."Order.etcs" (
    id integer NOT NULL,
    owner integer,
    test character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."Order.etcs";
       public         heap    postgres    false            �            1259    38994360    Order.etcs_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Order.etcs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Order.etcs_id_seq";
       public          postgres    false    250            �           0    0    Order.etcs_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Order.etcs_id_seq" OWNED BY public."Order.etcs".id;
          public          postgres    false    249            �            1259    38983488    Orders    TABLE     �  CREATE TABLE public."Orders" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    number character varying(9),
    date timestamp with time zone,
    "Reference.Counterpartie" integer,
    "Comment" character varying(255),
    "Reference.Organization" integer,
    "Reference.Warehouse" integer,
    "Reference.TypesOfPrice" integer,
    "DateDelivery" timestamp with time zone
);
    DROP TABLE public."Orders";
       public         heap    postgres    false            �            1259    38983487    Orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Orders_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Orders_id_seq";
       public          postgres    false    238            �           0    0    Orders_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Orders_id_seq" OWNED BY public."Orders".id;
          public          postgres    false    237            �            1259    38861318    Organizations    TABLE     \  CREATE TABLE public."Organizations" (
    id integer NOT NULL,
    name character varying(150),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "Comment" character varying(255),
    "GLN" character varying(13),
    "Address" character varying(255),
    "FullName" character varying(255)
);
 #   DROP TABLE public."Organizations";
       public         heap    postgres    false            �            1259    38861317    Organizations_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Organizations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Organizations_id_seq";
       public          postgres    false    226            �           0    0    Organizations_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Organizations_id_seq" OWNED BY public."Organizations".id;
          public          postgres    false    225                        1259    39004197    Owners    TABLE     �   CREATE TABLE public."Owners" (
    id integer NOT NULL,
    owner character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "refName" character varying(255),
    "ownerId" integer
);
    DROP TABLE public."Owners";
       public         heap    postgres    false            �            1259    39004195    Owners_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Owners_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Owners_id_seq";
       public          postgres    false    256            �           0    0    Owners_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Owners_id_seq" OWNED BY public."Owners".id;
          public          postgres    false    255            �            1259    67967    Prices    TABLE       CREATE TABLE public."Prices" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "Reference.TypesOfPrice" integer,
    "Price" numeric(16,2),
    "Reference.Nomenclature" integer
);
    DROP TABLE public."Prices";
       public         heap    postgres    false            �            1259    67966    Prices_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Prices_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Prices_id_seq";
       public          postgres    false    216            �           0    0    Prices_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Prices_id_seq" OWNED BY public."Prices".id;
          public          postgres    false    215            �            1259    1095578 
   Requisites    TABLE     �   CREATE TABLE public."Requisites" (
    id integer NOT NULL,
    owner integer,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."Requisites";
       public         heap    postgres    false            �            1259    1095577    Requisites_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Requisites_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Requisites_id_seq";
       public          postgres    false    220                        0    0    Requisites_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Requisites_id_seq" OWNED BY public."Requisites".id;
          public          postgres    false    219            �            1259    38979096    Roles    TABLE     �   CREATE TABLE public."Roles" (
    id integer NOT NULL,
    "Name" character varying(50),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Roles";
       public         heap    postgres    false            �            1259    38979094    Roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Roles_id_seq";
       public          postgres    false    234                       0    0    Roles_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;
          public          postgres    false    233            �            1259    38957697 
   Subsystems    TABLE     �   CREATE TABLE public."Subsystems" (
    id integer NOT NULL,
    name character varying(50),
    display boolean DEFAULT true,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."Subsystems";
       public         heap    postgres    false            �            1259    38957696    Subsystems_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Subsystems_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Subsystems_id_seq";
       public          postgres    false    228                       0    0    Subsystems_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Subsystems_id_seq" OWNED BY public."Subsystems".id;
          public          postgres    false    227            �            1259    38988585    TabPartReqs    TABLE     �   CREATE TABLE public."TabPartReqs" (
    id integer NOT NULL,
    owner integer,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 !   DROP TABLE public."TabPartReqs";
       public         heap    postgres    false            �            1259    38988584    TabPartReqs_id_seq    SEQUENCE     �   CREATE SEQUENCE public."TabPartReqs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."TabPartReqs_id_seq";
       public          postgres    false    242                       0    0    TabPartReqs_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."TabPartReqs_id_seq" OWNED BY public."TabPartReqs".id;
          public          postgres    false    241            �            1259    38988102    TabParts    TABLE     �   CREATE TABLE public."TabParts" (
    id integer NOT NULL,
    owner integer,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    state integer
);
    DROP TABLE public."TabParts";
       public         heap    postgres    false            �            1259    38988101    TabParts_id_seq    SEQUENCE     �   CREATE SEQUENCE public."TabParts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."TabParts_id_seq";
       public          postgres    false    240                       0    0    TabParts_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."TabParts_id_seq" OWNED BY public."TabParts".id;
          public          postgres    false    239            �            1259    39003011    TypesOfPrices    TABLE     �   CREATE TABLE public."TypesOfPrices" (
    id integer NOT NULL,
    name character varying(150),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 #   DROP TABLE public."TypesOfPrices";
       public         heap    postgres    false            �            1259    39003010    TypesOfPrices_id_seq    SEQUENCE     �   CREATE SEQUENCE public."TypesOfPrices_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."TypesOfPrices_id_seq";
       public          postgres    false    254                       0    0    TypesOfPrices_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."TypesOfPrices_id_seq" OWNED BY public."TypesOfPrices".id;
          public          postgres    false    253            �            1259    1114654    Units    TABLE       CREATE TABLE public."Units" (
    id integer NOT NULL,
    name character varying(50),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "Kod" character varying(150),
    "FullName" character varying(150)
);
    DROP TABLE public."Units";
       public         heap    postgres    false            �            1259    1114653    Units_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Units_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Units_id_seq";
       public          postgres    false    222                       0    0    Units_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Units_id_seq" OWNED BY public."Units".id;
          public          postgres    false    221            �            1259    38979103    Users    TABLE     �  CREATE TABLE public."Users" (
    id integer NOT NULL,
    "Name" character varying(50),
    "Descr" character varying(150),
    "EAuth" boolean,
    "Show" boolean,
    "Password" character varying(100),
    email character varying(50),
    "AdmRole" boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "RoleId" integer
);
    DROP TABLE public."Users";
       public         heap    postgres    false            �            1259    38979102    Users_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public          postgres    false    236                       0    0    Users_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;
          public          postgres    false    235            �            1259    67943 
   Warehouses    TABLE     �   CREATE TABLE public."Warehouses" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(150),
    "Comment" character varying(255)
);
     DROP TABLE public."Warehouses";
       public         heap    postgres    false            �            1259    67942    Warehouses_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Warehouses_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Warehouses_id_seq";
       public          postgres    false    214                       0    0    Warehouses_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Warehouses_id_seq" OWNED BY public."Warehouses".id;
          public          postgres    false    213            �           2604    67461 
   Configs id    DEFAULT     l   ALTER TABLE ONLY public."Configs" ALTER COLUMN id SET DEFAULT nextval('public."Configs_id_seq"'::regclass);
 ;   ALTER TABLE public."Configs" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    39004623    Consignments id    DEFAULT     v   ALTER TABLE ONLY public."Consignments" ALTER COLUMN id SET DEFAULT nextval('public."Consignments_id_seq"'::regclass);
 @   ALTER TABLE public."Consignments" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    257    258            �           2604    38780493    Constants id    DEFAULT     p   ALTER TABLE ONLY public."Constants" ALTER COLUMN id SET DEFAULT nextval('public."Constants_id_seq"'::regclass);
 =   ALTER TABLE public."Constants" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    38995428    Counterpartie.Addresses id    DEFAULT     �   ALTER TABLE ONLY public."Counterpartie.Addresses" ALTER COLUMN id SET DEFAULT nextval('public."Counterpartie.Addresses_id_seq"'::regclass);
 K   ALTER TABLE public."Counterpartie.Addresses" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251    252            �           2604    67539    Counterparties id    DEFAULT     z   ALTER TABLE ONLY public."Counterparties" ALTER COLUMN id SET DEFAULT nextval('public."Counterparties_id_seq"'::regclass);
 B   ALTER TABLE public."Counterparties" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    38991108    Desadv.Products id    DEFAULT     |   ALTER TABLE ONLY public."Desadv.Products" ALTER COLUMN id SET DEFAULT nextval('public."Desadv.Products_id_seq"'::regclass);
 C   ALTER TABLE public."Desadv.Products" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247    248            �           2604    38990114 
   Desadvs id    DEFAULT     l   ALTER TABLE ONLY public."Desadvs" ALTER COLUMN id SET DEFAULT nextval('public."Desadvs_id_seq"'::regclass);
 ;   ALTER TABLE public."Desadvs" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    244    244            �           2604    38957717    Forms id    DEFAULT     h   ALTER TABLE ONLY public."Forms" ALTER COLUMN id SET DEFAULT nextval('public."Forms_id_seq"'::regclass);
 9   ALTER TABLE public."Forms" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    38957708 
   Modules id    DEFAULT     l   ALTER TABLE ONLY public."Modules" ALTER COLUMN id SET DEFAULT nextval('public."Modules_id_seq"'::regclass);
 ;   ALTER TABLE public."Modules" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    75392    Nomenclatures id    DEFAULT     x   ALTER TABLE ONLY public."Nomenclatures" ALTER COLUMN id SET DEFAULT nextval('public."Nomenclatures_id_seq"'::regclass);
 A   ALTER TABLE public."Nomenclatures" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    39016163    ObjectNumberers id    DEFAULT     |   ALTER TABLE ONLY public."ObjectNumberers" ALTER COLUMN id SET DEFAULT nextval('public."ObjectNumberers_id_seq"'::regclass);
 C   ALTER TABLE public."ObjectNumberers" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    259    260            �           2604    38990947    Order.Products id    DEFAULT     z   ALTER TABLE ONLY public."Order.Products" ALTER COLUMN id SET DEFAULT nextval('public."Order.Products_id_seq"'::regclass);
 B   ALTER TABLE public."Order.Products" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    246    246            �           2604    38994364    Order.etcs id    DEFAULT     r   ALTER TABLE ONLY public."Order.etcs" ALTER COLUMN id SET DEFAULT nextval('public."Order.etcs_id_seq"'::regclass);
 >   ALTER TABLE public."Order.etcs" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    249    250            �           2604    38983491 	   Orders id    DEFAULT     j   ALTER TABLE ONLY public."Orders" ALTER COLUMN id SET DEFAULT nextval('public."Orders_id_seq"'::regclass);
 :   ALTER TABLE public."Orders" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    238    238            �           2604    38861321    Organizations id    DEFAULT     x   ALTER TABLE ONLY public."Organizations" ALTER COLUMN id SET DEFAULT nextval('public."Organizations_id_seq"'::regclass);
 A   ALTER TABLE public."Organizations" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    39004200 	   Owners id    DEFAULT     j   ALTER TABLE ONLY public."Owners" ALTER COLUMN id SET DEFAULT nextval('public."Owners_id_seq"'::regclass);
 :   ALTER TABLE public."Owners" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    256    256            �           2604    67970 	   Prices id    DEFAULT     j   ALTER TABLE ONLY public."Prices" ALTER COLUMN id SET DEFAULT nextval('public."Prices_id_seq"'::regclass);
 :   ALTER TABLE public."Prices" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    1095581    Requisites id    DEFAULT     r   ALTER TABLE ONLY public."Requisites" ALTER COLUMN id SET DEFAULT nextval('public."Requisites_id_seq"'::regclass);
 >   ALTER TABLE public."Requisites" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    38979099    Roles id    DEFAULT     h   ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);
 9   ALTER TABLE public."Roles" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    38957700    Subsystems id    DEFAULT     r   ALTER TABLE ONLY public."Subsystems" ALTER COLUMN id SET DEFAULT nextval('public."Subsystems_id_seq"'::regclass);
 >   ALTER TABLE public."Subsystems" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    38988588    TabPartReqs id    DEFAULT     t   ALTER TABLE ONLY public."TabPartReqs" ALTER COLUMN id SET DEFAULT nextval('public."TabPartReqs_id_seq"'::regclass);
 ?   ALTER TABLE public."TabPartReqs" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241    242            �           2604    38988105    TabParts id    DEFAULT     n   ALTER TABLE ONLY public."TabParts" ALTER COLUMN id SET DEFAULT nextval('public."TabParts_id_seq"'::regclass);
 <   ALTER TABLE public."TabParts" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    240    240            �           2604    39003014    TypesOfPrices id    DEFAULT     x   ALTER TABLE ONLY public."TypesOfPrices" ALTER COLUMN id SET DEFAULT nextval('public."TypesOfPrices_id_seq"'::regclass);
 A   ALTER TABLE public."TypesOfPrices" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    253    254            �           2604    1114657    Units id    DEFAULT     h   ALTER TABLE ONLY public."Units" ALTER COLUMN id SET DEFAULT nextval('public."Units_id_seq"'::regclass);
 9   ALTER TABLE public."Units" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    38979106    Users id    DEFAULT     h   ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    67946    Warehouses id    DEFAULT     r   ALTER TABLE ONLY public."Warehouses" ALTER COLUMN id SET DEFAULT nextval('public."Warehouses_id_seq"'::regclass);
 >   ALTER TABLE public."Warehouses" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            �          0    67458    Configs 
   TABLE DATA           N   COPY public."Configs" (id, state, data, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    210   7�       �          0    39004620    Consignments 
   TABLE DATA           �   COPY public."Consignments" (id, "createdAt", "updatedAt", "DateOfIssue", name, "Reference.Nomenclature", "Reference.Counterpartie", "CostPrice", "SerialNumber") FROM stdin;
    public          postgres    false    258   �       �          0    38780468 	   Constants 
   TABLE DATA           V   COPY public."Constants" (id, name, value, "createdAt", "updatedAt", type) FROM stdin;
    public          postgres    false    224   ��       �          0    38995425    Counterpartie.Addresses 
   TABLE DATA           c   COPY public."Counterpartie.Addresses" (id, owner, "createdAt", "updatedAt", "Address") FROM stdin;
    public          postgres    false    252   ��       �          0    67536    Counterparties 
   TABLE DATA           �   COPY public."Counterparties" (id, "createdAt", "updatedAt", name, "Comment", "FullName", "Address", "Reference.TypesOfPrice", "CreditLimit", "Client", "AgreementDate") FROM stdin;
    public          postgres    false    212   ��       �          0    38991105    Desadv.Products 
   TABLE DATA           V   COPY public."Desadv.Products" (id, "createdAt", "updatedAt", owner, test) FROM stdin;
    public          postgres    false    248   ��       �          0    38990111    Desadvs 
   TABLE DATA           |   COPY public."Desadvs" (id, number, date, "createdAt", "updatedAt", "Reference.Counterpartie", "Document.Order") FROM stdin;
    public          postgres    false    244   2�       �          0    38957714    Forms 
   TABLE DATA           N   COPY public."Forms" (id, name, xbase64, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    232   ��       �          0    38957705    Modules 
   TABLE DATA           P   COPY public."Modules" (id, name, xbase64, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    230   ��       �          0    75389    Nomenclatures 
   TABLE DATA           }   COPY public."Nomenclatures" (id, name, "createdAt", "updatedAt", "Comment", "FullName", "Reference.Unit", "EAN") FROM stdin;
    public          postgres    false    218   ��       �          0    39016160    ObjectNumberers 
   TABLE DATA           f   COPY public."ObjectNumberers" (id, owner, number, "textNumber", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    260   t�       �          0    38990944    Order.Products 
   TABLE DATA           �   COPY public."Order.Products" (id, "createdAt", "updatedAt", "Reference.Nomenclature", owner, "Quantity", price, "Reference.Unit") FROM stdin;
    public          postgres    false    246   ��       �          0    38994361 
   Order.etcs 
   TABLE DATA           Q   COPY public."Order.etcs" (id, owner, test, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    250   ��       �          0    38983488    Orders 
   TABLE DATA           �   COPY public."Orders" (id, "createdAt", "updatedAt", number, date, "Reference.Counterpartie", "Comment", "Reference.Organization", "Reference.Warehouse", "Reference.TypesOfPrice", "DateDelivery") FROM stdin;
    public          postgres    false    238   s�       �          0    38861318    Organizations 
   TABLE DATA           v   COPY public."Organizations" (id, name, "createdAt", "updatedAt", "Comment", "GLN", "Address", "FullName") FROM stdin;
    public          postgres    false    226   ��       �          0    39004197    Owners 
   TABLE DATA           ]   COPY public."Owners" (id, owner, "createdAt", "updatedAt", "refName", "ownerId") FROM stdin;
    public          postgres    false    256   N�       �          0    67967    Prices 
   TABLE DATA           }   COPY public."Prices" (id, "createdAt", "updatedAt", "Reference.TypesOfPrice", "Price", "Reference.Nomenclature") FROM stdin;
    public          postgres    false    216   ��       �          0    1095578 
   Requisites 
   TABLE DATA           Q   COPY public."Requisites" (id, owner, data, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    220   ~�       �          0    38979096    Roles 
   TABLE DATA           G   COPY public."Roles" (id, "Name", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    234   �       �          0    38957697 
   Subsystems 
   TABLE DATA           S   COPY public."Subsystems" (id, name, display, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    228   b�       �          0    38988585    TabPartReqs 
   TABLE DATA           R   COPY public."TabPartReqs" (id, owner, data, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    242   ��       �          0    38988102    TabParts 
   TABLE DATA           V   COPY public."TabParts" (id, owner, data, "createdAt", "updatedAt", state) FROM stdin;
    public          postgres    false    240   n�       �          0    39003011    TypesOfPrices 
   TABLE DATA           M   COPY public."TypesOfPrices" (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    254   r�       �          0    1114654    Units 
   TABLE DATA           X   COPY public."Units" (id, name, "createdAt", "updatedAt", "Kod", "FullName") FROM stdin;
    public          postgres    false    222   ��       �          0    38979103    Users 
   TABLE DATA           �   COPY public."Users" (id, "Name", "Descr", "EAuth", "Show", "Password", email, "AdmRole", "createdAt", "updatedAt", "RoleId") FROM stdin;
    public          postgres    false    236   d�       �          0    67943 
   Warehouses 
   TABLE DATA           U   COPY public."Warehouses" (id, "createdAt", "updatedAt", name, "Comment") FROM stdin;
    public          postgres    false    214   ��       	           0    0    Configs_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Configs_id_seq"', 126, true);
          public          postgres    false    209            
           0    0    Consignments_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Consignments_id_seq"', 5, true);
          public          postgres    false    257                       0    0    Constants_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Constants_id_seq"', 1, false);
          public          postgres    false    223                       0    0    Counterpartie.Addresses_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."Counterpartie.Addresses_id_seq"', 47, true);
          public          postgres    false    251                       0    0    Counterparties_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Counterparties_id_seq"', 50, true);
          public          postgres    false    211                       0    0    Desadv.Products_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Desadv.Products_id_seq"', 6, true);
          public          postgres    false    247                       0    0    Desadvs_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Desadvs_id_seq"', 10, true);
          public          postgres    false    243                       0    0    Forms_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Forms_id_seq"', 1, false);
          public          postgres    false    231                       0    0    Modules_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Modules_id_seq"', 1, false);
          public          postgres    false    229                       0    0    Nomenclatures_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Nomenclatures_id_seq"', 20, true);
          public          postgres    false    217                       0    0    ObjectNumberers_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."ObjectNumberers_id_seq"', 2, true);
          public          postgres    false    259                       0    0    Order.Products_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Order.Products_id_seq"', 53, true);
          public          postgres    false    245                       0    0    Order.etcs_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Order.etcs_id_seq"', 33, true);
          public          postgres    false    249                       0    0    Orders_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Orders_id_seq"', 71, true);
          public          postgres    false    237                       0    0    Organizations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Organizations_id_seq"', 8, true);
          public          postgres    false    225                       0    0    Owners_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Owners_id_seq"', 7, true);
          public          postgres    false    255                       0    0    Prices_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Prices_id_seq"', 86, true);
          public          postgres    false    215                       0    0    Requisites_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Requisites_id_seq"', 91, true);
          public          postgres    false    219                       0    0    Roles_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Roles_id_seq"', 2, true);
          public          postgres    false    233                       0    0    Subsystems_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Subsystems_id_seq"', 1, false);
          public          postgres    false    227                       0    0    TabPartReqs_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."TabPartReqs_id_seq"', 21, true);
          public          postgres    false    241                       0    0    TabParts_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."TabParts_id_seq"', 9, true);
          public          postgres    false    239                       0    0    TypesOfPrices_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."TypesOfPrices_id_seq"', 5, true);
          public          postgres    false    253                        0    0    Units_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Units_id_seq"', 4, true);
          public          postgres    false    221            !           0    0    Users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Users_id_seq"', 5, true);
          public          postgres    false    235            "           0    0    Warehouses_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Warehouses_id_seq"', 21, true);
          public          postgres    false    213            �           2606    67463    Configs Configs_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Configs"
    ADD CONSTRAINT "Configs_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Configs" DROP CONSTRAINT "Configs_pkey";
       public            postgres    false    210            &           2606    39004625    Consignments Consignments_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Consignments"
    ADD CONSTRAINT "Consignments_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Consignments" DROP CONSTRAINT "Consignments_pkey";
       public            postgres    false    258                       2606    38780506    Constants Constants_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Constants"
    ADD CONSTRAINT "Constants_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Constants" DROP CONSTRAINT "Constants_pkey";
       public            postgres    false    224                        2606    38995430 4   Counterpartie.Addresses Counterpartie.Addresses_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."Counterpartie.Addresses"
    ADD CONSTRAINT "Counterpartie.Addresses_pkey" PRIMARY KEY (id);
 b   ALTER TABLE ONLY public."Counterpartie.Addresses" DROP CONSTRAINT "Counterpartie.Addresses_pkey";
       public            postgres    false    252            �           2606    67541 "   Counterparties Counterparties_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Counterparties"
    ADD CONSTRAINT "Counterparties_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."Counterparties" DROP CONSTRAINT "Counterparties_pkey";
       public            postgres    false    212                       2606    38991110 $   Desadv.Products Desadv.Products_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Desadv.Products"
    ADD CONSTRAINT "Desadv.Products_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."Desadv.Products" DROP CONSTRAINT "Desadv.Products_pkey";
       public            postgres    false    248                       2606    38990116    Desadvs Desadvs_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Desadvs"
    ADD CONSTRAINT "Desadvs_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Desadvs" DROP CONSTRAINT "Desadvs_pkey";
       public            postgres    false    244                       2606    38957721    Forms Forms_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Forms"
    ADD CONSTRAINT "Forms_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Forms" DROP CONSTRAINT "Forms_pkey";
       public            postgres    false    232            
           2606    38957712    Modules Modules_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Modules"
    ADD CONSTRAINT "Modules_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Modules" DROP CONSTRAINT "Modules_pkey";
       public            postgres    false    230            �           2606    75396     Nomenclatures Nomenclatures_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Nomenclatures"
    ADD CONSTRAINT "Nomenclatures_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."Nomenclatures" DROP CONSTRAINT "Nomenclatures_pkey";
       public            postgres    false    218            (           2606    39016169 $   ObjectNumberers ObjectNumberers_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."ObjectNumberers"
    ADD CONSTRAINT "ObjectNumberers_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."ObjectNumberers" DROP CONSTRAINT "ObjectNumberers_pkey";
       public            postgres    false    260                       2606    38990949 "   Order.Products Order.Products_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Order.Products"
    ADD CONSTRAINT "Order.Products_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."Order.Products" DROP CONSTRAINT "Order.Products_pkey";
       public            postgres    false    246                       2606    38994366    Order.etcs Order.etcs_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Order.etcs"
    ADD CONSTRAINT "Order.etcs_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Order.etcs" DROP CONSTRAINT "Order.etcs_pkey";
       public            postgres    false    250                       2606    38983493    Orders Orders_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_pkey";
       public            postgres    false    238                       2606    38861323     Organizations Organizations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Organizations"
    ADD CONSTRAINT "Organizations_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."Organizations" DROP CONSTRAINT "Organizations_pkey";
       public            postgres    false    226            $           2606    39004209    Owners Owners_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Owners"
    ADD CONSTRAINT "Owners_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Owners" DROP CONSTRAINT "Owners_pkey";
       public            postgres    false    256            �           2606    67972    Prices Prices_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Prices"
    ADD CONSTRAINT "Prices_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Prices" DROP CONSTRAINT "Prices_pkey";
       public            postgres    false    216                        2606    1095585    Requisites Requisites_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Requisites"
    ADD CONSTRAINT "Requisites_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Requisites" DROP CONSTRAINT "Requisites_pkey";
       public            postgres    false    220                       2606    38979101    Roles Roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_pkey";
       public            postgres    false    234                       2606    38957703    Subsystems Subsystems_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Subsystems"
    ADD CONSTRAINT "Subsystems_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Subsystems" DROP CONSTRAINT "Subsystems_pkey";
       public            postgres    false    228                       2606    38988592    TabPartReqs TabPartReqs_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."TabPartReqs"
    ADD CONSTRAINT "TabPartReqs_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."TabPartReqs" DROP CONSTRAINT "TabPartReqs_pkey";
       public            postgres    false    242                       2606    38988109    TabParts TabParts_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."TabParts"
    ADD CONSTRAINT "TabParts_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."TabParts" DROP CONSTRAINT "TabParts_pkey";
       public            postgres    false    240            "           2606    39003016     TypesOfPrices TypesOfPrices_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."TypesOfPrices"
    ADD CONSTRAINT "TypesOfPrices_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."TypesOfPrices" DROP CONSTRAINT "TypesOfPrices_pkey";
       public            postgres    false    254                       2606    1114659    Units Units_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Units"
    ADD CONSTRAINT "Units_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Units" DROP CONSTRAINT "Units_pkey";
       public            postgres    false    222                       2606    38979109    Users Users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public            postgres    false    236            �           2606    67948    Warehouses Warehouses_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Warehouses"
    ADD CONSTRAINT "Warehouses_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Warehouses" DROP CONSTRAINT "Warehouses_pkey";
       public            postgres    false    214            )           2606    39022353    Users Users_RoleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_RoleId_fkey" FOREIGN KEY ("RoleId") REFERENCES public."Roles"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_RoleId_fkey";
       public          postgres    false    234    236    3342            �   �  x�͘�n�8���S޶&xx��4EQ�M�&�b��06m���@������JN,)6"��.-F����B�G���Iu}���'f�&�ee}5y=��Ϫy�Ѧ��XZ��c�4��V֗�u٬�:�n��ڵ�g�{6��m��g�p��3G��_ݬ���w����X���HUQ���p~Y�p$��w�(S
S�#������|�$���p�X�yo��>���(�U]�>,����̕��H�r$��f�.B|��w�����U:�Y�& |
t�!��p0�а �2Ab(�� `�$�b����=B���Y���Hf� �ɽb˖��r�S�g�OE:{B��]�|]m�}������HE����K�(�Z�^?o8*��¿=y������mjKO0[�t��Yb'l��w�+��z}���P��׺����E�ݼ��}:�ǌ)�U%`�c,.%�qhc6����ڗ1�9��#���EJD��uK�qϰ*,1�[�0�d�\}�׾rŕ-��N�>��Ug�XT�^�cC�P��h�zD�Tf���[��!Ѯ���'##��6o�����em��7��+NX�8�C�^ujeT!1�4Y}?旼��G�����Ӊ�����mQ��PMt"�2�Q���'n�Ԥn�n��h�1�jZ�
�S�9�@,Tj	y< ����lP������]�C��(ݣCɥ��J��I;4�Q�ؗ��c4�4������-D*P�f#��	9��մ���6wa��P�k�Нb�59!���V���n���Aq��x�3,�&�1�`Z#"��r��K�x�n����n����$q���\u���M���ĕv�������B#��	����n��n����ί�lU����G�g�>�׃N��P�C���I�)��~ϊ����R���u�0�~2�Q�/bRo�"��a���K�3�      �   �   x�}�K� D�p
�U�� 	�=A��B)������FO���	�4S�\b�^HOh};@����/[\k yċ�nzD�������� �%Ƽ�����]G;OU�9��/�P���?#�80��u	�H֓�ҝ�/_7���D�S      �     x�u�MK�0����]f&_M��G?��K\���B�=�7�P����<��;���?�����";��50RCP�tR:0o@�H6���S�	�Q�v�p	>V���}>��0e�]�hjD���IR��9y
��B<��2�e�!���{	>-Ӏ+k�B�nwP��@;n�|Эf�;��w���R�����M��ǔ�*$5S�rqu�4��k�ق��k�K�Κ=���0}��Ĭ���U	�Q�ۮW����2�D?��WU�t�z      �   �   x�}�;n�0k��#-��Ϟ!�	ܤHp��I,ɖ2l�i8�(p��3�̔�9�S�V��?�iJ��甮_�^�/��)F� ���Vs��O޿O�dC���bA7�E�A��3�R��;�*�P�������.;V��1���І�,CÂ�� ǝ�3AՎ�	�LC��bA[�����-�T(��#Z+��u�3�D�s�3C��/����b�����      �   �   x�m�1k�@�gݯ�^�x�r���]�,]�dHChj�����+���B��)̣jTcC�\��	�:=�5��QA�6�y���ms�}&��I�Ҳ��H/@���uF.n%��y��Ԭ����=��>�n�}	��h��W������X��U�=�؇��Z�^	��~��x^�_N�e<v��_��:��AB?��E�      �   �   x�}��
�0���Sĳ�$i��>�ga�8&���o�+!�����xCl��%yN"V\ܓ���~�~��8;XMY���,I]X~��𞊡��s-i��ײ��Ł~���)G5X��������Ώ{{���B' /{�>T      �   U   x�����0���#*')��,�?EB�T�^g�Jx#�жC��`�M-Z	M;+,Vyc��������H9�J���$�2�]�"�      �      x������ � �      �      x������ � �      �   �   x�}�=1���Wt���_i�9r89�"X������@Q�Y��M��t-��v/�<4V)bI�}�>����?``��zj�*���.�m�l�f�~8�ǈ+�������)� ���ٱ�@��5�x�k�w~F�Z�_�@0      �   a   x�m�;�  �z9��a�@���И�0��b�1��%#���(��$���>�I��̤r��!�4�0콶,?�N1��򣈢�y4����      �   �   x�}�͕� ��PE��³6c�L�u,�o&�E_$A.�2Ϡ�_v��&?��I�M���3�#p8X'2/p~%�3�F	��v�l���չ4W���d���OO�B����ۤ�����3�<��J��$��m�-�l���d�>w�N���S�#ݞM.s�%'���A�N[�c�Mx�`�:quTϭ �������Fr�l-�k���0^� �k-[Q[GC̯�=�lV�����R�w�1��E      �   y   x�}�1�0F��>E�Q"�w�4>�:T$���B[���UR����Gz���B�,�!I6BP�>�bC����ܚ�}n+�;�XF�~3Z��H���>�)��A�ғ�@�fe���Y�[a�7k <S      �   c   x�}�K� D���d�"B����!���LWo&/''��A��lZ��	��pް�вo]Kmp	\zN�{���R��ڛ?�e�������C��HD4,J      �   X   x�3�t�u�4202�54�54W04�26�2�г42�60�'�G\���~!�>��M�L-�,Lͱ��,�ibf� ����
��b���� �+ �      �   �   x��̹
1@�:����𖬯����!ʀf ��o,�nq�$u���k��;,���e}���[@�`0	dA�
��w��l���8��:�y�*��.E�A(��_���(�����_�s���
)��Z��	.�      �   �   x�}�I�0��+r/,��Io���Q($]�C�C�I��@m#C=8�?���
�4�^��VCw���䎒�|vp�j!Ǧ�њ���b"��!1��X��1Xhw��Qr��ev�38������/�h�(��y搜���>�      �   x  x��YMo�6=[�B�u7���-ͶŢ�ݢۢ���f�l9��EӢ��$��$%g���>X�|Cμy3V� ���������̜�d�lk��E�목���zۜ�>�oo�C���6��[�ֶ��?߫�r�V�����{�6���j]��0Wպ���V�[����`��19Ǵ��P0#N�+L0|�b�ۭ�鬒=x�o��:A��Ͱ�:��t�}���� 焕 K�AX�xp�K��*C%R8��O�_�V�����x�1bn8EZ�=�`��$���H(X������}�����v*�2�����+�ED�8�3��<�[H���v��W!J���CB���p�C��, t��r]ۦ�:�_��~��������9'���`j@"`Q@E&H	�u��<ud�G/��iD��ll*(�]n7���N،F��0�Yd*(�7;��G7c� E
�x��TP�P*�˶���>}+a0��E�RS!��;���������1�>��:1�8Ǩ�Q)"��Y1\9�B��#�r!h;c���͟�=\���c(�3ǎ�\	K C	�g�+��xUzZ���I�I�A�"���GJ`81���EZ���K�k�4�f*� !������<��ǋ�Y� �.�I��Q>5��c��r�k��7U�ד%9_�Nz���D�85z��|���r��Qk>y\"FٓL�����k�=�΢|�R�J��Y��!q4M��\$�>6�Sv9�/M=�{�������ت۵v3�����w�Hs�gx�6��Hꡘ��^�H�+J���el*$�1�aN�\B�NU -a>6��`����e��R�Z���$�rK�h^�l�;箃_}�wk���͝�t�̛!w��e(� yV2S!T~c/�T�I�)�Ɨ�
�S�6[�����:2��(�GB�OL�/��5�Y���?um�����-�"��'[&�")�S������eu�2����Q��B�7+NL�ɳwM�]G��6������ͺ,0_h>��ϖ�Ww$������8;�3����,a� A�\Φ�B���.�]���ӯ*o���mD��wR���#��V�⺵A=���ȉ�����u�j0�+��o�85�W�|���
�!���0kR,����ۮ�=��5c�_7o$I��Nת���L���]ןm{{����y��%V^�2��J�cS!E6���>�w1$L�8� 2�6ܗ��?�~��M�^��<�>ڶ���9~����n����ǎ�\��d��#S"�@e�o�۵���4�<�>��\��,�~�<��	��֮��]��[�)���>�o�
�}�qCL�	���uP ����������пj�z_
dhf�T��L��(�� �F��      �   L   x�3�tL����,.)J,�/�4202�54�54W04�2��24�346�60�#�e�Z��E������	V�p)�=... Q�      �   n   x�u�1�0��+葭�;�A�:m�!�W�H�,m5���QZ=�C¢�A6�f!����8@i���.�W�!z�: ���`�\�H���	w_�5���?�s�'w      �   ~  x�͓=o�0�g������G��*u��Cݺ�pI��������:i��*�P		�^σ�@|�?�C���1�+\�b�.�w&�����ZT�ܷ|Qb5s���L�5�d���/��9���ɕ)�ܸb��)k�9֙]���L�)��6�JS�9��ʏ�T��HH}?�~�)Z�2$��ܿK����`�9=�E�dn_�P윗�̀_�3�߰��dB����Pki�/�	v�M ��?���#�(�4��k��8[T�A���a\F#�~44�%��>n?
A��UZ����j�.�-��Y�{,��62��;&�U$ �D��"�`���@��X�����kU�S;��wJ�����!��F�%%)�é(|#a� #ro      �   �   x����J�0�s��Wm��G��M\O� ^�&�m$IW��M)l[����f�V��i���cC�c�������7�M���ٕ����S��e��Q��~:�xa�5������$��}��@��e�	��8�n���
lfy����^cp�1�Gx
�mU�IE��H���E�А�Ik�k�����Q>�|��Wqn�g��N���@ʐ��"�[��|ܙ��.-���ϲ�47�,������~B      �   p   x�3�(-J�H,��K�4202�50�52R04�21�20�305�60�#�e�����Z�������H����	p).cΠԒ���"#]C3++Cc=s3�~lR\1z\\\ ��*!      �   b   x�3�pv�4202�54�52Q04�26�20�305�60�'enb�����Z�e��� Uk�kd�`hneliej�gl`�0����g@brvbz*W� |��      �   D  x�}��n�@�5<E�Gf`����@)UmLaDeԑ���Wc�h��I��O���C����q(j@�1pfK��iF��� ���B���Чv��
�HQE�q�܌h����xIHnBԄ��m�hK:���$��@Q�n��U�R���,����T�i���&^�?aV��Uk��V�UV׷�8�'E���m��ב��ƕc��;�-9�+�>�:��Wd���:d2D�C�HEn������������H�g�vr$?*u�ҙ�G���F�[��<b�8'�v[��L��*�3',�8�v��v�8�(~;�f      �   o   x�}α�@���<�����9�!���)af`@&	UDJ�?}z��mEZ�r�� M��.�9ۮi�Ӣ���Un�x��"��XheT{�Ӏ���'���>��..     