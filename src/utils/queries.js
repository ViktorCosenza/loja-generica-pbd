const knex = require('../config/server')

const simpleSelect = (tableName, columns = '*') => knex.select(columns).from(tableName)

const simpleInsert = (tableName, data) => knex.insert(data).into(tableName)

const simpleDelete = (tableName, where) => knex(tableName).where(where).del()

const simpleUpdate = (tableName, where, data) => knex(tableName).where(where).update(data)

const queries = {
  select: {
    tipos: () => simpleSelect('tipos_produto'),
    products: () => simpleSelect('produtos'),
    cargos: () => simpleSelect('cargos')
  },
  insert: {
    products: data => simpleInsert('produtos', data),
    cargos: data => simpleInsert('cargos', data),
    tipos: data => simpleInsert('tipos_produto', data)
  },
  del: {
    tipos: where => simpleDelete('tipos_produto', where),
    products: where => simpleDelete('produtos', where),
    cargos: where => simpleDelete('cargos', where)
  },
  update: {
    tipos: (data, where) => simpleUpdate('tipos_produto', where, data),
    products: (data, where) => simpleUpdate('produtos', where, data),
    cargos: (data, where) => simpleUpdate('cargos', where, data)
  }
}

module.exports = queries
