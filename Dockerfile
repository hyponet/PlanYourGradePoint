FROM python:2.7.9

MAINTAINER Hypo i@ihypo.net

RUN mkdir /cjcx
WORKDIR /cjcx
COPY . /cjcx

RUN apt-get update
RUN apt-get upgrade
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["python","/cjcx/manage.py"]

EXPOSE 5000
