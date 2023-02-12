# Resolving issues:

When I was getting an error about permission being denied in the container, I had to run the following lines of code to fix it:
``` bash
sudo chown -R $USER:www-data ~/laravel-app
sudo find ~/laravel-app -type f -exec chmod 664 {} \;
sudo find ~/laravel-app -type d -exec chmod 775 {} \;
sudo chgrp -R www-data storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache
```

In order to get the correct uid to use in the docker-compose.yml, I had to look it up by running:
``` bash
$ cat /etc/passwd 
```

My guide was: [here](https://medium.com/@CloudTopG/how-to-install-and-set-up-laravel-nginx-and-mysql-with-docker-compose-on-ubuntu-20-04-291462d7202d)



