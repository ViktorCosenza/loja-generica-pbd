PGDMP                          w            d9r6e5sj3mi49d     11.2 (Ubuntu 11.2-1.pgdg16.04+1)    11.3 F    T           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            U           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            V           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            W           1262    14426317    d9r6e5sj3mi49d    DATABASE     �   CREATE DATABASE d9r6e5sj3mi49d WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE d9r6e5sj3mi49d;
             kyzewjzcrsocix    false            X           0    0    DATABASE d9r6e5sj3mi49d    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE d9r6e5sj3mi49d FROM PUBLIC;
                  kyzewjzcrsocix    false    3927            Y           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO kyzewjzcrsocix;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  kyzewjzcrsocix    false    3            Z           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO kyzewjzcrsocix;
                  postgres    false    637            �            1259    14797712    cargos    TABLE        CREATE TABLE public.cargos (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    salario integer NOT NULL
);
    DROP TABLE public.cargos;
       public         kyzewjzcrsocix    false            �            1259    14797710    cargos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cargos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.cargos_id_seq;
       public       kyzewjzcrsocix    false    201            [           0    0    cargos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.cargos_id_seq OWNED BY public.cargos.id;
            public       kyzewjzcrsocix    false    200            �            1259    14795346    cidades    TABLE     �   CREATE TABLE public.cidades (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    uf character(2) NOT NULL
);
    DROP TABLE public.cidades;
       public         kyzewjzcrsocix    false            �            1259    14795344    cidades_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cidades_id_seq;
       public       kyzewjzcrsocix    false    197            \           0    0    cidades_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cidades_id_seq OWNED BY public.cidades.id;
            public       kyzewjzcrsocix    false    196            �            1259    14823084    estoque    TABLE     z   CREATE TABLE public.estoque (
    produto integer NOT NULL,
    loja integer NOT NULL,
    quantidade integer NOT NULL
);
    DROP TABLE public.estoque;
       public         kyzewjzcrsocix    false            �            1259    14798759    funcionarios    TABLE     $  CREATE TABLE public.funcionarios (
    cargo integer NOT NULL,
    nome character varying(50) NOT NULL,
    cpf integer NOT NULL,
    rg integer NOT NULL,
    data_contratacao date NOT NULL,
    data_demissao date,
    ativo boolean DEFAULT true NOT NULL,
    genero character(1) NOT NULL
);
     DROP TABLE public.funcionarios;
       public         kyzewjzcrsocix    false            �            1259    14823661 
   item_venda    TABLE     �   CREATE TABLE public.item_venda (
    produto integer NOT NULL,
    venda integer NOT NULL,
    quantidade integer NOT NULL,
    preco_unitario money NOT NULL
);
    DROP TABLE public.item_venda;
       public         kyzewjzcrsocix    false            �            1259    14796569    lojas    TABLE     �   CREATE TABLE public.lojas (
    id integer NOT NULL,
    cidade integer NOT NULL,
    bairro character varying(30) NOT NULL,
    rua character varying(50) NOT NULL,
    numero integer NOT NULL,
    complemento character varying(100)
);
    DROP TABLE public.lojas;
       public         kyzewjzcrsocix    false            �            1259    14796567    lojas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lojas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.lojas_id_seq;
       public       kyzewjzcrsocix    false    199            ]           0    0    lojas_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.lojas_id_seq OWNED BY public.lojas.id;
            public       kyzewjzcrsocix    false    198            �            1259    14809034    produtos    TABLE     �   CREATE TABLE public.produtos (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    tipo integer NOT NULL,
    preco money NOT NULL
);
    DROP TABLE public.produtos;
       public         kyzewjzcrsocix    false            �            1259    14809032    produtos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.produtos_id_seq;
       public       kyzewjzcrsocix    false    206            ^           0    0    produtos_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;
            public       kyzewjzcrsocix    false    205            �            1259    14807737    tipos_produto    TABLE     �   CREATE TABLE public.tipos_produto (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    descricao text NOT NULL
);
 !   DROP TABLE public.tipos_produto;
       public         kyzewjzcrsocix    false            �            1259    14807735    tipos_produto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipos_produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tipos_produto_id_seq;
       public       kyzewjzcrsocix    false    204            _           0    0    tipos_produto_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tipos_produto_id_seq OWNED BY public.tipos_produto.id;
            public       kyzewjzcrsocix    false    203            �            1259    14822354    vendas    TABLE     �   CREATE TABLE public.vendas (
    id integer NOT NULL,
    cpf_funcionario integer NOT NULL,
    data date NOT NULL,
    cpf_cliente integer NOT NULL
);
    DROP TABLE public.vendas;
       public         kyzewjzcrsocix    false            �            1259    14822352    vendas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vendas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.vendas_id_seq;
       public       kyzewjzcrsocix    false    208            `           0    0    vendas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.vendas_id_seq OWNED BY public.vendas.id;
            public       kyzewjzcrsocix    false    207            �           2604    14797715 	   cargos id    DEFAULT     f   ALTER TABLE ONLY public.cargos ALTER COLUMN id SET DEFAULT nextval('public.cargos_id_seq'::regclass);
 8   ALTER TABLE public.cargos ALTER COLUMN id DROP DEFAULT;
       public       kyzewjzcrsocix    false    201    200    201            �           2604    14795349 
   cidades id    DEFAULT     h   ALTER TABLE ONLY public.cidades ALTER COLUMN id SET DEFAULT nextval('public.cidades_id_seq'::regclass);
 9   ALTER TABLE public.cidades ALTER COLUMN id DROP DEFAULT;
       public       kyzewjzcrsocix    false    197    196    197            �           2604    14796572    lojas id    DEFAULT     d   ALTER TABLE ONLY public.lojas ALTER COLUMN id SET DEFAULT nextval('public.lojas_id_seq'::regclass);
 7   ALTER TABLE public.lojas ALTER COLUMN id DROP DEFAULT;
       public       kyzewjzcrsocix    false    198    199    199            �           2604    14809037    produtos id    DEFAULT     j   ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);
 :   ALTER TABLE public.produtos ALTER COLUMN id DROP DEFAULT;
       public       kyzewjzcrsocix    false    206    205    206            �           2604    14807740    tipos_produto id    DEFAULT     t   ALTER TABLE ONLY public.tipos_produto ALTER COLUMN id SET DEFAULT nextval('public.tipos_produto_id_seq'::regclass);
 ?   ALTER TABLE public.tipos_produto ALTER COLUMN id DROP DEFAULT;
       public       kyzewjzcrsocix    false    203    204    204            �           2604    14822357 	   vendas id    DEFAULT     f   ALTER TABLE ONLY public.vendas ALTER COLUMN id SET DEFAULT nextval('public.vendas_id_seq'::regclass);
 8   ALTER TABLE public.vendas ALTER COLUMN id DROP DEFAULT;
       public       kyzewjzcrsocix    false    208    207    208            H          0    14797712    cargos 
   TABLE DATA               3   COPY public.cargos (id, nome, salario) FROM stdin;
    public       kyzewjzcrsocix    false    201   jO       D          0    14795346    cidades 
   TABLE DATA               /   COPY public.cidades (id, nome, uf) FROM stdin;
    public       kyzewjzcrsocix    false    197   �O       P          0    14823084    estoque 
   TABLE DATA               <   COPY public.estoque (produto, loja, quantidade) FROM stdin;
    public       kyzewjzcrsocix    false    209   �O       I          0    14798759    funcionarios 
   TABLE DATA               l   COPY public.funcionarios (cargo, nome, cpf, rg, data_contratacao, data_demissao, ativo, genero) FROM stdin;
    public       kyzewjzcrsocix    false    202   P       Q          0    14823661 
   item_venda 
   TABLE DATA               P   COPY public.item_venda (produto, venda, quantidade, preco_unitario) FROM stdin;
    public       kyzewjzcrsocix    false    210   -P       F          0    14796569    lojas 
   TABLE DATA               M   COPY public.lojas (id, cidade, bairro, rua, numero, complemento) FROM stdin;
    public       kyzewjzcrsocix    false    199   JP       M          0    14809034    produtos 
   TABLE DATA               9   COPY public.produtos (id, nome, tipo, preco) FROM stdin;
    public       kyzewjzcrsocix    false    206   �P       K          0    14807737    tipos_produto 
   TABLE DATA               <   COPY public.tipos_produto (id, nome, descricao) FROM stdin;
    public       kyzewjzcrsocix    false    204   �P       O          0    14822354    vendas 
   TABLE DATA               H   COPY public.vendas (id, cpf_funcionario, data, cpf_cliente) FROM stdin;
    public       kyzewjzcrsocix    false    208   #Q       a           0    0    cargos_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cargos_id_seq', 3, true);
            public       kyzewjzcrsocix    false    200            b           0    0    cidades_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.cidades_id_seq', 3, true);
            public       kyzewjzcrsocix    false    196            c           0    0    lojas_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.lojas_id_seq', 3, true);
            public       kyzewjzcrsocix    false    198            d           0    0    produtos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.produtos_id_seq', 1, true);
            public       kyzewjzcrsocix    false    205            e           0    0    tipos_produto_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tipos_produto_id_seq', 1, true);
            public       kyzewjzcrsocix    false    203            f           0    0    vendas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.vendas_id_seq', 1, false);
            public       kyzewjzcrsocix    false    207            �           2606    14795353    cidades Nome da cidade 
   CONSTRAINT     b   ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT "Nome da cidade" UNIQUE (nome) INCLUDE (nome);
 B   ALTER TABLE ONLY public.cidades DROP CONSTRAINT "Nome da cidade";
       public         kyzewjzcrsocix    false    197    197            �           2606    14797719    cargos Nome unico 
   CONSTRAINT     ]   ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT "Nome unico" UNIQUE (nome) INCLUDE (nome);
 =   ALTER TABLE ONLY public.cargos DROP CONSTRAINT "Nome unico";
       public         kyzewjzcrsocix    false    201    201            �           2606    14807747    tipos_produto Nome é unico 
   CONSTRAINT     g   ALTER TABLE ONLY public.tipos_produto
    ADD CONSTRAINT "Nome é unico" UNIQUE (nome) INCLUDE (nome);
 G   ALTER TABLE ONLY public.tipos_produto DROP CONSTRAINT "Nome é unico";
       public         kyzewjzcrsocix    false    204    204            �           2606    14797717    cargos cargos_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.cargos DROP CONSTRAINT cargos_pkey;
       public         kyzewjzcrsocix    false    201            �           2606    14795351    cidades cidades_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cidades DROP CONSTRAINT cidades_pkey;
       public         kyzewjzcrsocix    false    197            �           2606    14823088    estoque estoque_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (produto, loja);
 >   ALTER TABLE ONLY public.estoque DROP CONSTRAINT estoque_pkey;
       public         kyzewjzcrsocix    false    209    209            �           2606    14798764    funcionarios funcionarios_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (cpf);
 H   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_pkey;
       public         kyzewjzcrsocix    false    202            �           2606    14823665    item_venda item_venda_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT item_venda_pkey PRIMARY KEY (produto, venda);
 D   ALTER TABLE ONLY public.item_venda DROP CONSTRAINT item_venda_pkey;
       public         kyzewjzcrsocix    false    210    210            �           2606    14796574    lojas lojas_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.lojas
    ADD CONSTRAINT lojas_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.lojas DROP CONSTRAINT lojas_pkey;
       public         kyzewjzcrsocix    false    199            �           2606    14809041    produtos nome é unico 
   CONSTRAINT     b   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT "nome é unico" UNIQUE (nome) INCLUDE (nome);
 B   ALTER TABLE ONLY public.produtos DROP CONSTRAINT "nome é unico";
       public         kyzewjzcrsocix    false    206    206            �           2606    14809039    produtos produtos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.produtos DROP CONSTRAINT produtos_pkey;
       public         kyzewjzcrsocix    false    206            �           2606    14798766    funcionarios rg é unico 
   CONSTRAINT     `   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT "rg é unico" UNIQUE (rg) INCLUDE (rg);
 D   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT "rg é unico";
       public         kyzewjzcrsocix    false    202    202            �           2606    14807745     tipos_produto tipos_produto_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tipos_produto
    ADD CONSTRAINT tipos_produto_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.tipos_produto DROP CONSTRAINT tipos_produto_pkey;
       public         kyzewjzcrsocix    false    204            �           2606    14822359    vendas vendas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.vendas DROP CONSTRAINT vendas_pkey;
       public         kyzewjzcrsocix    false    208            �           2606    14796575    lojas cidade    FK CONSTRAINT     �   ALTER TABLE ONLY public.lojas
    ADD CONSTRAINT cidade FOREIGN KEY (cidade) REFERENCES public.cidades(id) ON UPDATE CASCADE ON DELETE CASCADE;
 6   ALTER TABLE ONLY public.lojas DROP CONSTRAINT cidade;
       public       kyzewjzcrsocix    false    3754    197    199            �           2606    14823094    estoque estoque_loja_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_loja_fkey FOREIGN KEY (loja) REFERENCES public.lojas(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 C   ALTER TABLE ONLY public.estoque DROP CONSTRAINT estoque_loja_fkey;
       public       kyzewjzcrsocix    false    199    209    3756            �           2606    14823089    estoque estoque_produto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_produto_fkey FOREIGN KEY (produto) REFERENCES public.produtos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 F   ALTER TABLE ONLY public.estoque DROP CONSTRAINT estoque_produto_fkey;
       public       kyzewjzcrsocix    false    206    209    3772            �           2606    14822360 "   vendas funcionario -> funcionarios    FK CONSTRAINT     �   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT "funcionario -> funcionarios" FOREIGN KEY (cpf_funcionario) REFERENCES public.funcionarios(cpf) ON UPDATE CASCADE ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.vendas DROP CONSTRAINT "funcionario -> funcionarios";
       public       kyzewjzcrsocix    false    202    3762    208            �           2606    14798767 #   funcionarios identificador do cargo    FK CONSTRAINT     �   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT "identificador do cargo" FOREIGN KEY (cargo) REFERENCES public.cargos(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT "identificador do cargo";
       public       kyzewjzcrsocix    false    202    201    3760            �           2606    14823666 "   item_venda item_venda_produto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT item_venda_produto_fkey FOREIGN KEY (produto) REFERENCES public.produtos(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public.item_venda DROP CONSTRAINT item_venda_produto_fkey;
       public       kyzewjzcrsocix    false    210    3772    206            �           2606    14809042 &   produtos tipo referencia tipos_produto    FK CONSTRAINT     �   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT "tipo referencia tipos_produto" FOREIGN KEY (tipo) REFERENCES public.tipos_produto(id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.produtos DROP CONSTRAINT "tipo referencia tipos_produto";
       public       kyzewjzcrsocix    false    204    206    3768            H   1   x�3�t�KO��H�,��4500�2�NM.J-9��(3���(���� ��      D   8   x�3�H��/I,�
�2���Wp/J�KI�9�/�WH,��������� zY<      P      x������ � �      I      x������ � �      Q      x������ � �      F   G   x�3�4�tN�+)��t�IJ-*�W�/N�454���2�4B�v+J�,I,�45�0F�W��Z��=F��� �*v      M   "   x�3���L.���KI,�4�T1ҳ4������ c',      K   @   x�3�t�I-)�O��M-.�L�/��,I�+VH�D
�J��
R���sહb���� ���      O      x������ � �     