FROM python:2.7.9

MAINTAINER Hypo i@ihypo.net

RUN mkdir /cjcx
WORKDIR /cjcx
COPY . /cjcx

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install uwsgi uwsgi-plugin-python -y
RUN apt-get install virtualenvwrapper
RUN export WORKON_HOME=/root/.virtualenvs
RUN source /usr/local/bin/virtualenvwrapper.sh
RUN mkvirtualenv cjcx
RUN workon cjcx
RUN chown -R www-data:www-data /cjcx
RUN chown -R www-data:www-data /cjcx
ADD default /etc/nginx/sites-available/default

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN /etc/init.d/nginx restart
RUN ln -s /usr/lib/python2.7/plat-*/_sysconfigdata_nd.py /usr/lib/python2.7/

CMD uwsgi --ini /cjcx/manage_config.ini

EXPOSE 80
