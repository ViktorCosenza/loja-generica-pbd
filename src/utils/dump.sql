PGDMP         4                w            postgres    11.3    11.3 O    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    13012    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE postgres;
             postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                  postgres    false    2948                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                  false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                       false    1            �            1259    16505    cargos    TABLE        CREATE TABLE public.cargos (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    salario integer NOT NULL
);
    DROP TABLE public.cargos;
       public         postgres    false            �            1259    16508    cargos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cargos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.cargos_id_seq;
       public       postgres    false    197            �           0    0    cargos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.cargos_id_seq OWNED BY public.cargos.id;
            public       postgres    false    198            �            1259    16510    cidades    TABLE     �   CREATE TABLE public.cidades (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    uf character(2) NOT NULL
);
    DROP TABLE public.cidades;
       public         postgres    false            �            1259    16513    cidades_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cidades_id_seq;
       public       postgres    false    199            �           0    0    cidades_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cidades_id_seq OWNED BY public.cidades.id;
            public       postgres    false    200            �            1259    16622    column_names    VIEW     �   CREATE VIEW public.column_names AS
 SELECT columns.column_name,
    columns.table_name
   FROM information_schema.columns
  WHERE ((columns.table_schema)::text ~~ 'public'::text)
  ORDER BY columns.table_name;
    DROP VIEW public.column_names;
       public       postgres    false            �            1259    16515    estoque    TABLE     z   CREATE TABLE public.estoque (
    produto integer NOT NULL,
    loja integer NOT NULL,
    quantidade integer NOT NULL
);
    DROP TABLE public.estoque;
       public         postgres    false            �            1259    16525    lojas    TABLE     �   CREATE TABLE public.lojas (
    id integer NOT NULL,
    cidade integer NOT NULL,
    bairro character varying(30) NOT NULL,
    rua character varying(50) NOT NULL,
    numero integer NOT NULL,
    complemento character varying(100)
);
    DROP TABLE public.lojas;
       public         postgres    false            �            1259    16530    produtos    TABLE     �   CREATE TABLE public.produtos (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    tipo integer NOT NULL,
    preco money NOT NULL
);
    DROP TABLE public.produtos;
       public         postgres    false            �            1259    16535    tipos_produto    TABLE     �   CREATE TABLE public.tipos_produto (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    descricao text NOT NULL
);
 !   DROP TABLE public.tipos_produto;
       public         postgres    false            �            1259    16636    estoque_detalhado    VIEW     �  CREATE VIEW public.estoque_detalhado AS
 SELECT produtos.nome AS produto,
    produtos.preco,
    tipos_produto.nome AS tipo,
    estoque.quantidade,
    cidades.nome AS cidade,
    estoque.loja
   FROM ((((public.estoque
     JOIN public.produtos ON ((estoque.produto = produtos.id)))
     JOIN public.tipos_produto ON ((produtos.tipo = tipos_produto.id)))
     JOIN public.lojas ON ((estoque.loja = lojas.id)))
     JOIN public.cidades ON ((lojas.cidade = cidades.id)));
 $   DROP VIEW public.estoque_detalhado;
       public       postgres    false    199    208    208    206    206    206    206    204    204    201    201    201    199            �            1259    16518    funcionarios    TABLE     6  CREATE TABLE public.funcionarios (
    cargo integer NOT NULL,
    nome character varying(50) NOT NULL,
    cpf integer NOT NULL,
    rg integer NOT NULL,
    data_contratacao date NOT NULL,
    data_demissao date,
    ativo boolean DEFAULT true NOT NULL,
    genero character(1) NOT NULL,
    loja integer
);
     DROP TABLE public.funcionarios;
       public         postgres    false            �            1259    16641    funcionarios_cargo    VIEW     �  CREATE VIEW public.funcionarios_cargo WITH (security_barrier='false') AS
 SELECT cargos.nome AS nome_cargo,
    funcionarios.cargo,
    funcionarios.nome,
    funcionarios.cpf,
    funcionarios.rg,
    funcionarios.data_contratacao,
    funcionarios.data_demissao,
    funcionarios.ativo,
    funcionarios.genero,
    funcionarios.loja
   FROM (public.funcionarios
     JOIN public.cargos ON ((funcionarios.cargo = cargos.id)));
 %   DROP VIEW public.funcionarios_cargo;
       public       postgres    false    197    197    202    202    202    202    202    202    202    202    202            �            1259    16522 
   item_venda    TABLE     �   CREATE TABLE public.item_venda (
    produto integer NOT NULL,
    venda integer NOT NULL,
    quantidade integer NOT NULL,
    preco_unitario money NOT NULL
);
    DROP TABLE public.item_venda;
       public         postgres    false            �            1259    16543    vendas    TABLE     �   CREATE TABLE public.vendas (
    id integer NOT NULL,
    cpf_funcionario integer NOT NULL,
    data date NOT NULL,
    cpf_cliente integer NOT NULL
);
    DROP TABLE public.vendas;
       public         postgres    false            �            1259    16649    item_venda_view    VIEW     4  CREATE VIEW public.item_venda_view AS
 SELECT produtos.nome AS produto,
    item_venda.quantidade,
    item_venda.preco_unitario,
    item_venda.venda
   FROM ((public.item_venda
     JOIN public.produtos ON ((item_venda.produto = produtos.id)))
     JOIN public.vendas ON ((item_venda.venda = vendas.id)));
 "   DROP VIEW public.item_venda_view;
       public       postgres    false    203    203    203    210    206    206    203            �            1259    16645    loja_cidade    VIEW       CREATE VIEW public.loja_cidade AS
 SELECT cidades.nome AS nome_cidade,
    lojas.id,
    lojas.cidade,
    lojas.bairro,
    lojas.rua,
    lojas.numero,
    lojas.complemento
   FROM (public.lojas
     JOIN public.cidades ON ((lojas.cidade = cidades.id)));
    DROP VIEW public.loja_cidade;
       public       postgres    false    204    204    199    199    204    204    204    204            �            1259    16528    lojas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lojas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.lojas_id_seq;
       public       postgres    false    204            �           0    0    lojas_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.lojas_id_seq OWNED BY public.lojas.id;
            public       postgres    false    205            �            1259    16626    produto_com_tipo    VIEW     �   CREATE VIEW public.produto_com_tipo AS
 SELECT produtos.id,
    produtos.nome,
    produtos.preco,
    tipos_produto.nome AS tipo
   FROM (public.produtos
     JOIN public.tipos_produto ON ((produtos.tipo = tipos_produto.id)));
 #   DROP VIEW public.produto_com_tipo;
       public       postgres    false    206    206    206    208    208    206            �            1259    16533    produtos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.produtos_id_seq;
       public       postgres    false    206            �           0    0    produtos_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;
            public       postgres    false    207            �            1259    16541    tipos_produto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipos_produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tipos_produto_id_seq;
       public       postgres    false    208            �           0    0    tipos_produto_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tipos_produto_id_seq OWNED BY public.tipos_produto.id;
            public       postgres    false    209            �            1259    16546    vendas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vendas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.vendas_id_seq;
       public       postgres    false    210            �           0    0    vendas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.vendas_id_seq OWNED BY public.vendas.id;
            public       postgres    false    211            �            1259    16653    vendas_view    VIEW     �   CREATE VIEW public.vendas_view AS
