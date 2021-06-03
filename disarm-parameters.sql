/*
Filename : disarm-parameters.sql
Purpose  : To make a Odoo database copy stop sending and receiving mails and remove expiration data, mask Sirris License code
History  :
20210602   MEY adapted, from now on we delete the definition of the mailservers instead of setting them inactive
*/
delete from ir_mail_server;
delete from fetchmail_server;
-- update fetchmail_server set active='f' ;
-- update ir_mail_server set active='f';
update ir_cron set active='f';
update ir_config_parameter set value='4c6928ce-0a07-11eb-9755-000c2959505c' where key='database.uuid';
update ir_config_parameter set value='http://odotest.sirris.be' where key='web.base.url';
update ir_config_parameter set value='Copy live 25-05-2021' where key='ribbon.name';
update ir_config_parameter set value='rgba(0,255,255,.6)' where key='ribbon.background.color';
delete from ir_config_parameter where key='database.expiration_date';
delete from ir_config_parameter where key='database.expiration_reason';
delete from ir_config_parameter where key='database.enterprise_code'
