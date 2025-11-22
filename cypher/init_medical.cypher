// LIMPAR BASE
MATCH (n) DETACH DELETE n;

// ESPECIALIDADES
CREATE (:Especialidade {nome: "Pediatra"});
CREATE (:Especialidade {nome: "Oftalmologista"});
CREATE (:Especialidade {nome: "Cardiologista"});

// MÉDICOS
CREATE (:Medico {nome: "Dr. Carlos"});
CREATE (:Medico {nome: "Dra. Maria"});
CREATE (:Medico {nome: "Dr. Paulo"});
CREATE (:Medico {nome: "Dra. Ana"});
CREATE (:Medico {nome: "Dr. Roberto"});
CREATE (:Medico {nome: "Dra. Luisa"});

// LIGAÇÕES MÉDICO <-> ESPECIALIDADE
MATCH (m:Medico {nome:"Dr. Carlos"}), (e:Especialidade {nome:"Cardiologista"})
CREATE (m)-[:TEM_ESPECIALIDADE]->(e);

MATCH (m:Medico {nome:"Dra. Maria"}), (e:Especialidade {nome:"Pediatra"})
CREATE (m)-[:TEM_ESPECIALIDADE]->(e);

MATCH (m:Medico {nome:"Dr. Paulo"}), (e:Especialidade {nome:"Oftalmologista"})
CREATE (m)-[:TEM_ESPECIALIDADE]->(e);

MATCH (m:Medico {nome:"Dra. Ana"}), (e:Especialidade {nome:"Pediatra"})
CREATE (m)-[:TEM_ESPECIALIDADE]->(e);

MATCH (m:Medico {nome:"Dr. Roberto"}), (e:Especialidade {nome:"Cardiologista"})
CREATE (m)-[:TEM_ESPECIALIDADE]->(e);

MATCH (m:Medico {nome:"Dra. Luisa"}), (e:Especialidade {nome:"Oftalmologista"})
CREATE (m)-[:TEM_ESPECIALIDADE]->(e);

// HOSPITAIS
CREATE (:Hospital {nome:"Hospital Central"});
CREATE (:Hospital {nome:"Hospital São José"});
CREATE (:Hospital {nome:"Hospital da Cidade"});
CREATE (:Hospital {nome:"Clínica Boa Saúde"});
CREATE (:Hospital {nome:"Hospital Santa Maria"});

// MÉDICOS ATENDENDO EM HOSPITAIS
MATCH (m:Medico {nome:"Dr. Carlos"}),(h:Hospital {nome:"Hospital Central"}) CREATE (m)-[:ATENDE_EM]->(h);
MATCH (m:Medico {nome:"Dr. Carlos"}),(h:Hospital {nome:"Hospital São José"}) CREATE (m)-[:ATENDE_EM]->(h);
MATCH (m:Medico {nome:"Dra. Maria"}),(h:Hospital {nome:"Clínica Boa Saúde"}) CREATE (m)-[:ATENDE_EM]->(h);
MATCH (m:Medico {nome:"Dr. Paulo"}),(h:Hospital {nome:"Hospital da Cidade"}) CREATE (m)-[:ATENDE_EM]->(h);
MATCH (m:Medico {nome:"Dra. Ana"}),(h:Hospital {nome:"Hospital Central"}) CREATE (m)-[:ATENDE_EM]->(h);
MATCH (m:Medico {nome:"Dr. Roberto"}),(h:Hospital {nome:"Hospital Santa Maria"}) CREATE (m)-[:ATENDE_EM]->(h);
MATCH (m:Medico {nome:"Dra. Luisa"}),(h:Hospital {nome:"Hospital São José"}) CREATE (m)-[:ATENDE_EM]->(h);

// PLANOS
CREATE (:Plano {nome:"Plano A"});
CREATE (:Plano {nome:"Plano B"});
CREATE (:Plano {nome:"Plano C"});

// MÉDICOS ACEITANDO PLANOS
MATCH (m:Medico {nome:"Dr. Carlos"}),(p:Plano {nome:"Plano A"}) CREATE (m)-[:ACEITA]->(p);
MATCH (m:Medico {nome:"Dr. Carlos"}),(p:Plano {nome:"Plano B"}) CREATE (m)-[:ACEITA]->(p);
MATCH (m:Medico {nome:"Dra. Maria"}),(p:Plano {nome:"Plano B"}) CREATE (m)-[:ACEITA]->(p);
MATCH (m:Medico {nome:"Dr. Paulo"}),(p:Plano {nome:"Plano C"}) CREATE (m)-[:ACEITA]->(p);
MATCH (m:Medico {nome:"Dra. Ana"}),(p:Plano {nome:"Plano A"}) CREATE (m)-[:ACEITA]->(p);
MATCH (m:Medico {nome:"Dr. Roberto"}),(p:Plano {nome:"Plano A"}) CREATE (m)-[:ACEITA]->(p);
MATCH (m:Medico {nome:"Dr. Roberto"}),(p:Plano {nome:"Plano C"}) CREATE (m)-[:ACEITA]->(p);
MATCH (m:Medico {nome:"Dra. Luisa"}),(p:Plano {nome:"Plano B"}) CREATE (m)-[:ACEITA]->(p);

