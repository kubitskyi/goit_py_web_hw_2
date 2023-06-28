FROM python:3.10

ENV APP_HOME /src_with_classes


WORKDIR $APP_HOME

COPY pyproject.toml $APP_HOME/pyproject.toml
COPY poetry.lock $APP_HOME/poetry.lock

RUN pip install poetry==1.5.0
RUN poetry config virtualenvs.create false && poetry install

COPY . .

EXPOSE 5000

CMD ["python", "src_with_classes.py"]