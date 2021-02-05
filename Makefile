ifndef SYMFONY_AUTOSERVE
  $(error SYMFONY_AUTOSERVE is not defined. Please source setup.[c]sh)
endif

symfony:
	@$(SYMFONY_AUTOSERVE)/bin/symfony-autoserve

redis:
	@apt-get install -y redis-server
	@npm install -g redis-commander
	@ln -sf $(SYMFONY_AUTOSERVE)/etc/init.d/redis-commander /etc/init.d
	@chmod 755 /etc/init.d/redis-commander
	@systemctl daemon-reload
	@/etc/init.d/redis-commander restart

install:
	@ln -sf $(SYMFONY_AUTOSERVE)/etc/init.d/symfony-autoserve /etc/init.d
	@chmod 755 /etc/init.d/symfony-autoserve
