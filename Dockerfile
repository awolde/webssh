FROM python:3.7-slim
RUN apt update && apt install openssh-client nginx -y
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
RUN cp /code/default /etc/nginx/sites-enabled/
RUN mv server.* /etc/nginx/
RUN mv .htpasswd /etc/nginx/
RUN adduser app
#USER app
RUN chmod +x start.sh
CMD ["./start.sh"]
#RUN pip install webssh
#ENTRYPOINT ["wssh"]
