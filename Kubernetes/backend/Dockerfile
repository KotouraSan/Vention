FROM python:3.12-alpine AS build
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --target=/app/dependencies -r requirements.txt

FROM python:3.12-alpine AS runtime
WORKDIR /app
ENV PYTHONPATH=/app/dependencies
COPY --from=build /app/dependencies /app/dependencies
COPY app.py /app/
RUN addgroup -S lab6group && adduser -S lab6 -G lab6group
USER lab6
EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:5000/health', timeout=2)" || exit 1
CMD ["python", "app.py"]