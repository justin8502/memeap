# memeap
A Portal for Captivating Memes
This project works by creating a wifi network on once device, which forwards all traffic to an apache server on the network. 
### Network Layout
Upon running create_wifi.bash, the network should look like this:
################################################################################ <br>
|DHCP Server|---------------------|Clients| <br>
(10.0.0.1/24)---------------(10.0.0.10-10.0.0.250) <br>
################################################################################ <br>
