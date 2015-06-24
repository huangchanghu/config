export JAVA_HOME=/home/$USER/apps/jdk/jdk1.7
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

export M2_HOME=/home/$USER/apps/apache-maven
export M2=$M2_HOME/bin 
export MAVEN_OPTS="-Xms256m -Xmx512m" 
export PATH=$M2:$PATH

#cheat高亮
export CHEATCOLORS=true

export EDITOR=vimx
export VISUAL=vimx

#virtualenvwrapper配置
export WORKON_HOME=~/.envs
source /usr/bin/virtualenvwrapper.sh
