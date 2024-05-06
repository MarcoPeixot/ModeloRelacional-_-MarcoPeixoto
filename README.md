# Documentação do Modelo Relacional - Projeto Abandono Zero

## Descrição Geral

Esta é a representação visual da estrutura relacional do projeto Abandono Zero, cujo objetivo é gerenciar eficazmente as informações dos usuários e suas respostas nos formulários. A modelagem apresenta as entidades, seus atributos e os relacionamentos entre elas, proporcionando uma visão clara e organizada do banco de dados.

## Entidades

### users
- **Descrição**: Armazena informações sobre os usuários e se relaciona com as outras entidades.
- **Chave Primária**: id
- **Atributos**:
    - **id**: `INTEGER` (Chave primária, identificador único)
    - **name**: `VARCHAR(50)` (Nome do usuário)
    - **email**: `VARCHAR(50)` (Email do usuário)

### general_forms
- **Descrição**: Armazena detalhes gerais sobre o usuário, incluindo informações demográficas e socioeconômicas.
- **Chave Primária**: id
- **Chave Estrangeira**: id_users referenciando users.id.
- **Atributos**:
    - **id**: `INTEGER` (Chave primária, identificador único)
    - **age**: `INTEGER` (Idade do usuário)
    - **gender**: `VARCHAR(10)` (Gênero do usuário)
    - **education**: `VARCHAR(50)` (Escolaridade do usuário)
    - **type_of_housing**: `VARCHAR(50)` (Tipo de moradia do usuário)
    - **family_constitution**: `VARCHAR(100)` (Constituição familiar)
    - **income**: `DECIMAL(10,2)` (Renda familiar mensal)
    - **live_in_the_house**: `INTEGER` (Quantidade de pessoas que moram na casa)
    - **address**: `VARCHAR(255)` (Endereço do usuário)
    - **choice_of_form**: `VARCHAR(50)` (Escolha de qual formulário o usuário vai responder)


### have_forms
- **Descrição**: Armazena detalhes sobre o cão mais recente que o usuário possui.
- **Chave Primária**: `id`
- **Chave Estrangeira**: `id_users` referenciando `users.id`.
- **Atributos**:
    - **id**: `INTEGER` (Chave primária, identificador único)
    - **time_with_dog**: `INTEGER` (Tempo que o usuário passa com o cão)
    - **first_dog**: `TEXT` (Informações sobre o primeiro cão do usuário)
    - **other_pets**: `TEXT` (Informações sobre outros pets do usuário)
    - **dogs_age**: `INTEGER` (Idade do cão)
    - **breed**: `VARCHAR(50)` (Raça do cão)
    - **where_get**: `VARCHAR(100)` (De onde o usuário obteve o cão)
    - **paid_to_acquire**: `BOOLEAN` (Se o usuário pagou pelo cão)
    - **age_reached**: `INTEGER` (Idade em que o cão atingiu certos marcos)
    - **dog_personality**: `TEXT` (Personalidade do cão)
    - **why_do_have**: `TEXT` (Por que o usuário tem o cão)
    - **others**: `TEXT` (Outras informações relevantes)
    - **characteristics**: `TEXT` (Características físicas do cão)
    - **decision**: `TEXT` (Decisões tomadas sobre o cão)
    - **couldnt_keep**: `BOOLEAN` (Se o usuário não conseguiu manter o cão)
    - **how_vet**: `TEXT` (Como o cão foi tratado veterinariamente)
    - **say_about**: `TEXT` (O que o usuário diz sobre o cão)

