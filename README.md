# E-Shop Brasil: Solução de Big Data e Personalização

## Introdução

A E-Shop Brasil, uma das maiores plataformas de comércio eletrônico do país, enfrenta desafios crescentes devido ao seu volume massivo de dados (5 milhões de clientes ativos, 100 mil pedidos/dia). A complexidade das operações exige soluções inovadoras para gerenciar dados de forma eficiente, personalizar a experiência do cliente e otimizar a logística.

Este projeto simula uma solução de TI proposta para atender a essas necessidades, utilizando tecnologias modernas de banco de dados e Big Data para apoiar áreas estratégicas como marketing, vendas e operações.

**Objetivos da Solução:**

*   Garantir a segurança e privacidade dos dados dos clientes.
*   Personalizar a navegação e recomendações com base em comportamentos anteriores.
*   Melhorar a eficiência da entrega e controle de estoques.

## Tecnologias Utilizadas

*   **Docker:** Para criar um ambiente conteinerizado e isolado, garantindo a fácil reprodução e *deploy* da solução.
*   **MongoDB:** Um banco de dados NoSQL flexível e escalável, ideal para gerenciar grandes volumes de dados não estruturados ou semi-estruturados (como perfis de clientes, histórico de navegação e detalhes de pedidos), que são característicos de ambientes de Big Data.
*   **Streamlit:** Uma biblioteca Python utilizada para criar uma interface web simples e interativa para visualização, gestão e análise dos dados simulados.

## Descrição da Aplicação

A aplicação desenvolvida em Python (`app.py`) e conteinerizada via Docker simula a gestão de dados da E-Shop Brasil.

### Funcionalidades Principais:

1.  **Conexão com MongoDB:** A aplicação se conecta a um container MongoDB separado, utilizando as variáveis de ambiente do Docker Compose.
2.  **Visualização de Dados:** A interface Streamlit permite visualizar dados simulados de clientes e pedidos.
3.  **Gestão de Clientes (Simulada):** Inclui funcionalidades básicas para adicionar novos clientes simulados ao banco de dados.
4.  **Análise Preliminar:** Demonstra como os dados de comportamento podem ser acessados para futuras análises de personalização.

O ambiente Dockerizado facilita o *setup* da solução em qualquer máquina, garantindo que a equipe de TI possa escalar a infraestrutura conforme necessário.

