# Dockerfile
FROM python:3.11-slim as builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:3.11-slim
WORKDIR /app

# Copia apenas o necessário da etapa de construção
COPY --from=builder /root/.local /root/.local
COPY ./app .

# Garante que scripts no .local sejam executáveis
ENV PATH=/root/.local/bin:$PATH

# Metadata (opcional)
LABEL maintainer="seu@email.com"
LABEL version="1.0"
LABEL description="Aplicação Python em Docker"

CMD ["python", "./main.py"]