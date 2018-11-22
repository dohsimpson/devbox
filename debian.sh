if [ `whoami` != 'root' ]
  then
    echo "Must run as root"
    exit
fi

cat /etc/os-release | grep '^NAME='

apt-get update
apt-get install -y build-essential software-properties-common curl git man-db python perl vim wget zsh python-dev ctags cloc tree sudo locales python3 net-tools
[ command -v openssh-server >/dev/null ] || apt-get install openssh-server

# locale
echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen en_US.UTF-8

# tmux
curl https://gist.githubusercontent.com/dohsimpson/0285d12fb12a633e2cc9e6f36a83a2fb/raw/c46669f1ed668526bbb71d97efa9eba4f9860212/tmux-install-2-5.sh | bash

# vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update
sudo apt-get install -y vim

# ssh
service ssh start
mkdir -p ~/.ssh
(cd /tmp/ && wget -nH --cut-dirs=100 -A pub -np -r https://enting.org/share/pubkeys/)
cat /tmp/*.pub >> ~/.ssh/authorized_keys

curl "https://bootstrap.pypa.io/get-pip.py" | python3

pip3 install pipenv
# DEV TOOLS
pip3 install prospector autopep8 jedi

curl "https://raw.githubusercontent.com/rupa/z/master/z.sh" > ~/.z.sh
chmod u+x ~/.z.sh

chsh -s `which zsh`

curl https://raw.githubusercontent.com/dohsimpson/dotfiles/master/setup.sh | bash

rm ~/setup.sh
