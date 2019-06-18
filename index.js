const { PORT } = require('./src/config/env')
const app = require('./src/config/index')

app.listen(PORT, () => {
  console.log('Listening on port ' + PORT)
})