### had_forms
- **Descrição**: Armazena detalhes sobre o cão mais recente que o usuário já teve ou conviveu.
- **Chave Primária**: `id`
- **Chave Estrangeira**: `id_users` referenciando `users.id`.
- **Atributos**:
    - **id**: `INTEGER` (Chave primária, identificador único)
    - **dogs_name**: `VARCHAR(50)` (Nome do cão)
    - **dogs_personality**: `TEXT` (Personalidade do cão)
    - **time_with_you**: `INTEGER` (Tempo que o usuário passou com o cão)
    - **first_dog**: `TEXT` (Informações sobre o primeiro cão do usuário)
    - **other_pets**: `TEXT` (Informações sobre outros pets do usuário)
    - **pet_age**: `INTEGER` (Idade do cão)
    - **castrated**: `BOOLEAN` (Se o cão foi castrado)
    - **breed**: `VARCHAR(50)` (Raça do cão)
    - **where_came_from**: `VARCHAR(100)` (De onde o cão veio)
    - **pet_price**: `DECIMAL(10,2)` (Preço pago pelo cão)
    - **why**: `TEXT` (Por que o usuário teve o cão)
    - **characteristics**: `TEXT` (Características físicas do cão)
    - **name_decision**: `TEXT` (Decisão sobre o nome do cão)
    - **most_like**: `TEXT` (Coisas que o usuário mais gosta do cão)
    - **dont_like**: `TEXT` (Coisas que o usuário não gosta do cão)
    - **veterinary**: `TEXT` (Informações sobre tratamento veterinário)
    - **stopped_living**: `BOOLEAN` (Se o cão parou de viver)
    - **belonged_to_you**: `BOOLEAN` (Se o cão pertencia ao usuário)

### want_forms
- **Descrição**: Armazena informações do usuário que quer ter um cão no futuro.
- **Chave Primária**: `id`
- **Chave Estrangeira**: `id_users` referenciando `users.id`.
- **Atributos**:
    - **id**: `INTEGER` (Chave primária, identificador único)
    - **live_with_dog**: `TEXT` (Por que o usuário gostaria de conviver com um cão)
    - **nickname**: `VARCHAR(50)` (Possível nome do cão)
    - **pretend**: `BOOLEAN` (Se o usuário pretende comprar ou adotar)
    - **include**: `DATE` (Quando o usuário planeja incluir o cão em sua casa)
    - **what_personality**: `TEXT` (Personalidade que o usuário quer no cão)
    - **research_expenses**: `DECIMAL(10,2)` (Pesquisa sobre despesas mensais com o pet)

### null_forms
- **Descrição**: Armazena dados do usuário que nunca conviveu ou teve cães e não tem vontade de ter.
- **Chave Primária**: `id`
- **Chave Estrangeira**: `id_users` referenciando `users.id`.
- **Atributos**:
    - **id**: `INTEGER` (Chave primária, identificador único)
    - **dont_want**: `TEXT` (Por que o usuário não quer ter cães)

### user_forms
- **Descrição**: Entidade específica relacionada tanto com a entidade have_forms quanto com a want_forms para salvar o contato do usuário para futuras pesquisas.
- **Observação:** Essa entidade só vai receber uma foreign key, vai depender da escolha do usuário na hora do preenchimento do formulário.
- **Chave Estrangeira**: `id_users` referenciando `users.id`.
- **Atributos**:
    - **id**: `INTEGER` (Chave primária, identificador único)
    - **first_name**: `VARCHAR(50)` (Primeiro nome do usuário)
    - **last_name**: `VARCHAR(50)` (Sobrenome do usuário)
    - **social_name**: `VARCHAR(50)` (Nome social do usuário)
    - **cellphone**: `VARCHAR(15)` (Celular do usuário para futuros contatos)
    - **email**: `VARCHAR(50)` (E-mail do usuário para futuros contatos)

### dog_forms_have
- **Descrição**: Entidade específica relacionada com a entidade have_forms para salvar informações extras do cão.
- **Chaves Estrangeiras**:
  - **id_have_forms** referenciando `have_forms.id`.
- **Atributos**:
    - **id**: `INTEGER` (Chave primária, identificador único)
    - **dog_name**: `VARCHAR(50)` (Nome do cão)
    - **gender**: `VARCHAR(10)` (Gênero do cão)
    - **castrated**: `BOOLEAN` (Se o cão é castrado)
    - **belongs_to_you**: `BOOLEAN` (Se o cão pertence ao usuário)

### dog_forms_want
- **Descrição**: Entidade específica relacionada com a entidade want_forms para salvar informações extras do cão.
- **Chaves Estrangeiras**:
  - **id_want** referenciando `want_forms.id`.
