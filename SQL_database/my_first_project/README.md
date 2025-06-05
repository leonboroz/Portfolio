Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

Hi everyone!
Сегодня я начал развивать свой проект в плане выстраивания витрины данных
Что проявилочь на данный момент. Я умудрился удалить таблицу из моей схемы, потому что назвал модель так же как и таблицу - orders
благодаря сохраненным скриптам удалось ее быстро восстановить. 
Залить данные благодаря pickle оказалось просто как в сказке
Затем я переименовал sql-файл, но модель сохранилась как представление и "маячила" в диаграмме.
Затем разобрался как модели сохранять как таблицы и размещать в своих схемах
Оказалось, что имя схемы в моем случае создается путем объединения из profiles и dbt_project. Решил что буду называть образующиеся схемы методом "хвостика" и название приобретет осмысленное название.
Когда я пишу данные заметки то параллельно занимаюсь созданием ссылочной подложки source. Она позволит оперировать ссылками и обезопасит наши таблицы от изменений, а тем более от удалений 