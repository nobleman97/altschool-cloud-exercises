``` yaml
---
  - name: Setup Web Server
    hosts: all
    become: true
    become_method: sudo
    tasks:
      - name: Install Apache Server
        apt: name=apache2 state=present

 
      - name: Set timezone to Africa/Lagos
        timezone:
          name: Africa/Lagos

      - name: "Creating a file with content"
        copy:
          dest: /var/www/html/index.php
          content: |
            <?php
            date("F d, Y h:i:s A e", time());
            ?>
          mode: '0744'

```