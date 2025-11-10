import streamlit as st
import pandas as pd
from pymongo import MongoClient
import os

# Configurações do MongoDB (lendo variáveis de ambiente do docker-compose)
MONGO_URI = os.environ.get("MONGO_URI", "mongodb://localhost:27017/eshop_db")
DB_NAME = "eshop_db"

@st.cache_resource
def get_database():
    """Conecta ao MongoDB e retorna o objeto do banco de dados."""
    try:
        client = MongoClient(MONGO_URI)
        return client[DB_NAME]
    except Exception as e:
        st.error(f"Erro ao conectar ao MongoDB: {e}")
        return None

db = get_database()

# --- Funções de Manipulação de Dados ---

def insert_customer(name, email, region):
    """Insere um novo cliente na coleção 'clientes'."""
    if db:
        customers = db.clientes
        customer_data = {
            "nome": name,
            "email": email,
            "regiao": region,
            "comportamento_compra": []
        }
        customers.insert_one(customer_data)
        return True
    return False

def get_customers_df():
    """Recupera todos os clientes e retorna como um DataFrame Pandas."""
    if db:
        customers = db.clientes
        df = pd.DataFrame(list(customers.find({}, {'_id': 0})))
        return df
    return pd.DataFrame()

# --- Interface Streamlit ---

st.title("E-Shop Brasil: Dashboard de Gestão de Dados (Big Data Simulação)")

if db:
    st.success("Conexão com MongoDB estabelecida com sucesso!")

    # --- Seção 1: Adicionar Novo Cliente (Gestão de Dados) ---
    st.header("Gestão de Clientes: Adicionar Novo Cliente")
    with st.form("new_customer_form"):
        col1, col2, col3 = st.columns(3)
        with col1:
            customer_name = st.text_input("Nome do Cliente")
        with col2:
            customer_email = st.text_input("E-mail")
        with col3:
            customer_region = st.selectbox("Região", ["Sudeste", "Sul", "Nordeste", "Norte", "Centro-Oeste"])
        
        submitted = st.form_submit_button("Adicionar Cliente")
        if submitted:
            if customer_name and customer_email:
                insert_customer(customer_name, customer_email, customer_region)
                st.success(f"Cliente '{customer_name}' adicionado com sucesso!")
            else:
                st.warning("Por favor, preencha todos os campos.")

    # --- Seção 2: Visualizar Dados dos Clientes (Análise) ---
    st.header("Análise de Dados: Clientes Ativos")
    df_customers = get_customers_df()
    if not df_customers.empty:
        st.dataframe(df_customers)
        st.subheader("Distribuição de Clientes por Região")
        # Exemplo de análise para otimização logística
        st.bar_chart(df_customers['regiao'].value_counts())
    else:
        st.info("Nenhum cliente cadastrado ainda.")
    
    # --- Seção 3: Personalização e Comportamento ---
    st.header("Personalização (Simulação de Comportamento)")
    st.write("A coleção `clientes` armazena o array `comportamento_compra`. Em um cenário real, usaríamos esses dados para alimentar modelos de recomendação, personalizando a navegação em tempo real. O MongoDB é ideal para essa estrutura de dados flexível.")


else:
    st.error("Aplicação não pôde conectar ao banco de dados. Verifique o Docker Compose.")
