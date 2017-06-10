#!/usr/bin/perl
# Probado en OPENBSD 5.8
# Auto cargando pf
#

$tarjeta = ´ppppoe0´

$ip = `/sbin/ifconfig $tarjeta 2> /dev/null | grep inet | head -1 | awk '{ print \$2 }'` || die "arreglalo.\n";
###$tes = `/bin/echo $ip > /dev/ttyC0`;

$pf = `/sbin/pfctl -sr  | grep $ip`;
if ($pf) {
#        print "$tes";
} else {
        print "ejecutando pf con nueva ip $ip\n";
        system("/sbin/pfctl -d");
        system("/sbin/pfctl -e");
        system("/sbin/pfctl -f /etc/pf.conf");
        system("/bin/sleep 10");
}

