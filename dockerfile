FROM python:3.12-alpine3.21

RUN apk upgrade --no-cache

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN addgroup -S appgroup && adduser -S appuser -G appgroup && chown -R appuser:appgroup /app

USER appuser

EXPOSE 5000

CMD ["python", "app.py"]