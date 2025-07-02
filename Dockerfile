FROM python:3.13.5-alpine3.22

WORKDIR /app

COPY requirements.txt .

# Instalar as dependências.
# --no-cache-dir: Desabilita o cache do pip para reduzir o tamanho da imagem.
# --upgrade pip: Garante que a versão mais recente do pip seja usada.
RUN pip install --no-cache-dir --upgrade pip -r requirements.txt

COPY . .

EXPOSE 8000

# Comando para iniciar a aplicação quando o contêiner for executado.
# --host 0.0.0.0 torna a aplicação acessível de fora do contêiner.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]