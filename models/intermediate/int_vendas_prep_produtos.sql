with 
    /* chamada dos modelos necessarios */
    categorias as (
        select *
        from {{ ref('stg_erp_northwind__categorias') }}
    ),

    fornecedores as (
        select *
        from {{ ref('stg_erp_northwind__fornecedores') }}
    ),

    produtos as (
        select *
        from {{ ref('stg_erp_northwind__produtos') }}
    ),

    enriquecer_produtos as (
        select 
            PK_PRODUTO,
            produtos.NOME_PRODUTO,
            produtos.QUANTIDADE_POR_UNIDADE,
            produtos.PRECO_POR_UNIDADE,
            produtos.UNIDADE_EM_ESTOQUE,
            produtos.UNIDADE_POR_PEDIDO,
            produtos.NIVER_DE_PEDIDO,
            produtos.DISCONTINUADO,
            categorias.NOME_CATEGORIA,
            fornecedores.NOME_FORNECEDOR,
            fornecedores.CIDADE_FORNECEDOR,
            fornecedores.PAIS_FORNECDOR
        from produtos
        left join categorias on produtos.fk_categoria = categorias.pk_categoria
        left join fornecedores on produtos.fk_fornecedor = fornecedores.pk_forncedor

    )

    select * 
    from enriquecer_produtos