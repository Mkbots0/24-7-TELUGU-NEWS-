# Dockerfile – 24-7-telugu-news

FROM python:3.12-slim

# Work directory inside container
WORKDIR /app

# Python basic settings
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Install deps
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy rest of the project
COPY . .

# Default port (platform usually sets PORT env)
ENV PORT=8000

# Run the FastAPI app
CMD ["sh", "-c", "uvicorn app:app --host 0.0.0.0 --port ${PORT}"]
