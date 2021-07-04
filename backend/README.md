# Strapi application

In order to start the application localy you need to have

- postgres installed

```
psql postgres
CREATE DATABASE dbname;
CREATE ROLE db_user WITH LOGIN PASSWORD 'password' CREATEDB;
GRANT ALL PRIVILEGES ON DATABASE dbname TO db_user;



```

run the following commands in the backend directory

Available commands in your project:

```
  npm run develop
<!-- //  Start Strapi in watch mode. -->
```

```
  npm run start
  <!-- // Start Strapi without watch mode. -->
```

```
  npm run build
  <!-- // Build Strapi admin panel. -->
```

```
  npm run strapi
  <!-- // Display all available commands. -->
```

access [localhost:1337](localhost:1337/) for the initial setup

access [localhost:1337/admin](localhost:1337/admin) to login after you created a user
