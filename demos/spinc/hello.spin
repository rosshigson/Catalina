'
'  A simple Spin program that demonstrates the use of the Catalina 
'  HMI plugin.
'

OBJ
   HMI : "Catalina_HMI"

DAT

str1 byte "hello, world!",13,10,0

str2 byte "goodbye, world!",13,10,0
   
PUB Hello | key

   HMI.find_hmi
   HMI.t_string(1, @str1)
   key := HMI.k_wait
   HMI.t_string(1, @str2)
