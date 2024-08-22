# pymongo-api

## Как запустить

### Запускаем mongodb и приложение

```shell
docker compose -f ./compose.yaml up -d
```

### Настраиваем шарды и реплики

```shell
./scripts/init-shards-repl-mongo.sh
```

### Настраиваем роутер и заливаем данные

```shell
./scripts/init-mongos-router.sh
```

Если при этом возникла ошибка, то нужно запустить скрипт ещё раз

## Как проверить

### Если вы запускаете проект на локальной машине

Откройте в браузере http://localhost:8080

### Если вы запускаете проект на предоставленной виртуальной машине

Узнать белый ip виртуальной машины

```shell
curl --silent http://ifconfig.me
```

Откройте в браузере http://<ip виртуальной машины>:8080

### Проверить конфигурацию

```shell
curl -X 'GET' \
  'http://localhost:8080/' \
  -H 'accept: application/json' | jq .
```

### Проверить количество созданных документов

```shell
./scripts/counts.sh
```

## Доступные эндпоинты

Список доступных эндпоинтов, swagger http://<ip виртуальной машины>:8080/docs

### Удалить проект

```shell
./scripts/clear.sh
```