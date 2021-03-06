#language: ru

Функционал: 
  Охватывается весь раздел профиля
    Редактирование профайла
    Настройка рассылки
    Смена пароля
    Активация бонусной карты
    Активация подарочной карты

  Предыстория:
    Допустим зарегистрирован пользователь "user@ya.ru/secret"
    И я на странице "профиль"

  Сценарий: Редактирование профайла 
    И я перешёл по ссылке "Редактировать"
    И я в поле "firstname" запишу "Диман"
    И я в поле "lastname" запишу "Батан"
    И я в поле "Мобильный телефон" запишу "Мобильный телефон"
    И я выберу "Мужской" из селекта "sex"
    И я выберу "19" из селекта "birthday_day"
    И я выберу "Февраля" из селекта "birthday_month"
    И я выберу "1986" из селекта "birthday_year"
    И я выберу "Москва" из селекта "city"
    И я выберу "Авиамоторная" из селекта "metro"
    И я нажму "Сохранить"
    И я увижу "Вам выслан в виде смс проверочный код"
    И я в поле "Проверочный код" запишу "Не правельный проверочный код"
    И я увижу "Не правельный проверочный код"
    И я перейду по ссылке "Повторно выслать проверочный код"
    И я в поле "Проверочный код" запишу "Проверочный код"
    И я нажму "Сохранить"
    И я увижу "Личный профиль был успешно обнавлён"
    И я должен быть на странице "профиля"

  Сценарий: Активация бонусной карты
    Допустим у пользователя "user@ya.ru" на счету "0" бонусных балов
    Допустим в системе зарегистрированна бонусная карта с "200" балами и с кодом "1234"
    И я перешёл по ссылке "Активация бонусной карты"
    И я в поле "код карты" запишу "1111"
    И я увижу "Не верный код бонусной карты"
    И я в поле "код карты" за пишу "1234"
    И я увижу "Бонусная карта на 200 балов активированна"
    И бонусные балы пользователя "user@ya.ru" должны ровняться "200" балам

  Сценарий: Активация подарочной карты
    Допустим у пользователя "user@ya.ru" на счету "0" рублей
    Допустим в системе зарегистрированна подарочная карта "2000" рублей и с кодом "1234"
    И я перешёл по ссылке "Активация подарочной карты"
    И я в поле "код карты" запишу "1111"
    И я увижу "Не верный код подарочной карты"
    И я в поле "код карты" за пишу "1234"
    И я увижу "Подарочная карта на 2000 рублей активированна"
    И баланс пользователя "user@ya.ru" должен ровняться "2000" рублей

  Сценарий: Пригласить друга
    Допустим я перешёл по ссылке "Друзья"
    И я нажму "Пригласить"
    И я увижу "Не верная электронная почта"
    И я в поле "email" запишу "friend@ya.ru"
    И я нажму "Пригласить"
    И я увижу "Приглашение на наш сайт высланно вашему другу"

    И в почтовом ящике "friend@ya.ru" будет "1" не прочитанное письмо с темой "Ваш друг приглашает вас на domain"
    И я открою письмо пришедшее на адрес "friend@ya.ru" с темой "Ваш друг приглашает вас на domain"
    И я перейду по ссылке в письме "Присоединяйтесь"

  Сценарий: Поиск ваших друзей на проекте по вашему почтовому ящику(Как на фейсбуке, "Дайте нам ваш емаил и пароль и мы найдём всех ваших другей на фейсбуке и добавимся к ним в друзья....")
    #TODO В данный момент на http://groupon.ru/ не работает приглашения, поэтому далее по этому сценарию, моя личная импровизация, попробуйте сами возможно поченили, если не получится увидить это в действии уточняцте у Дмитрия(Дмитрий, тот что главный!)
    Допустим на проекте зарегистрированны следующие пользователи:
      | email        |
      | user_1@ya.ru |
      | user_2@ya.ru |
    Допустим я перешёл по ссылке "Друзья"
    И я в поле "емаил" запишу "test@ya.ru"
    И я в поле "password" запишу "1234"
    И я нажму "Запросить контакты"
    И я увижу "Мы нашли 2 ваших друга, они добавленны к вам в контакт лист"

  Сценарий: Настройка рассылки
    Допустим я перешёл по ссылке "Настроить рассылку"
    И я выберу "Ежедневная" из "notifer"
    И я выберу "Никогда" из "notifer"
    И я нажму "Сохранить" 

  Сценарий: Просмотор раздела Купоны
    Допустим я перешёл по ссылке "Купоны"
    И я увижу "У вас пока ещё нет купонов"
    Допустим я перещёл по ссылке "Все купоны"
    И я увижу "У вас пока ещё нет купонов"
    Допустим я перешёл по ссылке "Подарки"
    И я увижу "У вас пока ещё нет подарков"


    # Насколько я понимаю купоны могут ограничены числом использования или датой, и наверника и тем и другим...
    # Купоны, это купленные акции, как бонусные так и за реальные баблосы
    Допустим у пользователя "user@ya.ru" есть следующие купоны:
      | name                                 | percentage | action_number | end_date          |
      | Скидка на первую покупку             | 20         | 1             | nil               |
      | Годовой 20% скидос. Гуляй рванина!!! | nil        | 2006-03-19    | Time.now + 1.year |
      | Годовая 30% скидка на зонты          | nil        | 2006-03-19    | 1.year.ago        |

    Допустим я перешёл по ссылке "Действующие"
    И я увижу "Скидка на первую покупку"
    И я не увижу "Годовая 30% скидка на зонты"

    Допустим я перешёл по ссылке "Прошедшие"
    И я увижу "Годовая 30% скидка на зонты"
    И я не увижу "Годовой 20% скидос. Гуляй рванина!!!"

    Допустим я перешёл по ссылке "Все купоны"
    И я увижу "Годовой 20% скидос. Гуляй рванина!!!"
    И я увижу "Годовая 30% скидка на зонты"
    И я перейду по ссылке "Распечатать"
    И я окажусь на странице "печати купона"

  Сценарий: Смена пароля
    И я перехожу по ссылке "Сменить пароль"
    И я нажимаю "Сохранить"
    И я увижу "Ошибка при попытке сохранить пароль"

    И я в поле "Пароль" запишу "new_password"
    И я в поле "Подтверждение пароля" запишу "asdas_asdasd"
    И я увижу "Ошибка при попытке сохранить пароль"

    И я в поле "Пароль" запишу "new_password"
    И я в поле "Подтверждение пароля" запишу "new_password"
    И я увижу "Пароль успешно был обнавлён"





   
  
    

    

