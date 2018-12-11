# PhpCanister

Ambiente di sviluppo semplice e immediato per PHP.

Container disponibili:
- nginx
- PHP con PHP-FPM (dalla 5.6 alla 7.3)
- MariaDB
- MySQL
- Redis (TODO)
- memcached (TODO)

### Configurazione

- Copiare il file .env.example e salvarlo come .env
- Configurare le varie voci a seconda delle proprie esigenze:
    - HOST_USER_UID: Inserire l'UID del proprio utente (linux-only)
    - APP_CODE_PATH_HOST: indicare il path sull'host del codice della/e applicazione/i
    - APP_CODE_PATH_CONTAINER: indcare il path sui container sul quale verrà montato il volume condiviso
    

### Installazione

- docker-compose build container1 container2...