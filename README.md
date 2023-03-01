PROJETO INDIVIDUAL Módulo 4 – Sistema Resilia

Contexto
A Resilia está pensando em lançar um novo sistema de acompanhamento e para isso precisa de ajuda para modelar um banco de dados que vai armazenar seus cursos, turmas e alunos.

O que é para fazer?
Para apoiar nesse sistema recebemos a tarefa de realizar essa modelagem e responder algumas perguntas com nosso modelo:

📑 Resoluções
Quanto às respostas das perguntas:

1) Existem outras entidades além dessas três?
Sim. No modelo criado para a solução deste minimundo, foram criadas também as entidades:
• "Unidade", referente à unidade escolar que irá aplicar os cursos;
• "Matrícula", referente ao código de cada aluno;
• "Professores", referente ao professor que irá ministrar as aulas.

2) Quais são os principais campos e tipos?


• Entidade Unidade(id int primary key auto_increment, nome varchar(100) not null, email varchar(100) not null, telefone varchar(11) not null);

• Entidade Professor(id int primary key auto_increment, nome varchar(100) not null, graduacao varchar(100) not null, email varchar(100) not null, cpf varchar(11) not null);

• Entidade Aluno( id int primary key auto_increment, nome varchar(100) not null, matricula varchar(5) not null, email varchar(100) not null, cpf varchar(11) not null, data_nascimento date not null);

• Entidade Curso(id int primary key auto_increment, nome varchar(100) not null, carga_horaria_total int not null, disciplina_id int not null);

• Entidade Turma(id int primary key auto_increment, nome varchar(100) not null, data_inicio date not null, data_fim date not null, professor_id int not null, curso_id int not null);

• Entidade Matrícula(id int primary key auto_increment, nome varchar(100) not null, email varchar(100) not null, telefone varchar(11) not null);


![individual](https://user-images.githubusercontent.com/113737080/222011027-45a58d90-29b7-41a5-b9ce-f1d246a606c4.png)


🔧 Tecnologias utilizadas
🐬 MySQL Workbench - MySQL

🤝 Colaboradores
👩🏻‍💻 Trabalho autoral de Carolina Rocha

🎯 Status do projeto
Projeto finalizado.
