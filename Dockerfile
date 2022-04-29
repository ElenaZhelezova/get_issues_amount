FROM python:3.9

COPY docker_requirements.txt docker_requirements.txt

RUN pip install --upgrade pip \
    && pip install -r docker_requirements.txt

RUN useradd python_user
ENV user='python_user'
USER $user
WORKDIR /home/$user

COPY --chown=$user:$user get_issues.py get_issues.py

ARG A_USERNAME
ARG A_TOKEN

ENV USERNAME=$A_USERNAME
ENV TOKEN=$A_TOKEN

CMD ["python3", "get_issues.py"]

