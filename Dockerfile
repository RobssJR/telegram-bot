# Use esta imagem base otimizada para ARM64
FROM arm64v8/python:3.8-slim-buster

# Configurações essenciais para ARM
ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

# Instala dependências de sistema necessárias para pacotes Python
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Primeiro copia apenas o requirements.txt (para melhorar cache)
COPY requirements.txt .

# Instalação segura de dependências para ARM
RUN pip install --upgrade pip && \
    pip install --no-cache-dir wheel && \
    pip install --no-cache-dir -r requirements.txt --use-pep517

# Copia o restante da aplicação
COPY . .

# Porta que será utilizada
EXPOSE 9001

# Comando de execução
CMD ["python", "app.py"]