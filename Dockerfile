FROM python:3.11-slim

WORKDIR /app

# Copia primeiro o requirements.txt para aproveitar cache Docker
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante da aplicação
COPY app .

CMD ["python", "main.py"]