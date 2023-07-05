FROM python:3.90-alpine

WORKDIR /app

COPY . .

CMD ["python"]