# Nginx image dan foydalanamiz
FROM nginx:alpine

# HTML faylni Nginx serveriga joylaymiz
COPY index.html /usr/share/nginx/html/index.html

# Nginx 80-portda ishlaydi
EXPOSE 80
