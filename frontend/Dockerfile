# Usa la imagen oficial de Node.js 22.6.0
FROM node:22.6.0

# Establece el directorio de trabajo
WORKDIR /app

# Copia package.json y package-lock.json (si existe)
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de los archivos del proyecto
COPY . .

# Expone el puerto 3000
EXPOSE 3000


# Comando para iniciar la aplicación en modo de desarrollo
CMD ["npm", "run", "dev"]

# Construye la aplicación para producción
#RUN npm run build
#CMD ["npm", "start"]