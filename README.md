# FreeRADIUS Docker image with MySQL and Python3

[![GitHub Workflow Status](https://github.com/iquiw/docker-freeradius-python3/actions/workflows/docker.yml/badge.svg)](https://github.com/iquiw/docker-freeradius-python3/actions/workflows/docker.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/iquiw/freeradius-python3)](https://hub.docker.com/r/iquiw/freeradius-python3)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/iquiw/freeradius-python3)](https://hub.docker.com/r/iquiw/freeradius-python3)

This is FreeRADIUS 3.0.x Docker image based on Ubuntu 22.04.

The following modules are enabled in addition to default ones.

* python3
* sql (mysql)
* sqlippool

## Environment Variables

| Variable                             | Description                                | Default                 |
| ---                                  | ---                                        | ---                     |
| FREERADIUS_MYSQL_HOST                | MySQL server hostname.                     | mysql                   |
| FREERADIUS_MYSQL_PORT                | MySQL server port.                         | 3306                    |
| FREERADIUS_MYSQL_USER                | MySQL user to connect to DB.               | root                    |
| FREERADIUS_MYSQL_PASSWORD            | MySQL user's password.                     |                         |
| FREERADIUS_MYSQL_DATABASE            | MySQL DB name.                             | radius                  |
| FREERADIUS_PYTHON3_MODULE            | Name of Python3 module.                    | example                 |
| FREERADIUS_PYTHON3_CALLBACKS         | Space separated list of callback names.    |                         |
| FREERADIUS_PYTHON3_PASS_ALL_VPS      | Value of pass_all_vps (`yes` or `no`)      |                         |
| FREERADIUS_PYTHON3_PASS_ALL_VPS_DICT | Value of pass_all_vps_dict (`yes` or `no`) |                         |
| FREERADIUS_PYTHON3_PATH              | Paths to Python3 modules.                  | ${modconfdir}/${.:name} |
