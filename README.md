# task_manager

Это мой pet-project Todo List

Первая часть работы Ada Lovelace

Чистота кода и общая структура проекта (max 4 балла)
- [x]Есть up-to-date README со ссылкой на загрузку .apk, перечнем реализованных фич, пара скриншотов (+1 балл)
- [x]Код консистентно отформатирован (+1 балл)
- [x]Код разбит на фичи и слои (не важно, feature-first / layer-first) (+2 балла)

Вёрстка + навигация (max 16 баллов)
- [x]Полностью свёрстаны 2 экрана по макетам: основной и добавления/редактирования задачи (+10 баллов). Анимации не ожидаем.
- [x]Реализован свайп по айтему Выполнено/Удалить, в качестве логики может быть просто коллбек (+3 балла)
- [x]Показ выполненных дел (можно подложить просто stub, без логики) (+3 балла)

Разное (max 6 баллов)
- [x]Реализовано логирование не print’ами, а сторонним или самописным logger’ом, логи которого не попадают в продакшен билд (+2 балла)
- [x]У приложения есть иконка (iOS или Android, необязательно оба) (+4 балла)

APK (Ada Lovelace) https://drive.google.com/file/d/1z9nlDn1Sp4auJSv61PvvFwjKZi8Tdh5H/view?usp=sharing


Вторая часть работы Alan Turing

Чистота кода и общая структура проекта
- [x] Есть up-to-date README со ссылкой на загрузку .apk, перечнем реализованных фич, пара скриншотов
- [x] Добавлен и работает flutter_lints, в коде нет необоснованных игноров правил 
- [x] Форматирование кода присутствует (+1 балл)
- [x] Код разбит на фичи и слои 

State-Management
- [x] Для стейт-менеджмента используется BLoC
- [x] Консистентность данных при редактировании на разных экранах: изменил на одном экране, проросло на другой мгновенно без плясок с переоткрытием экранов/перезапуском приложения 

Получение и хранение данных 
- [x] Реализована работа с бэкендом, данные отправляются/получаются с сервера
- [x] Работа с сетью выделена в отдельный слой, код инкапсулирован. Отсутствует логика в слое представления 
- [x] Организовано сохранение данных на диск при помощи одной из представленных библиотек 
- [x] Работа выделена в отдельный слой

Разное
- [x] Работа с асинхронным кодом реализована однородно: нет бессвязной мешанины из .then и async/await, подход выбран логично
- [x] Интернационализация: используется пакет intl или аналогичный, строки изолированы и не захардкожены


Третья часть работы Bjarne Stroustrup

Добавлено игнорирование серверных ошибок и информирование пользователя о наличии или отсутствии интернет подключения
Приложение работает без интернета
Реализован DI с помощью get_it
Навигация переписана на auto_route, есть поддержка диплинков

Приложение можно открыть через блокнот по ссылке https://todo.app.com
Для открытия страницы добавления заадчи используй ссылку https://todo.app.com/task

Добавлено пару unit тестов

APK (Alan Turing) [https://drive.google.com/file/d/1S8yVY3AzZXHQN0epM3uQdmP3ztKY3Afh/view?usp=sharing](https://drive.google.com/file/d/12lymWyxAfR4XduOswWI4Eew6Qcl0I6SJ/view?usp=sharing)

![image](https://github.com/FedorzhyveL/task_manager/assets/61901905/f62f5e37-fc48-4b50-bdad-0ba0cd0dcf37)
![image](https://github.com/FedorzhyveL/task_manager/assets/61901905/7909602b-b0cd-4161-80cc-9b4cda285c5c)
![image](https://github.com/FedorzhyveL/task_manager/assets/61901905/303bba19-c2a9-4916-bbe4-c64b7a009fff)
![image](https://github.com/FedorzhyveL/task_manager/assets/61901905/98169d84-244a-4395-b065-1cc4c67eee99)
