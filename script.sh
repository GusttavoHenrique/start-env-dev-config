#!/bin/bash

set -e

function app_checker() {
	which "$1" | grep -o "$1" > /dev/null &&  return 0 || return 1
}

function print_installed() {
	echo "The $1 already installed!";
}

function print_installing() {
	echo "Installing the $1...";
}

function print_complete_installation() {
	echo "The $1 installation is complete!";
}

function install_application() {
	application="$1"
	commands="$2"

	if app_checker $application == 0
	then
		print_installed $application;
	else
		print_installing $application;
		
		for command in "${commands[@]}";
		do
			$command
		done

		print_complete_installation $application;
	fi
}

# Installing Curl
function install_curl() {
	commands=('sudo apt install curl');
	install_application 'curl' "${commands[@]}";
}

# Installing Snap
function install_snapd() {
	commands=('sudo apt install snapd');
	install_application 'snapd' "${commands[@]}";
}

# Installing Slack
function install_slack() {
	commands=('sudo snap install slack --classic');
	install_application 'slack' "${commands[@]}";
}

# Installing Intellij Community
function install_intellij_community() {
	commands=("sudo snap install intellij-idea-community --classic");
	install_application 'intellij-idea-community' "${commands[@]}";
}

# Installing Goland
function install_goland() {
	commands=('sudo snap install goland --classic');
	install_application 'goland' "${commands[@]}";
}

# Installing Visual Code Studio
function install_visual_studio_code() {
	commands=('sudo snap install code --classic');
	install_application 'code' "${commands[@]}";
}

# Installing Insomnia
function install_insomnia() {
	commands=('sudo snap install insomnia');
	install_application 'insomnia' "${commands[@]}";
}

# Installing Dbeaver
function install_dbeaver() {
	commands=('sudo snap install dbeaver-ce');
	install_application 'dbeaver-ce' "${commands[@]}";
}

# Installing AWS CLI
function install_aws_cli() {
	commands=('curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"' 'unzip awscliv2.zip' 'sudo ./aws/install');
	install_application 'aws' "${commands[@]}";
}

# Installing Sublime Text
function install_sublime_text() {
	commands=('sudo snap install sublime-text --classic');
	install_application 'sublime-text' "${commands[@]}";
}

# Installing Wine
function install_wine() {
	commands=('sudo snap install wine-platform-runtime');
	install_application 'wine-platform-runtime' "${commands[@]}";
}

# Installing Docker Compose
function install_docker_compose() {
	commands=('sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose' 'sudo chmod +x /usr/local/bin/docker-compose');
	install_application 'docker-compose' "${commands[@]}";
}

# Installing Git
function install_git() {
	commands=('sudo snap install git-ubuntu --classic');
	install_application 'git-ubuntu' "${commands[@]}";
}

# Installing Groovy
function install_groovy() {
	commands=('sudo snap install groovy --classic');
	install_application 'groovy' "${commands[@]}";
}

# Installing Golang
function install_golang() {
	commands=('sudo snap install go --classic');
	install_application 'go' "${commands[@]}";
}

# Installing Docker
function install_docker() {
	commands=('sudo snap install docker');
	install_application 'docker' "${commands[@]}";
}

# Installing JDK
function install_jdk() {
	commands=('sudo add-apt-repository ppa:openjdk-r/ppa' 'sudo apt-get update' 'sudo apt-get install openjdk-8-jdk');
	install_application 'openjdk-8-jdk' "${commands[@]}";
}

function init() {
	sudo apt update;

	init_primitive_installations;
	init_snap_installations;
}

function init_primitive_installations() {
	install_curl;
	install_snapd;
	install_wine;
	install_jdk;
	install_aws_cli;
	install_docker_compose;
}

function init_snap_installations() {
	install_slack;
	install_intellij_community;
	install_goland;
	install_visual_studio_code;
	install_insomnia;
	install_dbeaver;
	install_sublime_text;
	install_groovy;
	install_golang;
	install_docker;
	install_git;
}

init;
