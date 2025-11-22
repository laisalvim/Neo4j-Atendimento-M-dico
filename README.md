# Neo4j-Atendimento-M-dico

Repositório com:
- Script Cypher para modelar e popular um sistema de atendimento médico.
- Consultas solicitadas no exercício.
- API Node.js simples e página para visualizar o grafo.

## Como usar (local com Docker)

1. Iniciar Neo4j (veja `docker-run.sh`) ou usar Neo4j Aura / Sandbox:
   - Usando Docker (Linux/Mac/Windows WSL):
     ```bash
     bash docker-run.sh
     ```
   - Abra http://localhost:7474 e acesse com usuário `neo4j` e senha `senha123`.

2. No browser do Neo4j (http://localhost:7474/browser/), abra `cypher/init_medical.cypher`
   - Cole e execute todo o script para criar os nós e relacionamentos.

3. Para testar as queries:
   - Cole as consultas do arquivo `cypher/queries.cypher` no browser do Neo4j.

4. Rodar API Node.js:
   ```bash
   cd node
   npm install
   node load.js   # carrega dados via JS (se quiser)
   node server.js
   # depois abra http://localhost:3000 para ver a página / endpoints
