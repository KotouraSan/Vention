FROM python:3.12-alpine AS build

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir --target=/app/dependencies -r requirements.txt

FROM python:3.12-alpine AS runtime

WORKDIR /app

ENV PYTHONPATH=/app/dependencies

COPY --from=build /app/dependencies /app/dependencies

COPY app.py /app/

RUN addgroup -S anyopsgroup && adduser -S anyops -G anyopsgroup

USER anyops

EXPOSE 5000

CMD ["python", "app.py"]