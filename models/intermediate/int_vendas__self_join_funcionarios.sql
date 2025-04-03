with
    /* chamada dos modelos necessarios */
    funcionarios as (
        select *
        from {{ ref('stg_erp_northwind__funcionarios') }}
    ),

    self_joined as (
        select 
            funcionarios.PK_FUNCIONARIO,
            funcionarios.NOME_FUNCIONARIO,
            funcionarios.CARGO_FUNCIONARIO,
            gerentes.NOME_FUNCIONARIO AS nome_gerente,
            funcionarios.DT_NASCIMENTO_FUNCIONARIO,
            funcionarios.DT_CONTRATACAO,
            funcionarios.CIDADE_FUNCIONARIO,
            funcionarios.REGIAO_FUNCIONARIO,
            funcionarios.PAIS_FUNCIONARIO
        from funcionarios
        left join funcionarios as gerentes 
            ON funcionarios.fk_gerente = gerentes.pk_funcionario
    )

    select *
    from self_joined
