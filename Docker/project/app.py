import os

from flask import Flask, jsonify
import psycopg

app = Flask(__name__)


def create_table():
    connection = psycopg.connect(
        host=os.environ["DB_HOST"],
        port=os.environ["DB_PORT"],
        dbname=os.environ["DB_NAME"],
        user=os.environ["DB_USER"],
        password=os.environ["DB_PASSWORD"],
    )

    with connection:
        with connection.cursor() as cursor:
            cursor.execute(
                """
                CREATE TABLE IF NOT EXISTS messages (
                    id SERIAL PRIMARY KEY,
                    message TEXT NOT NULL,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                )
                """
            )


@app.route("/hello")
def hello():
    return jsonify({"message": "Hello AnyOps!"})


if __name__ == "__main__":
    create_table()
    app.run(host="0.0.0.0", port=5000)
