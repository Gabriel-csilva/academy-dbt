with
    fonte as (
        select *
        from {{ source('erp_northwind', 'products') }}
    ),

    renomeado as (
        select
            cast(ID AS int) as pk_produto,
            cast(SUPPLIERID as int) as fk_fornecedor,
            cast(CATEGORYID as int) as fk_categoria,
            cast(PRODUCTNAME as string) as nome_produto,
            cast(QUANTITYPERUNIT as string) as quantidade_por_unidade,
            cast(UNITPRICE as numeric(18,2)) as preco_por_unidade,
            cast(UNITSINSTOCK as int) as unidade_em_estoque,
            cast(UNITSONORDER as int) as unidade_por_pedido,
            cast(REORDERLEVEL as int) as niver_de_pedido,
            DISCONTINUED as discontinuado
        from fonte
    )

    select *
    from renomeado