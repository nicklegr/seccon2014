FROM orchardup/nginx

ADD src/ /var/www

ADD server.crt /etc/nginx/ssl/
ADD server.key /etc/nginx/ssl/
RUN ln -s /etc/nginx/sites-available/default-ssl /etc/nginx/sites-enabled/default-ssl

CMD 'nginx'
