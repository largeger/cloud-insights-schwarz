# Nutze ein leichtgewichtiges Nginx-Image als Basis
FROM nginx:alpine

# Kopiere unsere HTML-Datei in das Standard-Verzeichnis von Nginx
COPY index.html /usr/share/nginx/html/index.html

# Exponiere Port 80 (Standard für Nginx)
EXPOSE 80

# Nginx startet automatisch im Vordergrund
CMD ["nginx", "-g", "daemon off;"]
