with
    fonte as (
        select *
        from {{ source('erp_northwind', 'ORDER_DETAILS') }}
    ),

    renomeado as (
        select
            ORDERID::varchar || '_' || PRODUCTID::varchar as pk_pedido_item,
            cast(ORDERID as int) as fk_pedido,
            cast(PRODUCTID as int) as fk_produto,
            cast(DISCOUNT as numeric) as desconto_perc,
            cast(UNITPRICE as int) as preco_da_unidade,
            cast(QUANTITY as int) as quantidade
            --cast(ID as int) as 
        from fonte
    )

    select *
    from renomeado

