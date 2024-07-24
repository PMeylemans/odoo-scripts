Here are the definitions to be created in the cronab of the respectively machines and accounts

|Server	            |User	 |Cron	                                                     |What	                                                 |Description                                               |
|odoo.sirris.be	    |root	 |                                                           |                                                       |                                                          |
|                   |        |5 * * * * /users/cron/scripts/create_odoo_login_data.sh	 |Extract successful and failed login attempts in Odoo	 |Files created are synchronized to Crystal -> datamatrix dB|
|Crystal.sirris.be	|root	 |                                                           |                                                       |                                                          |
|                   |        |9 * * * * /users/cron/scripts/odoo/rsync_odoo_logins.sh	 |Create a regular copy of the files (login info @odoo)	 |Should be onserted in the "datamatrix" database           |
|                   |postgres|                                                           |                                                       |                                                          |
|                   |        |15 * * * * /users/postgresql/scripts/clean_and_load_data.sh|Load login data from the Odoo system into central db   | 	Data extracted from the logfiles "odoo" server          |
