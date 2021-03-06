#language: ru

Функционал: 
  Тестирование ссылок, с простым контентом
 
  Предыстория:
    Допустим в системе присутствуют следующие разделы для акций "Туризи и гостинници, Рестораны, Развлечения и спорт"
    # terms - Условия(может быть несколько)
    # Features - Особенности(может быть несколько)
    Допустим в системе присутствуют следующие акции:
      | name                                      | percentage | price | description   | type                | terms            | features                         | bayes | created_at | active | city   |
      | Скидка 40% на традиционный тайский массаж | 40         | 111   | description_1 | Развлечения и спорт | terms_1, terms_2 | График работы: с 11:00 до 23:00. | 555   | Time.now   | true   | Москва |
    Допустим на "Скидка 40% на традиционный тайский массаж" есть следующие комментарии "comment_1, comment_2, comment_3"
    Допустим зарегистрирован пользователь "user@ya.ru/secret"
    И я вошёл как "user@ya.ru/secret"
    Допустим пользователь "user@ya.ru" проживает в "Москва"
    Допустим я "на главной странице"

  Сценарий: Просто пробегаем по ссылкам, тестируя их доступность на сайте, и отсутствие ошибок
    И я перейду по ссылке "О нас"
    Допустим я на "главной странице"

    И я перейду по ссылке "Вакансии"
    Допустим я на "главной странице"

    И я перейду по ссылке "Контакты"
    Допустим я на "главной странице"

    И я перейду по ссылке "Оферта"
    Допустим я на "главной странице"

    И я перейду по ссылке "FAQ"
    Допустим я на "главной странице"

    И я перейду по ссылке "Прессе"
    Допустим я на "главной странице"

    И я перейду по ссылке "Партнёрам"
    Допустим я на "главной странице"

    И я перейду по ссылке "Корпоративным клиентам"
    Допустим я на "главной странице"

    И я перейду по ссылке "Оставить отзыв"
    Допустим я на "главной странице"

    И я перейду по ссылке "Предложить заведение"
    Допустим я на "главной странице"

    И я перейду по ссылке "Как это работает"
    Допустим я на "главной странице"
