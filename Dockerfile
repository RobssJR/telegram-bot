# Imagem base com Python 3.7 no Debian Buster (ARMv7)
FROM arm64v7/python:3.7.10-buster

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Instala dependências de sistema necessárias para compilar pacotes Python
RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    libssl-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copia o arquivo de dependências para o container
COPY requirements.txt .

# Instala as dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação
COPY . .

# Define o comando padrão de execução
CMD ["python", "app.py"]
