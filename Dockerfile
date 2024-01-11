# Usar una imagen base que tenga Maven y OpenJDK instalados
FROM maven:3.9.5-openjdk-17

# Establecer el directorio de trabajo en el contenedor
WORKDIR /src/main

# Copiar el archivo pom.xml al contenedor
COPY pom.xml ./

# Descargar todas las dependencias del proyecto
RUN mvn dependency:go-offline

# Copiar el resto del código fuente al contenedor
COPY src ./src

# Compilar el proyecto
RUN mvn package

# Exponer el puerto en el que se ejecutará la aplicación
EXPOSE 8080

# Ejecutar la aplicación
CMD ["java", "-jar", "target/guardias-0.0.1-SNAPSHOT.jar"]
