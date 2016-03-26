FROM python:2.7.9

MAINTAINER Hypo i@ihypo.net

RUN mkdir /cjcx
WORKDIR /cjcx
COPY . /cjcx

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install uwsgi uwsgi-plugin-python -y
RUN chown -R www-data:www-data /cjcx
RUN chown -R www-data:www-data /cjcx
ADD /cjcx/default /etc/nginx/sites-available/

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN /etc/init.d/nginx restart

CMD ["uwsgi","--ini","/cjcx/manage_config.ini"]

EXPOSE 80
