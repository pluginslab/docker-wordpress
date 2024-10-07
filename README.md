# WordPress Docker Compose with New Relic

This is a Docker Compose project that spins up a WordPress installation using Nginx, Mailhog, MariaDB, and New Relic. It includes WP-CLI for easy WordPress management.

The WordPress files are mounted to a folder called `data`, and the database files are mounted to a folder called `db_data`. When you stop the container, the data will not be deleted. They get only deleted if you bring the container down.

## Automatic Installation

1. Clone the repository: `git clone https://github.com/pluginslab/docker-wordpress`
2. Make the install script executable by typing 'chmod +x ./install.sh'. This script will automate parts of the installation process.
3. Then, type './install <NAME_OF_SITE>' where name of site is the name of the website you're spinning up. 

## Manual Installation

1. Clone the repository: `git clone https://github.com/pluginslab/docker-wordpress`
2. Copy the .env.example file to a new file called .env: `cp .env.example .env` and change the necessary values
3. Run the command `docker-compose up -d` on the root of the project folder to start the container.
4. To install WordPress using WP-CLI, run the command `docker-compose exec wordpress bash` to open a shell inside the WordPress container, and then run WP-CLI commands as usual: `wp core download --path=/var/www/html --allow-root`
5. After gaining shell access to the WordPress container, configure WordPress with database details: `wp core config --dbname=database --dbuser=user --dbpass=password --dbhost=mariadb --allow-root`
6. Open your browser and go to `http://localhost:8080` (or change `8080` to match the port defined in your `docker-compose.yml` file under 'ports').
7. To access Mailhog, go to `http://localhost:8025`.
8. To stop the containers, run the command `docker-compose down` inside the root of the repo folder.

Reminder: You might need to adjust file permissions or ownership in your WordPress directory, depending on your system setup.

## Contributing

1. Fork the repository.
2. Create a new branch: `git checkout -b new-feature`.
3. Make your changes and commit them: `git commit -am 'Add new feature'`.
4. Push to the branch: `git push origin new-feature`.
5. Submit a pull request.

## License

This project is licensed under the MIT License.


