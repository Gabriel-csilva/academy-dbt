with
    fonte as (
        select *
        from {{ source('erp_northwind', 'suppliers') }}
    ),

    renomeado as (
        select
            cast(ID AS int) as pk_forncedor,
            cast(COMPANYNAME as string) as nome_fornecedor,
            cast(CITY as string) as cidade_fornecedor,
            cast(COUNTRY as string) as pais_fornecdor
        from fonte
    )

    select *
    from renomeado
