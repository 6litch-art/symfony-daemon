ifndef SYMFONY_AUTOSERVE
  $(error SYMFONY_AUTOSERVE is not defined. Please source setup.[c]sh)
endif

symfony:
	@$(SYMFONY_AUTOSERVE)/bin/symfony-autoserve

rabbitmq:
	@curl -fsSL https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc | sudo apt-key add -
	@apt-key adv --keyserver "hkps://keys.openpgp.org" --recv-keys "0x0A9AF2115F4687BD29803A206B73A36E6026DFCA"
	@apt-get install apt-transport-https
	@apt-get install -y erlang-base erlang-asn1 erlang-crypto erlang-eldap erlang-ftp erlang-inets erlang-mnesia erlang-os-mon erlang-parsetools erlang-public-key erlang-runtime-tools erlang-snmp erlang-ssl erlang-syntax-tools erlang-tftp erlang-tools erlang-xmerl
	@apt-get install -y rabbitmq-server

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
	@cp -p $(SYMFONY_AUTOSERVE)/share/symfony.xml /etc/symfony.xml
