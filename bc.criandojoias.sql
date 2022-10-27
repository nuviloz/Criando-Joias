-- Apaga o banco de dados caso ele exista:
-- Isso é útil em "tempo de desenvolvimento".
-- Quando o aplicativo estiver pronto, isso NUNCA deve ser usado.
DROP DATABASE IF EXISTS criandojoias;

-- Recria o banco de dados:
-- CHARACTER SET utf8 especifica que o banco de dados use a tabela UTF-8.
-- COLLATE utf8_general_ci especifica que as buscas serão "case-insensitive".
CREATE DATABASE criandojoias; CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona banco de dados:
-- Todas as ações seguintes se referem a este banco de dados, até que outro
-- "USE nomedodb" seja encontrado.
USE criandojoias;

-- Cria a tabela users:
CREATE TABLE users (
    uid INT PRIMARY KEY AUTO_INCREMENT,
    udate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    photo VARCHAR(255),
    birth DATE,
    bio TEXT,
    type ENUM('admin', 'author', 'moderator', 'user') DEFAULT 'user',
    last_login DATETIME,
    ustatus ENUM('online', 'offline', 'deleted', 'banned') DEFAULT 'online'
);

-- Cadastra alguns usuários para testes:
INSERT INTO users (
    -- Listamos somente os campos onde queremos inserir dados.
    -- Os outros campos já inserem automaticamente, valores padrão (DEFAULT).
    uid,
    name,
    email,
    password,
    photo,
    birth,
    bio,
    type
) VALUES (
    -- Dados a serem inseridos nos campos.
    -- Muito cuidado com a ordem e a quantidade de dados,
    -- elas devem coincidir com os campos acima.
    '1',
    'Joca da Silva',
    'joca@silva.com',

    -- A senha será criptografada pela função SHA1 antes de ser inserida.
    SHA1('senha123'),
 
    -- Não vamos inserir a imagem diretamente no banco de dados.
    -- Buscamos a imagem pela URL dela.
    'https://randomuser.me/api/portraits/men/14.jpg',

    -- Lembre-se de sempre inserir datas e números no formato correto.
    '1990-12-14',
    'Pintor, programador, escultor e enrolador.',

    -- O campo "type" é do tipo ENUM e aceita somente os valores da lista.
    'author'
);