SELECT
    NULL::integer AS id,
    NULL::character varying(50) AS funcionario,
    NULL::integer AS cpf_funcionario,
    NULL::integer AS cpf_cliente,
    NULL::date AS data,
    NULL::money AS valor_total;
    DROP VIEW public.vendas_view;
       public       postgres    false            �
           2604    16548 	   cargos id    DEFAULT     f   ALTER TABLE ONLY public.cargos ALTER COLUMN id SET DEFAULT nextval('public.cargos_id_seq'::regclass);
 8   ALTER TABLE public.cargos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    197            �
           2604    16549 
   cidades id    DEFAULT     h   ALTER TABLE ONLY public.cidades ALTER COLUMN id SET DEFAULT nextval('public.cidades_id_seq'::regclass);
 9   ALTER TABLE public.cidades ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    199            �
           2604    16550    lojas id    DEFAULT     d   ALTER TABLE ONLY public.lojas ALTER COLUMN id SET DEFAULT nextval('public.lojas_id_seq'::regclass);
 7   ALTER TABLE public.lojas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204            �
           2604    16551    produtos id    DEFAULT     j   ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);
 :   ALTER TABLE public.produtos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            �
           2604    16552    tipos_produto id    DEFAULT     t   ALTER TABLE ONLY public.tipos_produto ALTER COLUMN id SET DEFAULT nextval('public.tipos_produto_id_seq'::regclass);
 ?   ALTER TABLE public.tipos_produto ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            �
           2604    16553 	   vendas id    DEFAULT     f   ALTER TABLE ONLY public.vendas ALTER COLUMN id SET DEFAULT nextval('public.vendas_id_seq'::regclass);
 8   ALTER TABLE public.vendas ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210            p          0    16505    cargos 
   TABLE DATA                     public       postgres    false    197   ^       r          0    16510    cidades 
   TABLE DATA                     public       postgres    false    199   �^       t          0    16515    estoque 
   TABLE DATA                     public       postgres    false    201    _       u          0    16518    funcionarios 
   TABLE DATA                     public       postgres    false    202   �_       v          0    16522 
   item_venda 
   TABLE DATA                     public       postgres    false    203   y`       w          0    16525    lojas 
   TABLE DATA                     public       postgres    false    204   a       y          0    16530    produtos 
   TABLE DATA                     public       postgres    false    206   �a       {          0    16535    tipos_produto 
   TABLE DATA                     public       postgres    false    208   lb       }          0    16543    vendas 
   TABLE DATA                     public       postgres    false    210   Nc       �           0    0    cargos_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cargos_id_seq', 2, true);
            public       postgres    false    198            �           0    0    cidades_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.cidades_id_seq', 4, true);
            public       postgres    false    200            �           0    0    lojas_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.lojas_id_seq', 7, true);
            public       postgres    false    205            �           0    0    produtos_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.produtos_id_seq', 26, true);
            public       postgres    false    207            �           0    0    tipos_produto_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tipos_produto_id_seq', 12, true);
            public       postgres    false    209            �           0    0    vendas_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.vendas_id_seq', 6, true);
            public       postgres    false    211            �
           2606    16555    cidades Nome da cidade 
   CONSTRAINT     b   ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT "Nome da cidade" UNIQUE (nome) INCLUDE (nome);
 B   ALTER TABLE ONLY public.cidades DROP CONSTRAINT "Nome da cidade";
       public         postgres    false    199    199            �
           2606    16557    cargos Nome unico 
   CONSTRAINT     ]   ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT "Nome unico" UNIQUE (nome) INCLUDE (nome);
 =   ALTER TABLE ONLY public.cargos DROP CONSTRAINT "Nome unico";
       public         postgres    false    197    197            �
           2606    16559    tipos_produto Nome é unico 
   CONSTRAINT     g   ALTER TABLE ONLY public.tipos_produto
    ADD CONSTRAINT "Nome é unico" UNIQUE (nome) INCLUDE (nome);
 G   ALTER TABLE ONLY public.tipos_produto DROP CONSTRAINT "Nome é unico";
       public         postgres    false    208    208            �
           2606    16561    cargos cargos_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.cargos DROP CONSTRAINT cargos_pkey;
       public         postgres    false    197            �
           2606    16563    cidades cidades_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cidades DROP CONSTRAINT cidades_pkey;
       public         postgres    false    199            �
           2606    16565    estoque estoque_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (produto, loja);
 >   ALTER TABLE ONLY public.estoque DROP CONSTRAINT estoque_pkey;
       public         postgres    false    201    201            �
           2606    16567    funcionarios funcionarios_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (cpf);
 H   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_pkey;
       public         postgres    false    202            �
           2606    16569    item_venda item_venda_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT item_venda_pkey PRIMARY KEY (produto, venda);
 D   ALTER TABLE ONLY public.item_venda DROP CONSTRAINT item_venda_pkey;
       public         postgres    false    203    203            �
           2606    16571    lojas lojas_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.lojas
    ADD CONSTRAINT lojas_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.lojas DROP CONSTRAINT lojas_pkey;
       public         postgres    false    204            �
           2606    16573    produtos nome é unico 
   CONSTRAINT     b   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT "nome é unico" UNIQUE (nome) INCLUDE (nome);
 B   ALTER TABLE ONLY public.produtos DROP CONSTRAINT "nome é unico";
       public         postgres    false    206    206            �
           2606    16575    produtos produtos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.produtos DROP CONSTRAINT produtos_pkey;
       public         postgres    false    206            �
           2606    16577    funcionarios rg é unico 
   CONSTRAINT     `   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT "rg é unico" UNIQUE (rg) INCLUDE (rg);
 D   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT "rg é unico";
       public         postgres    false    202    202            �
           2606    16579     tipos_produto tipos_produto_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tipos_produto
    ADD CONSTRAINT tipos_produto_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.tipos_produto DROP CONSTRAINT tipos_produto_pkey;
       public         postgres    false    208            �
           2606    16581    vendas vendas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.vendas DROP CONSTRAINT vendas_pkey;
       public         postgres    false    210            o           2618    16656    vendas_view _RETURN    RULE     �  CREATE OR REPLACE VIEW public.vendas_view AS
 SELECT vendas.id,
    funcionarios.nome AS funcionario,
    vendas.cpf_funcionario,
    vendas.cpf_cliente,
    vendas.data,
    sum(item_venda.preco_unitario) AS valor_total
   FROM ((public.item_venda
     JOIN public.vendas ON ((item_venda.venda = vendas.id)))
     JOIN public.funcionarios ON ((vendas.cpf_funcionario = funcionarios.cpf)))
  GROUP BY item_venda.venda, funcionarios.nome, vendas.id;
 �   CREATE OR REPLACE VIEW public.vendas_view AS
