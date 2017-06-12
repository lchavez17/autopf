#!/usr/bin/perl
#
# Auto cargando pf para interface pppoe, funciona en OpenBSD 6.1
# 

$ip = `/sbin/ifconfig pppoe0 2> /dev/null | grep inet | head -1 | awk '{ 
print \$2 }'` || die "if error arreglalo lazaax.\n";
#$tes = `/bin/echo $ip > /dev/ttyC0`;

$pf = `/sbin/pfctl -sr  | grep $ip`;
if ($pf) {
#        print "$tes";
} else {
        print "ejecutando pf con nueva ip $ip\n";
        system("/usr/bin/pkill tail");
        system("/usr/bin/pkill tcpdump");       
        system("/sbin/pfctl -d");
        system("/sbin/pfctl -e");
        system("/sbin/pfctl -f /etc/pf.conf");
        system("/usr/sbin/tcpdump -o -N -nettt -vvvv -i pflog0 > /dev/ttyC0 &");
        system("/usr/bin/tail -f /var/log/messages > /dev/ttyC0\n");
        system("/usr/bin/tail -f /var/log/daemon > /dev/ttyC0\n");
        system("/bin/echo sys7ipaddres:'$ip' > /dev/ttyC0\n");
        system("/bin/echo sys7ipaddres:'$ip' > /dev/ttyC0\n");
        system("/bin/echo sys7ipaddres:'$ip' > /dev/ttyC0\n");
        system("/bin/echo sys7ipaddres:'$ip' > /dev/ttyC0\n");
}

#lzx
