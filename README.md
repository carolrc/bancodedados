PROJETO INDIVIDUAL Módulo 4 – Sistema Resilia

Contexto
A Resilia está pensando em lançar um novo sistema de acompanhamento e para isso precisa de ajuda para modelar um banco de dados que vai armazenar seus cursos, turmas e alunos.

O que é para fazer?
Para apoiar nesse sistema recebemos a tarefa de realizar essa modelagem e responder algumas perguntas com nosso modelo:

📑 Resoluções
Quanto às respostas das perguntas:

<strong>1) Existem outras entidades além dessas três?</strong>


Sim. No modelo criado para a solução deste minimundo, foram criadas também as entidades:

• "Unidade", referente à unidade escolar que irá aplicar os cursos;
• "Matrícula", referente ao código de cada aluno;
• "Professores", referente ao professor que irá ministrar as aulas.

<strong>2) Quais são os principais campos e tipos?</strong>


• Entidade Unidade(id int primary key auto_increment, endereco varchar(200) not null;

• Entidade Professor(id int primary key auto_increment, nome varchar(100) not null;

• Entidade Aluno( id int primary key auto_increment, nome varchar(100) not null;

• Entidade Curso(id int primary key auto_increment, nome varchar(100) not null;

• Entidade Turma(id int primary key auto_increment, int not null;

• Entidade Matrícula(id int primary key auto_increment.

<strong>3) Como essas entidades estão relacionadas?</strong>


Cardinalidade:

Unidade pode fornecer um ou vários cursos;

Curso pertence a um e somente uma Unidade;

Curso pode produzir uma ou várias turmas;

Turma pertence a um e somente um curso;

Turma contém um ou vários alunos;

Turma contém um professor;

Alunos contém um ou vários cursos;

Alunos contém uma Matrícula.



![individual4](https://user-images.githubusercontent.com/113737080/222295059-f308f463-d067-4615-8e93-58d2201a3f02.png)





🔧 Tecnologias utilizadas
🐬 MySQL Workbench - MySQL

🤝 Colaboradores
👩🏻‍💻 Trabalho autoral de Carolina Rocha

🎯 Status do projeto
Projeto finalizado.
