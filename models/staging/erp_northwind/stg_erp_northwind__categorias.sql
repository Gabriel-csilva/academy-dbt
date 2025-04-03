with
    fonte as (
        select *
        from {{ source('erp_northwind', 'category') }}
    ),

    renomeado as (
        select
            cast(ID AS int) as pk_categoria,
            cast(CATEGORYNAME as string) as nome_categoria,
            cast(DESCRIPTION as string) as descricao_categoria
        from fonte
    )

    select *
    from renomeado