FROM python:3.12.8-alpine

WORKDIR /app

COPY .. /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install flask

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]