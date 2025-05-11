# Dockerfile otimizado
FROM python:3.11-slim as builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt \
    && mkdir -p /app/dependencies \
    && cp -r /root/.local /app/dependencies/.local

FROM python:3.11-slim
WORKDIR /app

# Copia as dependências instaladas
COPY --from=builder /app/dependencies/.local /root/.local
COPY app .

# Configura o PATH
ENV PATH=/root/.local/bin:$PATH

CMD ["python", "main.py"]