# Imagem para Raspberry Pi (ARM)
FROM balenalib/raspberrypi3-python:3.9-slim

# Configura diretório de trabalho
WORKDIR /app

# Instala dependências do sistema para pacotes Python que precisam compilar
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc python3-dev && \
    rm -rf /var/lib/apt/lists/*

# Primeiro copia só o requirements.txt (para cache eficiente)
COPY requirements.txt .

# Instala dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia o resto da aplicação
COPY . .

# Expõe a porta 9001
EXPOSE 9001

# Comando de execução na porta 9001
CMD ["python", "app.py"]