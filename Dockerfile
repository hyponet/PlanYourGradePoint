FROM python:2.7.9

MAINTAINER Hypo i@ihypo.net

RUN mkdir /cjcx
WORKDIR /cjcx
COPY . /cjcx

RUN pip install -r /cjcx/requirenments.txt

CMD ["python","/cjcx/manage.py"]

EXPOSE 5000