SELECT
    NULL::integer AS id,
    NULL::character varying(50) AS funcionario,
    NULL::integer AS cpf_funcionario,
    NULL::integer AS cpf_cliente,
    NULL::date AS data,
    NULL::money AS valor_total;
       public       postgres    false    202    202    203    203    210    210    210    210    2791    218            �
           2606    16582    lojas cidade    FK CONSTRAINT     �   ALTER TABLE ONLY public.lojas
    ADD CONSTRAINT cidade FOREIGN KEY (cidade) REFERENCES public.cidades(id) ON UPDATE CASCADE ON DELETE CASCADE;
 6   ALTER TABLE ONLY public.lojas DROP CONSTRAINT cidade;
       public       postgres    false    199    2771    204            �
           2606    16587    estoque estoque_loja_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_loja_fkey FOREIGN KEY (loja) REFERENCES public.lojas(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 C   ALTER TABLE ONLY public.estoque DROP CONSTRAINT estoque_loja_fkey;
       public       postgres    false    201    2781    204            �
           2606    16592    estoque estoque_produto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_produto_fkey FOREIGN KEY (produto) REFERENCES public.produtos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 F   ALTER TABLE ONLY public.estoque DROP CONSTRAINT estoque_produto_fkey;
       public       postgres    false    206    2785    201            �
           2606    16597 "   vendas funcionario -> funcionarios    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT "funcionario -> funcionarios" FOREIGN KEY (cpf_funcionario) REFERENCES public.funcionarios(cpf) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.vendas DROP CONSTRAINT "funcionario -> funcionarios";
       public       postgres    false    210    2775    202            �
           2606    16658 "   funcionarios identificador da loja    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT "identificador da loja" FOREIGN KEY (loja) REFERENCES public.lojas(id) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT "identificador da loja";
       public       postgres    false    2781    202    204            �
           2606    16602 #   funcionarios identificador do cargo    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT "identificador do cargo" FOREIGN KEY (cargo) REFERENCES public.cargos(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT "identificador do cargo";
       public       postgres    false    197    202    2767            �
           2606    16607 "   item_venda item_venda_produto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT item_venda_produto_fkey FOREIGN KEY (produto) REFERENCES public.produtos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public.item_venda DROP CONSTRAINT item_venda_produto_fkey;
       public       postgres    false    203    206    2785            �
           2606    16612 &   produtos tipo referencia tipos_produto    FK CONSTRAINT     �   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT "tipo referencia tipos_produto" FOREIGN KEY (tipo) REFERENCES public.tipos_produto(id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.produtos DROP CONSTRAINT "tipo referencia tipos_produto";
       public       postgres    false    2789    206    208            p   m   x���v
Q���W((M��L�KN,J�/V��L�Q���M�Q(N�I,���Ts�	uV�0�QPwK���K�,�W�Q04մ��$�(#�Q�9�%E�ə�%�@�L���qq vR.P      r   p   x���v
Q���W((M��L�K�LILI-V��L�Q���M�Q(M�Ts�	uV�0�QPH��/I,V2���5��<I6��73_��(1/%��L�z��Ks�qq -�?[      t   z   x���v
Q���W((M��L�K-.�/,MU�((�O)-��Q���J�Q(,M�+�LILI�Ts�	uV�02�Q0�Q04Ҵ���(C�Q�T0�l�1Lz��=��h5�ɘj&��M�� .���      u   �   x����j�0 �{�B���l'��S=d�֟��8�#���l�_�z)c����>�����P5�W����u7{�Ы�0B�U����`�c,�VM�C��}��k�5��qI��)X�M���Z�i[w{�8��emD�2�e!E^0�B�9��fS>qA��ͱ�La���@�r��T�R���7!�-7�uw�t��nyY��]���q�B�7q���\
�'t��J�ܪ      v   �   x���v
Q���W((M��L��,I͍/K�KIT�((�O)-��Q �u
K�J2SSRu
�R���K�2K�2�5�}B]�4�tu�t�U,uL��5��<i`�!��2��U`{�AV���6 �e�v��� :��      w   �   x����
�@E�~�ݩ0�Ԣ��!�ڏ�3�GF���{Ҫ}�{��p��H/%��<c�+��+m;9"h�@�*�H���sV��R��-��f�d��l�[r����@$��:�����Gi�_�������䨚����;��� э#eY���[�85`�O��뽤x�MiS�      y   �   x���v
Q���W((M��L�+(�O)-�/V��L�Q���M�Q(�,��Q((JM��Ts�	uV�02�QP��M,.I-R�Q0rU,uL��5��<)1��pC��n�l�Ս7F1ޘ�曠�oBu��,0E��j *+�t      {   �   x����j�0��y
�҂	8a��S)=J7�nסYvjp##;{��e��d�������v��ty��|o��#��(LKf�xR0��* ��x�������p�̓�v��,��wÕ�0���pj����?�ca�b���E��`���X_!+3+��t]���X��[����A��_�M�&G�v�)�)�:irkx�����*z]�Z�����ţ�      }   �   x���M�0���>����
�jЩ��A�u��MȔ�>B��˂��\~���s�jN0L�Λ�����z�������}��c�zԟm:���2������`�L0�����:�` �q!�l�T<��q��[�D\�/�⿜�͑��\H�Kb3��l޼�     