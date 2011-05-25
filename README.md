SpreeGroupon2
=============

Introduction goes here.

Installation
============

*Временно
Создать файл config/sms_gateway.yml в папке проекта и туда:
gateway: qtelecom
login: qtelecom_login
password: qtelecom_password
ssl: true

echo "gem 'spree_easy_contact'" >> Gemfile



rake spree:install
rake spree_easy_contact:install
rake spree_groupon2:install
rake db:bootstrap


Настройка
==========
В админке
/admin/mail_methods


Example
=======

Example goes here.


Copyright (c) 2011 [name of extension creator], released under the New BSD License
