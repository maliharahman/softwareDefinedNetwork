install: sdn_tui-bengali.mo
	install sdn sdn_tui /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat sdn.services`" /etc/services || cat sdn.services >> /etc/services
	install sdn.xinetd /etc/xinetd.d/sdn
	ln -sf /usr/local/bin/sdn_tui /usr/local/bin/sdn_net
	ln -sf /usr/local/bin/sdn_tui /usr/local/bin/sdn_gui
	install sdn_ui-bengali.mo /usr/share/locale/hu/LC_MESSAGES/sdn_ui.mo

sdn_tui.pot: sdn_tui
	xgettext -o sdn_tui.pot -L Shell sdn_tui

sdn_tui-bengali.mo: sdn_tui-bengali.po
	msgfmt -o sdn_tui-bengali.mo sdn_tui-bengali.po

clone:
	https://github.com/maliharahman/sdnproject.git

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

tags:
	git push origin --tags
