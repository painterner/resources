local_addr=$1
local_port=$2
remort_addr=$3
remort_port=$4

iptables -t nat -A PREROUTING -p tcp --dport $local_port -j DNAT --to-destination $remort_addr:$remort_port
iptables -t nat -A POSTROUTING -p tcp -d $remort_addr --dport $remort_port -j SNAT --to-source $local_addr

iptables -t nat -A PREROUTING -p udp --dport $local_port -j DNAT --to-destination $remort_addr:$remort_port
iptables -t nat -A POSTROUTING -p udp -d $remort_addr --dport $remort_port -j SNAT --to-source $local_addr
