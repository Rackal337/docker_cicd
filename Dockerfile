# Этап сборки (builder)
FROM python:3.9-alpine as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# Финальный образ
FROM python:3.9-alpine
WORKDIR /app

# Копируем установленные пакеты из builder
COPY --from=builder /root/.local /root/.local

# Добавляем /root/.local/bin в PATH, чтобы Python видел Flask
ENV PATH=/root/.local/bin:$PATH

# Копируем исходный код
COPY app.py .

# Запускаем приложение
CMD ["python", "app.py"]
