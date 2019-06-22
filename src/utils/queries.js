const knex = require('../config/server')

const simpleSelect = (tableName, where = {}) =>
  knex(tableName).where(where).select('*')

const simpleInsert = (tableName, data) => knex.insert(data).into(tableName)

const simpleDelete = (tableName, where) => knex(tableName).where(where).del()

const simpleUpdate = (tableName, where, data) => knex(tableName).where(where).update(data)

const queries = {
  select: {
    tipos: where => simpleSelect('tipos_produto', where),
    products: where => simpleSelect('produto_com_tipo', where),
    cargos: where => simpleSelect('cargos', where),
    funcionarios: where => simpleSelect('funcionarios_cargo', where),
    lojas: where => simpleSelect('loja_cidade', where),
    cidades: where => simpleSelect('cidades', where),
    estoque: where => simpleSelect('estoque_detalhado', where),
    vendas: where => simpleSelect('vendas_view', where),
    itemVenda: where => simpleSelect('item_venda_view', where)
  },
  insert: {
    products: data => simpleInsert('produtos', data),
    cargos: data => simpleInsert('cargos', data),
    tipos: data => simpleInsert('tipos_produto', data),
    funcionarios: data => simpleInsert('funcionarios', data),
    lojas: data => simpleInsert('lojas', data),
    cidades: data => simpleInsert('cidades', data),
    estoque: data => simpleInsert('estoque', data),
    vendas: data => simpleInsert('vendas_view', data),
    itemVenda: data => simpleInsert('item_venda', data)
  },
  del: {
    tipos: where => simpleDelete('tipos_produto', where),
    products: where => simpleDelete('produtos', where),
    funcionarios: where => simpleDelete('funcionarios', where),
    cargos: where => simpleDelete('cargos', where),
    lojas: where => simpleDelete('lojas', where),
    cidades: where => simpleDelete('cidades', where),
    estoque: where => simpleDelete('estoque', where),
    vendas: where => simpleDelete('vendas_view', where),
    itemVenda: where => simpleDelete('item_venda', where)
  },
  update: {
    tipos: (data, where) => simpleUpdate('tipos_produto', where, data),
    products: (data, where) => simpleUpdate('produtos', where, data),
    cargos: (data, where) => simpleUpdate('cargos', where, data),
    funcionarios: (data, where) => simpleUpdate('funcionarios', where, data),
    lojas: (data, where) => simpleUpdate('lojas', where, data),
    cidades: (data, where) => simpleUpdate('cidades', where, data),
    estoque: (data, where) => simpleUpdate('estoque', where, data),
    vendas: (data, where) => simpleUpdate('vendas_view', where, data),
    itemVenda: (data, where) => simpleUpdate('item_venda', where, data)
  }
}

module.exports = queries
