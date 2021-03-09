from harrycb/python3.7torch1.5.0 as build

# If private git repo in requirements.txt then
# we use a multi-stage build
arg ssh_key
run mkdir /root/.ssh
run ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
run echo "${ssh_key}" >> /root/.ssh/id_rsa
run chmod -R 0600 /root/.ssh
copy requirements.txt .
run pip install -r requirements.txt
run chown -R root:root /usr/local/lib/python3.7/site-packages/

from python:3.7-stretch

run pip install --upgrade pip uvicorn
copy --from=build /usr/local/lib/python3.7/site-packages/ /usr/local/lib/python3.7/site-packages/
copy . .
expose 8000
CMD uvicorn main:app --port ${PORT-8000} --host ${HOST-0.0.0.0}
