# Web-server + mysql
- web-server - контейнер с apache + php
- mysql - контейнер с mysql(mariadb) 

### При клонировани репозитория на новый комп
1. Установлен докер
2. Создать виртуальную сеть внутри докера
```
docker network create -d bridge web-server
```
3. В web-server/run.sh правильные пути
```shell
--volume ${Абсолютный путь где лежит Docker/web-server/volumes/sites-available}:/etc/apache2/sites-available
--volume ${Путь где лежат php-проекты}:/var/www
```
4. В web-server/run.sh правильные пути
```shell
--volume ${Абсолютный путь где лежит Docker/mysql/volumes}:/var/lib/mysql \
--volume ${Абсолютный путь где лежит Docker/mysql/dumps}:/dumps \
```

### Добавление хостов(новых сайтов)
Создаем файл в web-server/volumes/sites-available по аналогии с другими

```
ServerName task1.skillbox Хост(доменное имя)
DocumentRoot /var/www/task1.skillbox/ Путь где у тебя будут лежать файлы сайта внутри контейнера
<Directory /var/www/task1.skillbox> Здесь тоже
```

Идем в docker-entrypoint.sh и добавляем 
```
a2ensite task1.skillbox.conf <- Имя хоста
```

Идем в /etc/hosts и добавляем
```
127.0.0.1       task1.skillbox <- Имя хоста
```

### Запускаем web-server
```shell
bash web-server/build.sh
bash web-server/run.sh
```

### Запускаем mysql
```shell
bash mysql/run.sh
```

### Включаем вывод ошибок php
```php
<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
```

### Пример подключения к базе данных php
```php
<?php

$servername = "mysql";
$username = "test";
$password = "123123";
$dbname = "test";

$mysql = new mysqli($servername, $username, $password, $dbname);
$result = $mysql->query("SELECT * FROM test111");

while($row = $result->fetch_assoc()) {
    echo "id: " . $row["id"] . "\tname: " . $row["name"];
}
$mysql->close();
?>
```
