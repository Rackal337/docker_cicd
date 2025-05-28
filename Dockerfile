FROM python:3.9-alpine as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
FROM python:3.9-alpine
WORKDIR /app
COPY --from=builder /app /app
COPY app.py .
CMD ["python", "app.py"]
