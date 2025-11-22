const driver = require('./conexao');

async function main() {
  const session = driver.session();
  try {
    await session.run('MATCH (n) DETACH DELETE n');
    // Para poupar espaço aqui, você pode simplesmente ler o arquivo init_medical.cypher
    // e rodar session.run(cypherString). Simples alternativa: copie/cole os comandos do .cypher
    console.log('Limpeza concluída. Agora cole os comandos do init_medical.cypher se desejar executar via JS.');
  } catch (err) {
    console.error(err);
  } finally {
    await session.close();
    await driver.close();
  }
}

main();

