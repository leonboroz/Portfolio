-- 🧩 [Добавление столбца для сохранения кодировки]
-- Чтобы не терять оригинальный формат заказов при выгрузке, добавляю новый столбец
ALTER TABLE orders ADD COLUMN order_code BIGINT;

-- ⚠️ [Исправление размера данных]
-- Ранее column order_code была создана как INT, но данные превышали лимит
-- Исправляю тип на BIGINT, чтобы вместить все значения
ALTER TABLE orders ALTER COLUMN order_code TYPE BIGINT;

-- 🐞 [Выявление бага с уникальностью карт]
-- Из-за отсутствия ограничения UNIQUE на gift_cards.card_number
-- произошло дублирование при загрузке нескольких массивов.
-- Хорошо, что таблица orders была пуста — можно было удалить без конфликтов.

-- 🔄 [Удаление записей и сброс sequence]
-- После удаления sequence продолжала считать с конца (пример: 19 вместо 1)
-- Решение — вручную сбросить sequence через setval.
DELETE FROM gift_cards;
SELECT setval('my_schema.gift_cards_id_seq', 1, false);

-- ✅ [Добавление ограничений]
-- На будущее: всегда проверяй, где нужны ограничения.
-- Добавляю ограничение уникальности 
ALTER TABLE gift_cards
  ADD CONSTRAINT num_unik UNIQUE (card_number);
  
--Добавление ограничения уникальности по 2м полям

ALTER TABLE orders
ADD CONSTRAINT unique_field1_field2 UNIQUE (gift_card_id, order_code);






