/*
Filename : disarm-parameters.sql
Purpose  : To make a Odoo database copy stop sending and receiving mails and remove expiration data, mask Sirris License code
History  :
20210602   MEY adapted, from now on we delete the definition of the mailservers instead of setting them inactive
20210707   MEY adapted, remove 2FA by setting totp_secret to null on res_users
*/
delete from ir_mail_server;
delete from fetchmail_server;
-- update fetchmail_server set active='f' ;
-- update ir_mail_server set active='f';
update ir_cron set active='f';
update ir_config_parameter set value='4c6928ce-0a07-11eb-9755-000c2959505c' where key='database.uuid';
update ir_config_parameter set value='http://odoodebug.sirris.be' where key='web.base.url';
update ir_config_parameter set value='DEBUG' where key='ribbon.name';
update ir_config_parameter set value='rgba(0,255,255,.6)' where key='ribbon.background.color';
update ir_config_parameter set value='https://crystalxxx.sirris.be/crystal11' where key='sirris_crystal_web_root';
delete from ir_config_parameter where key='database.expiration_date';
delete from ir_config_parameter where key='database.expiration_reason';
delete from ir_config_parameter where key='database.enterprise_code';
update res_users set totp_secret = null ;
