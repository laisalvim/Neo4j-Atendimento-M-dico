const express = require('express');
const driver = require('./conexao');
const path = require('path');

const app = express();
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

// Exemplo de endpoint: listar conexões (médicos que trabalham em hospital X)
app.get('/medicos/por-hospital/:hospital', async (req, res) => {
  const session = driver.session();
  const hospital = req.params.hospital;
  try {
    const result = await session.run(
      `MATCH (m:Medico)-[:ATENDE_EM]->(h:Hospital {nome:$hospital})
       RETURN m.nome AS nome`,
      { hospital }
    );
    res.json(result.records.map(r => r.get('nome')));
  } catch (e) {
    res.status(500).send(e.message);
  } finally {
    await session.close();
  }
});

app.listen(3000, () => console.log('API rodando em http://localhost:3000'));

