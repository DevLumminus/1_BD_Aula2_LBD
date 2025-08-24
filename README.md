# 1_BD_Aula2_LBD
Criação do banco de dados de uma biblioteca (https://ava.catolica.edu.br/content/enforced/117582-GPE02_GPNCETHB11T_GPE02N40121_2025/2/Exerc%C3%ADcio1_20250814223003048.png) no MySQL.

## O que esta sendo usado:
1. MySQL, por meio do Workbench, na linguagem SQL

#### O que já foi aprendido:
1. Uso do IF NOT EXISTS para criação de base de dados.
2. Uso dos tipos de dados CHAR*, VARCHAR*, DATE, INT, BOOLEAN***, YEAR**.
3. PRIMARY KEY já faz o papel de UNIQUE e NOT NULL.
4. RESTRICT para quando não poder usar o NOT NULL.
5. O 🔺 no DER significa que uma tabela (a tabela da ponta superior) se divide em outras.
6. Para mudar o nome da CONSTRAINT é melhor exclui-la e refazer
7. Em um relacionamento vc pode fazer uma PRIMARY KEY de grupo**** para fazer esse relacionamento aparecer somente 1 vez e evitar NULL

*CHAR é para tamanho fixo e VARCHAR é para tamanho variado\
**Usado quando só precisa do ano\
***Usado quando é sim ou não\
****PRIMARY KEY (Autor_ID, Livro_ISBN),
