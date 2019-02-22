awk /'cron/ || /CRON/,!/sudo/' /var/log/syslog | awk 'NF < 13' >> /home/gipen/gipen/modul1/syslog5.log
