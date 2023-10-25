# Install dependencies
#   - dialog: utility for text interface dialog boxes
#   - git: version control tool for pulling required Git repositories
#   - httpd-tools: httpd utils, including htpasswd to generate passwords for basic auth
#   - podman: Container management utility
#   - podman-compose: docker-compose compatibility for Podman
#   - podman-docker: Docker-compatible aliases for Podman commands
dnf -y install dialog git httpd-tools podman podman-compose podman-docker
