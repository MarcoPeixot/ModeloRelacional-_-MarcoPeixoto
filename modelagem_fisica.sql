-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- Desativei a configuração correspondente no PostgreSQL pois não há uma equivalente direta

-- ---
-- Table 'users'
-- tabela de usuarios da arquitetura tutores
-- ---

DROP TABLE IF EXISTS users CASCADE;
		
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(50),
  senha TEXT
);

COMMENT ON TABLE users IS 'tabela de usuarios da arquitetura tutores';

-- ---
-- Table 'general_forms'
-- Tabela de formulario geral da arquitetura formularios
-- ---

DROP TABLE IF EXISTS general_forms CASCADE;
		
CREATE TABLE general_forms (
  id SERIAL PRIMARY KEY,
  date_of_birth DATE,
  gender VARCHAR(30),
  education VARCHAR(30),
  type_of_housing VARCHAR(30),
  family_constitution VARCHAR(50),
  income DECIMAL,
  live_in_the_house INTEGER,
  address VARCHAR(30),
  choice_of_form VARCHAR(30),
  id_users INTEGER REFERENCES users(id)
);

COMMENT ON TABLE general_forms IS 'Tabela de formulario geral da arquitetura formularios';

-- ---
-- Table 'user_forms'
-- tabela para salvar os dados do usuario na arquitetura formularios
-- ---

DROP TABLE IF EXISTS user_forms CASCADE;
		
CREATE TABLE user_forms (
  id SERIAL PRIMARY KEY,
  social_name VARCHAR(30),
  cellphone BIGINT,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  id_users INTEGER REFERENCES users(id)
);

COMMENT ON TABLE user_forms IS 'tabela para salvar os dados do usuario na arquitetura formul';

-- ---
-- Table 'have_forms'
-- Tabela de quem tem cao da arquitetura formularios
-- ---

DROP TABLE IF EXISTS have_forms CASCADE;
		
CREATE TABLE have_forms (
  id SERIAL PRIMARY KEY,
  time_with_dog VARCHAR(30),
  first_dog BOOLEAN,
  other_pets VARCHAR(10),
  dogs_age VARCHAR(10),
  breed VARCHAR(10),
  where_get VARCHAR(30),
  paid_to_acquire BOOLEAN,
  age_reached VARCHAR(30),
  dog_personality TEXT,
  why_do_have VARCHAR(100),
  others VARCHAR(50),
  characteristics VARCHAR(50),
  decision VARCHAR(30),
  couldnt_keep VARCHAR(30),
  how_vet VARCHAR(10),
  say_about VARCHAR(50),
  id_users INTEGER REFERENCES users(id)
);

COMMENT ON TABLE have_forms IS 'Tabela de quem tem cao da arquitetura formularios';

-- ---
-- Table 'dog_forms_have'
-- tabela para preencher dados do cachorro na arquitetura formularios
-- ---

DROP TABLE IF EXISTS dog_forms_have CASCADE;
		
CREATE TABLE dog_forms_have (
  id SERIAL PRIMARY KEY,
  dog_name VARCHAR(30),
  gender VARCHAR(30),
  castrated BOOLEAN,
  belongs_to_you BOOLEAN,
  id_have_forms INTEGER REFERENCES have_forms(id)
);

COMMENT ON TABLE dog_forms_have IS 'tabela para preencher dados do cachorro na arquitetura formu';

-- ---
-- Table 'had_forms'
-- Tabela de quem teve cao da arquitetura formularios
-- ---

DROP TABLE IF EXISTS had_forms CASCADE;
		
CREATE TABLE had_forms (
  id SERIAL PRIMARY KEY,
  dogs_name VARCHAR(30),
  dogs_personality VARCHAR(30),
  time_with_you INTEGER,
  first_dog BOOLEAN,
  other_pets BOOLEAN,
  pet_age INTEGER,
  castrated BOOLEAN,
  breed VARCHAR(30),
  where_came_from VARCHAR(30),
  pet_price DECIMAL,
  why VARCHAR(30),
  characteristics VARCHAR(30),
  name_decision VARCHAR(30),
  most_like VARCHAR(30),
  dont_like VARCHAR(30),
  veterinary VARCHAR(30),
  stopped_living VARCHAR(30),
  belonged_to_you BOOLEAN,
  id_users INTEGER REFERENCES users(id)
);

COMMENT ON TABLE had_forms IS 'Tabela de quem teve cao da arquitetura formularios';

-- ---
-- Table 'want_forms'
-- Tabela de quem quer ter cao da arquitetura formularios
-- ---

DROP TABLE IF EXISTS want_forms CASCADE;
		
CREATE TABLE want_forms (
  id SERIAL PRIMARY KEY,
  characteristics VARCHAR(100),
  live_with_dog VARCHAR(30),
  nickname VARCHAR(30),
  pretend VARCHAR(30),
  include VARCHAR(30),
  what_personality VARCHAR(30),
  research_expenses VARCHAR(30),
  id_users INTEGER REFERENCES users(id)
);

COMMENT ON TABLE want_forms IS 'Tabela de quem quer ter cao da arquitetura formularios';

-- ---
-- Table 'null_forms'
-- Tabela de quem nao quer ter cao da arquitetura formularios
-- ---

DROP TABLE IF EXISTS null_forms CASCADE;
		
CREATE TABLE null_forms (
  id SERIAL PRIMARY KEY,
  dont_want VARCHAR(100),
  id_users INTEGER REFERENCES users(id)
);

COMMENT ON TABLE null_forms IS 'Tabela de quem nao quer ter cao da arquitetura formularios';

-- ---
-- Table 'dog_forms_want'
-- Tabela para receber os dados do cachorro da arquitetura formularios
-- ---

DROP TABLE IF EXISTS dog_forms_want CASCADE;
		
CREATE TABLE dog_forms_want (
  id SERIAL PRIMARY KEY,
  dog_size VARCHAR(30),
  coat VARCHAR(30),
  color_preference VARCHAR(30),
  gender VARCHAR(30),
  age INTEGER,
  breed VARCHAR(30),
  id_want_forms INTEGER REFERENCES want_forms(id)
);

COMMENT ON TABLE dog_forms_want IS 'Tabela para receber os dados do cachorro da arquitetura form';
