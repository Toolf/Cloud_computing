# Cloud computing

# Network configuration
```
      /----(http-server.1)----\
(nginx)                     (mysql-server)
      \----(http-server.2)----/
```
## IP table

| server        | ip          |
| ------------- | ----------- |
| nginx         | 192.168.1.1 |
| http-server.1 | 192.168.1.2 |
| http-server.2 | 192.168.1.3 |
| mysql-server  | 192.168.1.4 |
