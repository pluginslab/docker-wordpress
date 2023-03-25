# WordPress Docker Compose with New Relic

This is a Docker Compose project that spins up a WordPress installation using Nginx, Mailhog, MariaDB, and New Relic. It includes WP-CLI for easy WordPress management.

The WordPress files are mounted to a folder called `data`, and the database files are mounted to a folder called `db_data`. When you stop the container, the data will not be deleted. They get only deleted if you bring the container down.

## Installation

1. Clone the repository: `git clone https://github.com/pluginslab/docker-wordpress`
2. Copy the .env.example file to a new file called .env: `cp .env.example .env` and change the necessary values
3. If you're using New Relic, make sure you change the `NEWRELIC_ENABLED` to `true` and add the license key
4. Run the command `docker-compose -f docker-compose.yml up` to start the container. If you want New Relic to be installed as well, run this command instead: `docker-compose -f docker-compose-nr.yml up`

## Usage

1. To install WordPress using WP-CLI, run the command `docker-compose exec wordpress bash` to open a shell inside the WordPress container, and then run WP-CLI commands as usual: `wp core download --path=/var/www/html --allow-root`
2. Then, to configure WordPress with the details included, run the command `wp core config --dbname=database --dbuser=user --dbpass=password --dbhost=mariadb`
3. Open your browser and go to `http://localhost:8080` to access the WordPress installation.
4. To access Mailhog, go to `http://localhost:8025`.
5. To view your New Relic dashboard, go to `https://rpm.newrelic.com`. If you don't see any data, wait a few minutes for the data to propagate.
6. To stop the containers, run the command `docker-compose -f docker-compose.yml down` or `docker-compose -f docker-compose-nr.yml down`.

## Contributing

1. Fork the repository.
2. Create a new branch: `git checkout -b new-feature`.
3. Make your changes and commit them: `git commit -am 'Add new feature'`.
4. Push to the branch: `git push origin new-feature`.
5. Submit a pull request.

## License

This project is licensed under the MIT License.


