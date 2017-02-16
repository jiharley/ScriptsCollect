{
	nvm_detect_profile() {
	  if [ -n "${PROFILE}" ] && [ -f "${PROFILE}" ]; then
	    echo "${PROFILE}"
	    return
	  fi

	  local DETECTED_PROFILE
	  DETECTED_PROFILE=''
	  local SHELLTYPE
	  SHELLTYPE="$(basename "/$SHELL")"

	  if [ "$SHELLTYPE" = "bash" ]; then
	    if [ -f "$HOME/.bashrc" ]; then
	      DETECTED_PROFILE="$HOME/.bashrc"
	    elif [ -f "$HOME/.bash_profile" ]; then
	      DETECTED_PROFILE="$HOME/.bash_profile"
	    fi
	  elif [ "$SHELLTYPE" = "zsh" ]; then
	    DETECTED_PROFILE="$HOME/.zshrc"
	  fi

	  if [ -z "$DETECTED_PROFILE" ]; then
	    if [ -f "$HOME/.profile" ]; then
	      DETECTED_PROFILE="$HOME/.profile"
	    elif [ -f "$HOME/.bashrc" ]; then
	      DETECTED_PROFILE="$HOME/.bashrc"
	    elif [ -f "$HOME/.bash_profile" ]; then
	      DETECTED_PROFILE="$HOME/.bash_profile"
	    elif [ -f "$HOME/.zshrc" ]; then
	      DETECTED_PROFILE="$HOME/.zshrc"
	    fi
	  fi

	  if [ ! -z "$DETECTED_PROFILE" ]; then
	    echo "$DETECTED_PROFILE"
	  fi
	}
}


command curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
command export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/mirrors/node

source "$(nvm_detect_profile)"
nvm install v6.9.5
~/.nvm/versions/node/v6.9.5/bin/npm install -g nrm --registry=https://registry.npm.taobao.org
~/.nvm/versions/node/v6.9.5/bin/nrm use taobao
~/.nvm/versions/node/v6.9.5/bin/npm install -g typescript
git clone git@code.dianpingoa.com:mobile/picasso-server.git
cd picasso-server && ~/.nvm/versions/node/v6.9.5/bin/npm link