FROM python:3

COPY . /app

RUN pip install django==4.2.2

RUN python /app/manage.py migrate

EXPOSE 8001

CMD ["python", "/app/manage.py", "runserver", "0.0.0.0:8001"]
