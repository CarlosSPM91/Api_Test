FROM python:3.13-slim

WORKDIR /app
COPY . /app

RUN pip install uv
RUN uv sync
RUN uv run opentelemetry-bootstrap -a requirements | uv pip install --requirement -

EXPOSE 8000
CMD ["uv","run", "opentelemetry-instrument" ,"fastapi", "run", "/app/main.py"]