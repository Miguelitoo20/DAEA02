# Fase de construcción
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Crear el directorio de trabajo en el contenedor
WORKDIR /src

# Crear el proyecto dentro del contenedor
RUN dotnet new webapi -o MyMicroservice --no-https

# Establecer el directorio de trabajo dentro del proyecto creado
WORKDIR /src/MyMicroservice

# Copiar el archivo Program.cs y el resto del contenido del proyecto
COPY Program.cs ./
# COPY *.csproj ./

# Restaurar las dependencias del proyecto
# RUN dotnet restore

# Copiar el resto de los archivos del proyecto (si los hay)
# COPY . .

# Publicar la aplicación
RUN dotnet publish -c Release -o /app

# Fase de producción
FROM mcr.microsoft.com/dotnet/aspnet:8.0

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar los archivos publicados desde la fase de construcción
COPY --from=build /app .

EXPOSE 80

# Configurar el punto de entrada para ejecutar la aplicación
ENTRYPOINT ["dotnet", "MyMicroservice.dll"]
