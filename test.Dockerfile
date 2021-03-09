from harrycb/python3.7torch1.5.0
workdir /app
# Only Needed for private git repo's in requirements.txt {
arg ssh_key
run mkdir /root/.ssh
run ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
run echo "${ssh_key}" >> /root/.ssh/id_rsa
run chmod -R 0600 /root/.ssh
# }
copy requirements.txt .
run pip install -r requirements.txt pytest
copy . .
run pytest tests