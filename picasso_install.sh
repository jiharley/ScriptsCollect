cd ~
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node
source ~/.nvm/nvm.sh
nvm install v6.9.5
~/.nvm/versions/node/v6.9.5/bin/npm install -g nrm --registry=https://registry.npm.taobao.org
~/.nvm/versions/node/v6.9.5/bin/nrm use taobao
~/.nvm/versions/node/v6.9.5/bin/npm install -g typescript
~/.nvm/versions/node/v6.9.5/bin/npm install npm@latest -g

if [ -d picasso-server ]; then
	rm -rf picasso-server
fi
git clone ssh://git@git.dianpingoa.com/mobile/picasso-server.git
cd picasso-server && ~/.nvm/versions/node/v6.9.5/bin/npm link