- **Atributos**:
    - **dog_size**: `VARCHAR(20)` (Tamanho do cão)
    - **coat**: `VARCHAR(50)` (Tipo da pelagem do cão)
    - **color_preference**: `VARCHAR(50)` (Cor preferida do cão)
    - **gender**: `VARCHAR(10)` (Gênero do cão)
    - **age**: `INTEGER` (Idade do cão)
    - **breed**: `VARCHAR(50)` (Raça do cão)



## Relacionamentos

Os relacionamentos entre as entidades são fundamentais para entender como os dados são interligados e como as operações de CRUD (Create, Read, Update, Delete) afetam essas entidades. Aqui estão os relacionamentos detalhados entre as entidades:

- **users**:
  - **general_forms**: Um usuário pode ter apenas um formulário geral (`1:1`).
  - **have_forms**: Um usuário pode ter vários formulários de cães que já possui (`1:N`).
  - **has_forms**: Um usuário pode ter vários formulários de cães que já teve (`1:N`).
  - **want_forms**: Um usuário pode ter vários formulários de cães que deseja adotar (`1:N`).
  - **null_forms**: Um usuário pode ter vários formulários de cães que nunca conviveu ou não tem vontade de ter (`1:N`).
  - **user_forms**: Um usuário pode ter apenas um formulário específico de contatos (`1:1`).

- **general_forms**:
  - Relacionado diretamente com `users` através da chave estrangeira `id_users`.

- **have_forms**:
  - Relacionado diretamente com `users` através da chave estrangeira `id_users`.
  - Relacionado com `user_forms` através da chave estrangeira `id_have_forms`.
  - Relacionado com `dog_forms_have` através da chave estrangeira `id_have_forms`.

- **had_forms**:
  - Relacionado diretamente com `users` através da chave estrangeira `id_users`.

- **want_forms**:
  - Relacionado diretamente com `users` através da chave estrangeira `id_users`.
  - Relacionado com `user_forms` através da chave estrangeira `id_want_forms`.
  - Relacionado com `dog_forms_want` através da chave estrangeira `id_want_forms`.

- **null_forms**:
  - Relacionado diretamente com `users` através da chave estrangeira `id_users`.

- **user_forms**:
  - Relacionado diretamente com `users` através da chave estrangeira `id_users`.

- **dog_forms_have**:
  - Relacionado com `have_forms` através da chave estrangeira `id_have_forms`.

- **dog_forms_want**:
  - Relacionado com `want_forms` através da chave estrangeira `id_want_forms`.


## Regras de Negócio

As regras de negócio são diretrizes que garantem a integridade dos dados e a lógica de negócios do sistema. As regras de negócio para o projeto Abandono Zero são:

### 1. Validação de Dados

Todos os campos obrigatórios devem ser preenchidos antes de um usuário poder submeter um formulário.

### 2. Consistência de Informações

As informações fornecidas pelos usuários devem ser consistentes entre os diferentes formulários. Por exemplo, o nome do cão deve ser o mesmo em todos os formulários relacionados a esse cão.

### 3. Restrições de Edição

Uma vez que um usuário submete um formulário, ele não pode editar as informações que já foram salvas, exceto em casos específicos autorizados pela administração.

### 4. Política de Privacidade

As informações pessoais dos usuários são protegidas e só podem ser acessadas por funcionários autorizados.

### 5. Regra de Unicidade

Todos os campos dos formulários devem ser preenchidos pelo usuário.

### 6. Regra de Atualização

As informações dos usuários do formulário geral podem ser atualizadas a qualquer momento.


## Diagrama

![Diagrama](./assets/modelo_relacional.png)

Este diagrama simplificado ilustra os relacionamentos entre as entidades do modelo relacional. Cada entidade é representada por um retângulo, e os relacionamentos são indicados por linhas conectando as entidades.

## Conclusão

Com essa modelagem de banco de dados atende às necessidades do sistema do projeto Abandono Zero, permitindo o gerenciamento eficiente das informações dos usuários e suas respostas nos formulários. A modelagem apresenta as entidades, seus atributos e os relacionamentos entre elas, proporcionando uma visão clara e organizada do banco de dados. As regras de negócio garantem a integridade e a consistência dos dados.