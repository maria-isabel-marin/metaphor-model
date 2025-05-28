# Usa la imagen oficial de nginx, ligera y preparada para servir estáticos
FROM nginx:alpine

# Borra la configuración por defecto de nginx (opcional)
RUN rm /etc/nginx/conf.d/default.conf

# Copia tu folder public/ en la carpeta que nginx sirve
COPY public/ /usr/share/nginx/html

# Expone el puerto 80
EXPOSE 80

# Arranca nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]
