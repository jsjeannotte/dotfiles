# Wireshark format dump on EC2 instances

    sudo /usr/sbin/tcpdump -ni eth0 -s0 -w capture.pcap

# Sniff traffic 

    sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'

# HTTP Dump

    tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"

# Other usecases

    tcpdump -nl -i bge0 not port ssh and src \(192.168.16.121 or 192.168.16.54\)
    tcpdump -n -i eth1 net 192.168.16.121

# select to/from a single IP
    
    tcpdump -n -i eth1 net 192.168.16.0/24

# select traffic to/from a network
    
    tcpdump -l > dump && tail -f dump

# Buffered output

    tcpdump -i rl0 -w traffic.rl0

# Write traffic headers in binary file

    tcpdump -i rl0 -s 0 -w traffic.rl0

# Write traffic + payload in binary file

    tcpdump -r traffic.rl0

# Read from file (also for ethereal)

    tcpdump port 80

# The two classic commands# tcpdump host google.com

    tcpdump -i eth0 -X port \(110 or 143\)

# Check if pop or imap is secure

    tcpdump -n -i eth0 icml

# Only catch pings
    
    tcpdump -i eth0 -s 0 -A port 80 | grep GET

# Additional important options:

    * -s 0      Full Packet
    * -A        Print each packets in clear text (without header)
    * -X        Print packets in hex and ASCII
    * -l        Make stdout line buffered
    * -D        Print all interfaces available
