#!/usr/bin/python

import apache_log_parser
from pprint import pprint

line_parser = apache_log_parser.make_parser("%h <<%P>> %t %Dus \"%r\" %>s %b  \"%{Referer}i\" %1 %u")

# ("?? %t ?? [pid%P]
log_line_date = line_parser('''Feb 11 12:42:58 ops-tools01.qa.bigfishgames.com httperror: [Thu Feb 11 12:42:58.783066 2016] [:error] [pid 26809] [client 10.0.0.7:59358] script '/websites/bfg/share/sites/prod_cm/index.php' not found or unable to stat, referer: https://ops-tools.qa.bigfishgames.com/prod_cm/index.php?sort=ASC&order=event_date&scrollPosition=0&showMsgs=tru''')

pprint(log_line_data)

