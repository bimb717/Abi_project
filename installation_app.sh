#!/bin/bash
su - ec2-user -c 'cd /home/ec2-user/ && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py'
su - ec2-user -c 'cd /home/ec2-user/ && python3 get-pip.py --user'
su - ec2-user -c 'cd /home/ec2-user/ && python3 -m pip install --user ansible'
touch /home/ec2-user/server_vars.yml
chown ec2-user:ec2-user /home/ec2-user/server_vars.yml
touch /home/ec2-user/playbook.yml
chown ec2-user:ec2-user /home/ec2-user/playbook.yml
chmod 0644 /home/ec2-user/server_vars.yml /home/ec2-user/playbook.yml
echo "Writing server config"
echo -e "metadata_server_type: app" > /home/ec2-user/server_vars.yml
echo "Writing playbook contents to yml file"
echo -e '
---
  - name: "Setup and install software for app server"
    hosts: localhost
    connection: local 
    tasks:
    - name: "Include server variables"
      include_vars: server_vars.yml
    - name: Install Apache
      yum:
        name: httpd
        state: present
      become: true
      when: metadata_server_type == "app"
    - name: Make sure a service unit is running
      ansible.builtin.systemd:
        state: started
        name: httpd
      become: true
      when: metadata_server_type == "app"
    - name: Enable service httpd
      ansible.builtin.systemd:
        name: httpd
        enabled: true
      become: true
      when: metadata_server_type == "app"
  - name: "Setup and install software for web server"
    hosts: localhost
    connection: local 
    tasks:
    - name: "Include server variables"
      include_vars: server_vars.yml
    - name: Install nginx
      yum:
        name: nginx
        state: present
      become: true
      when: metadata_server_type == "web"
    - name: Make sure a service unit is running
      ansible.builtin.systemd:
        state: started
        name: nginx
      become: true
      when: metadata_server_type == "web"
    - name: Enable service nginx
      ansible.builtin.systemd:
        name: nginx
        enabled: true
      become: true
      when: metadata_server_type == "web"' >> /home/ec2-user/playbook.yml
echo "Running server config playbook"
su - ec2-user -c 'cd /home/ec2-user/ && ansible-playbook playbook.yml'