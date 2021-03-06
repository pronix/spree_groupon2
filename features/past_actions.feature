#language: ru

Функционал: 
  Тестирование раздела "Прошедшие акции"
  Это архив который содержит прошедшие акции, те акции которые были приобретены за баблосы а не за бонусы
 
  Предыстория:
    Допустим в системе присутствуют следующие разделы для акций "Туризи и гостинници, Рестораны, Развлечения и спорт"
    # terms - Условия(может быть несколько)
    # Features - Особенности(может быть несколько)
    Допустим в системе присутствуют следующие акции:
      | name                                      | percentage | price | description   | type                | terms                     | features                         | bayes | created_at  |
      | Скидка 40% на традиционный тайский массаж | 40         | 111   | description_1 | Развлечения и спорт | terms_1, terms_2          | График работы: с 11:00 до 23:00. | 555   | Time.now    |
      | Отдых на кипре 50%                        | 20         | 222   | description_2 | Туризи и гостинници | terms_3                   | График работы: с 11:00 до 22:00. | 666   | 1.month.ago |
      | Скидка 50% на воскресные обеды Капри      | 20         | 333   | description_3 | Рестораны           | terms_4, terms_5, terms_6 | График работы: с 11:00 до 21:00. | 777   | 2.month.ago |
      | Скидка 40% на всё меню в суши-баре Лотос  | 30         | 444   | description_4 | Рестораны           | terms_7                   | График работы: с 11:00 до 20:00. | 888   | 2.month.ago |
    Допустим на "Скидка 40% на традиционный тайский массаж" есть следующие комментарии "comment_1, comment_2, comment_3"
    Допустим зарегистрирован пользователь "user@ya.ru/secret"
    И я перехожу по ссылке "Прошедшие акции"

  Сценарий: Смотрим раздел лазием по меню
    И я увижу "Скидка 40% на традиционный тайский массаж"
    И я не увижу "Отдых на кипре 50%"
    И я не увижу "Скидка 50% на воскресные обеды Капри"
    И я не увижу "Скидка 40% на всё меню в суши-баре Лотос"

  Сценарий: Смотрим раздел лазием по меню
    И я перейду по ссылке "Март"
    И я не увижу "Скидка 40% на традиционный тайский массаж"
    И я увижу "Отдых на кипре 50%"
    И я не увижу "Скидка 50% на воскресные обеды Капри"
    И я не увижу "Скидка 40% на всё меню в суши-баре Лотос"

  Сценарий: Смотрим раздел лазием по меню
    И я перейду по ссылке "Февраль"
    И я не увижу "Скидка 40% на традиционный тайский массаж"
    И я не увижу "Отдых на кипре 50%"
    И я увижу "Скидка 50% на воскресные обеды Капри"
    И я увижу "Скидка 40% на всё меню в суши-баре Лотос"

  Сценарий: Смотрим прошедшую акцию и оставляем комментарий
    И я перехожу по ссылке "Скидка 40% на традиционный тайский массаж"
    И я увижу "description_1"

    И я перехожу по ссылке "Условия акции"
    И я увижу в условиях "terms_1"
    И я увижу в условиях "terms_2"
    И я увижу в особеностях "График работы: с 11:00 до 23:00."
    И я увижу google карту с обозначенным местом проведения

    И я перехожу по ссылке "Комментарии"
    И я увижу "comment_1"
    И я увижу "comment_2"
    И я увижу "comment_3"
    И я перейду по ссылке "Добавить комментарий"
    И я в поле "Комментарий" запишу "comment_4"
    И я нажму "Добавить"
    И я увижу "comment_4"
    И я увижу "Ваш комментарий поставлен в очередь модерации, скоро он появится на сайте."

    И я перейду по ссылке "Добавить комментарий"
    И я в поле "Комментарий" запишу "comment_4"
    И я перейду по ссылке "Отмена"

  Сценарий: Проверяем наличие сопутствующей информацию по акции
    И я перехожу по ссылке "Скидка 40% на традиционный тайский массаж"
    И я увижу цену акции "111"
    И я увижу статус акции "Завершена"
    И я увижу скидку "20"
    И я увижу что купили эту акцию "555" человек
    
