FROM python:3.13-slim-bookworm

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 8080

# CMD ["gunicorn", "--config", "gunicorn_config.py", "app.app:app"]

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8080", "app:app"]
