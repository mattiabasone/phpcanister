# PhpCanister

Simple and fast development environment for a single or multiple PHP projects.

Available containers:

- nginx
- PHP with PHP-FPM (from 5.6 to 7.3)
- MariaDB
- MySQL
- Redis (TODO)
- memcached (TODO)

### Configuration

- Copy `.env.example` as `.env`
- Configure directives according to your needs:
    - HOST_USER_UID: Set your user id on the host, you can get it using `echo $UID` (linux-only)
    - APP_CODE_PATH_HOST: Set the path where you saved your files on the host
    - APP_CODE_PATH_CONTAINER: Set the path of the shared volume of the container. Change this value only if you know 
    what are you doing
- Add your virtualhost(s) configuration(s) under nginx/sites. Files must have the extension `.conf`

### Installation

- docker-compose build container1 container2...