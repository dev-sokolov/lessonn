#!/bin/bash

# Директория с логами
LOG_DIR="/opt/281024-wdm/Ruslan_Sokolov/February/mylog"
# Директория для хранения бэкапов
BACKUP_DIR="/opt/281024-wdm/Ruslan_Sokolov/February/my_backup"
# Количество архивов, которые нужно оставить
KEEP_COUNT=3

# Имя архива с датой
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="logs_$TIMESTAMP.tar.gz"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"

# Создаем директорию для бэкапов, если её нет
mkdir -p "$BACKUP_DIR"

# Создаем архив логов
tar -czf "$BACKUP_PATH" -C "$LOG_DIR" .

# Удаляем старые архивы, оставляя только последние $KEEP_COUNT
ls -tp "$BACKUP_DIR"/logs_*.tar.gz | grep -v '/$' | tail -n +$((KEEP_COUNT+1)) | xargs -d '\n' rm --

# Выводим сообщение об успешном завершении
echo "Backup создан: $BACKUP_PATH"
