# Use a imagem oficial do Python para ARMv7 (RPi 3 B+)
FROM arm32v7/python:3.11-slim

# Define variáveis de ambiente para o Python
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Instala dependências do sistema necessárias
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho
WORKDIR /app

# Primeiro copia os requisitos para aproveitar o cache do Docker
COPY requirements.txt .

# Instala as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante da aplicação
COPY . .

# Comando para executar a aplicação
CMD ["python", "app.py"]