
server {
    listen 127.0.0.1:80;
    access_log off;
    error_log off;
    server_name jonstechsupport.com;
    return 301 https://$server_name$request_uri;
}
server {
    listen 127.0.0.1:80;
    access_log off;
    error_log off;
    server_name www.jonstechsupport.com;
    return 301 https://$server_name$request_uri;
}
