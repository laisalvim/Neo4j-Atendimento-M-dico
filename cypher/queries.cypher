// 1) Listar médicos de uma especialidade específica (ex: Pediatra)
MATCH (m:Medico)-[:TEM_ESPECIALIDADE]->(e:Especialidade {nome:"Pediatra"})
RETURN m.nome AS medico;

// 2) Encontrar médicos que aceitam um determinado plano de saúde (ex: Plano B)
MATCH (m:Medico)-[:ACEITA]->(p:Plano {nome:"Plano B"})
RETURN m.nome AS medico;

// 3) Listar hospitais e os médicos que atendem neles
MATCH (m:Medico)-[:ATENDE_EM]->(h:Hospital)
RETURN h.nome AS hospital, collect(m.nome) AS medicos;

// 4) Obter todas as consultas de um paciente (ex: "Paulo Silva")
MATCH (pac:Paciente {nome:"Paulo Silva"})-[:TEVE_CONSULTA]->(c:Consulta)-[:FEITA_POR]->(m:Medico)
RETURN pac.nome AS paciente, c.data AS data_consulta, m.nome AS medico ORDER BY c.data;

// 5) Listar especialidades disponíveis em determinado hospital (ex: Hospital Central)
MATCH (h:Hospital {nome:"Hospital Central"})<-[:ATENDE_EM]-(m:Medico)-[:TEM_ESPECIALIDADE]->(e:Especialidade)
RETURN DISTINCT h.nome AS hospital, collect(DISTINCT e.nome) AS especialidades;

// 6) Listar todos os médicos que podem atender ao plano de saúde de um paciente
// (encontra médico que aceita o plano do paciente)
MATCH (pac:Paciente {nome:"Mariana Costa"})-[:TEM_PLANO]->(pl:Plano)
MATCH (m:Medico)-[:ACEITA]->(pl)
RETURN pac.nome AS paciente, pl.nome AS plano, collect(m.nome) AS medicos;

// 7) Exibir o total de consultas realizadas por médico
MATCH (m:Medico)<-[:FEITA_POR]-(c:Consulta)
RETURN m.nome AS medico, count(c) AS total_consultas
ORDER BY total_consultas DESC;