// PACIENTES
CREATE (:Paciente {nome:"Paulo Silva", cpf:"00011122233"});
CREATE (:Paciente {nome:"Mariana Costa", cpf:"11122233344"});
CREATE (:Paciente {nome:"Lucas Alves", cpf:"22233344455"});
CREATE (:Paciente {nome:"Beatriz Rocha", cpf:"33344455566"});
CREATE (:Paciente {nome:"Ricardo Lima", cpf:"44455566677"});

// ASSOCIA PACIENTE -> PLANO
MATCH (pac:Paciente {nome:"Paulo Silva"}),(pl:Plano {nome:"Plano A"}) CREATE (pac)-[:TEM_PLANO]->(pl);
MATCH (pac:Paciente {nome:"Mariana Costa"}),(pl:Plano {nome:"Plano B"}) CREATE (pac)-[:TEM_PLANO]->(pl);
MATCH (pac:Paciente {nome:"Lucas Alves"}),(pl:Plano {nome:"Plano C"}) CREATE (pac)-[:TEM_PLANO]->(pl);
MATCH (pac:Paciente {nome:"Beatriz Rocha"}),(pl:Plano {nome:"Plano A"}) CREATE (pac)-[:TEM_PLANO]->(pl);
MATCH (pac:Paciente {nome:"Ricardo Lima"}),(pl:Plano {nome:"Plano B"}) CREATE (pac)-[:TEM_PLANO]->(pl);

// CONSULTAS (10) com atributo data
CREATE (c1:Consulta {data: date("2025-05-01")});
CREATE (c2:Consulta {data: date("2025-05-03")});
CREATE (c3:Consulta {data: date("2025-05-10")});
CREATE (c4:Consulta {data: date("2025-06-01")});
CREATE (c5:Consulta {data: date("2025-06-05")});
CREATE (c6:Consulta {data: date("2025-06-12")});
CREATE (c7:Consulta {data: date("2025-07-01")});
CREATE (c8:Consulta {data: date("2025-07-02")});
CREATE (c9:Consulta {data: date("2025-07-10")});
CREATE (c10:Consulta {data: date("2025-07-15")});

// LIGA CONSULTAS A PACIENTES E MÉDICOS
MATCH (p:Paciente {nome:"Paulo Silva"}),(c:Consulta {data: date("2025-05-01")}), (m:Medico {nome:"Dr. Carlos"})
CREATE (p)-[:TEVE_CONSULTA]->(c), (c)-[:FEITA_POR]->(m);

MATCH (p:Paciente {nome:"Paulo Silva"}),(c:Consulta {data: date("2025-05-03")}), (m:Medico {nome:"Dra. Maria"})
CREATE (p)-[:TEVE_CONSULTA]->(c), (c)-[:FEITA_POR]->(m);

MATCH (p:Paciente {nome:"Mariana Costa"}),(c:Consulta {data: date("2025-05-10")}), (m:Medico {nome:"Dra. Maria"})
CREATE (p)-[:TEVE_CONSULTA]->(c), (c)-[:FEITA_POR]->(m);

MATCH (p:Paciente {nome:"Lucas Alves"}),(c:Consulta {data: date("2025-06-01")}), (m:Medico {nome:"Dr. Paulo"})
CREATE (p)-[:TEVE_CONSULTA]->(c), (c)-[:FEITA_POR]->(m);

MATCH (p:Paciente {nome:"Beatriz Rocha"}),(c:Consulta {data: date("2025-06-05")}), (m:Medico {nome:"Dra. Ana"})
CREATE (p)-[:TEVE_CONSULTA]->(c), (c)-[:FEITA_POR]->(m);

MATCH (p:Paciente {nome:"Ricardo Lima"}),(c:Consulta {data: date("2025-06-12")}), (m:Medico {nome:"Dr. Roberto"})
CREATE (p)-[:TEVE_CONSULTA]->(c), (c)-[:FEITA_POR]->(m);

MATCH (p:Paciente {nome:"Lucas Alves"}),(c:Consulta {data: date("2025-07-01")}), (m:Medico {nome:"Dr. Carlos"})
CREATE (p)-[:TEVE_CONSULTA]->(c), (c)-[:FEITA_POR]->(m);

MATCH (p:Paciente {nome:"Mariana Costa"}),(c:Consulta {data: date("2025-07-02")}), (m:Medico {nome:"Dra. Luisa"})
CREATE (p)-[:TEVE_CONSULTA]->(c), (c)-[:FEITA_POR]->(m);

MATCH (p:Paciente {nome:"Beatriz Rocha"}),(c:Consulta {data: date("2025-07-10")}), (m:Medico {nome:"Dr. Roberto"})
CREATE (p)-[:TEVE_CONSULTA]->(c), (c)-[:FEITA_POR]->(m);

MATCH (p:Paciente {nome:"Ricardo Lima"}),(c:Consulta {data: date("2025-07-15")}), (m:Medico {nome:"Dra. Ana"})
CREATE (p)-[:TEVE_CONSULTA]->(c), (c)-[:FEITA_POR]->(m);

// Índices simples
CREATE INDEX medico_nome IF NOT EXISTS FOR (m:Medico) ON (m.nome);
CREATE INDEX paciente_nome IF NOT EXISTS FOR (p:Paciente) ON (p.nome);
