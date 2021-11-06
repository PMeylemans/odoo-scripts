# odoo-scripts
Scripts used for and by odoo

- install_dpendencies.sh
	- Execute in order to install the necessary modules the Odoo system needs
- odoo
	- Copy to /etc/logrotate.d
	- used to enable logging, also create the target
		- mkdir var/log/odoo
		- chown odoo:root /varlog/odoo
- odoo.service
	- Needed to start the Odoo system as a service
	- copy this file to /etc/systemd/system/
