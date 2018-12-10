alias ..="cd .."
alias ...="cd ../.."

alias h='cd ~'
alias c='clear'
alias art=artisan

function artisan() {
    php artisan "$@"
}

function artisan56() {
    php5.6 artisan "$@"
}

function artisan70() {
    php7.0 artisan "$@"
}

function artisan71() {
    php7.1 artisan "$@"
}

function artisan72() {
    php7.2 artisan "$@"
}

function php56() {
    update-alternatives --set php /usr/bin/php5.6
}

function php70() {
    update-alternatives --set php /usr/bin/php7.0
}

function php71() {
    update-alternatives --set php /usr/bin/php7.1
}

function php72() {
    update-alternatives --set php /usr/bin/php7.2
}

function composer56() {
    php5.6 /opt/bin/composer.phar "$@"
}

function composer70() {
    php7.0 /opt/bin/composer.phar "$@"
}

function composer71() {
    php7.1 /opt/bin/composer.phar "$@"
}

function composer72() {
    php7.2 /opt/bin/composer.phar "$@"
}
